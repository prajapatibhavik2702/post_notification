<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PostNotification;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class PostNotificationController extends Controller
{
    /**
     * User data show done....
    */
    public function create()
    {
        //show user data
        $users = User::all();
        return view('users.create', compact('users'));
    }

    /**
     * send notification but when user off notification
     */
    public function store(Request $request)
    {
    //store data with validated
        $validator = Validator::make($request->all(), [
            'type' => 'required|in:marketing,invoice,system',
            'message' => 'required|string|max:60',
            'expiry_date' => 'required|date',
            'users' => 'required|array',
            'users.*' => ['required', Rule::exists('users', 'id')],
        ]);

        if ($validator->fails()) {
            return redirect()->route('posts.create')->withErrors($validator)->withInput();
        }

        $type = $request->input('type');
        $message = $request->input('message');
        $expiryDate = $request->input('expiry_date');
        $selectedUserIds = $request->input('users');

        $postNotification = new PostNotification([
            'type' => $type,
            'message' => $message,
            'expiration_date' => $expiryDate,
        ]);

        $postNotification->save();

        // Check if user wants to receive notifications (notification_on_off == 0) and attach selected users to the post notification
        if (in_array('all-user', $selectedUserIds)) {
            $users = User::where('notification_on_off', 0)->get();
        }
        else
        {
            $users = User::whereIn('id', $selectedUserIds)->where('notification_on_off', 0)->get();
        }

        $postNotification->users()->attach($users, ['read' => false]);

        return redirect()->route('posts.create')->with('success', 'Notification created successfully.');
    }

    /**
     * show notification data usee side
     */
    public function show()
    {
        //show notification user side
        $notifications = PostNotification::all();

        return view('users.show_notification', compact('notifications'));
    }

    /** user view notification.
     *
    */
    public function userview(string $id)
    {
        $pivotData = DB::table('post_notification_user')
        ->where('post_notification_id', $id)
        ->get();

        $userData = [];

        foreach ($pivotData as $item) {
            $userId = $item->user_id;
            $userData[] = User::findOrFail($userId);
        }
        return view('users.post_user_details', compact('userData','id'));

    }

    /**notification seen code
    *
    */
    public function markNotificationRead(Request $request, $notification)
    {
        $userId = $request->input('userId');

        // Ensure the notification belongs to the specified user_id
        $notificationData = DB::table('post_notification_user')
            ->where('post_notification_id', $notification)
            ->where('user_id', $userId)
            ->first();


        if ($notificationData) {
            DB::table('post_notification_user')
            ->where('post_notification_id', $notification)
            ->where('user_id', $userId)
            ->update(['read' => true]);

            return redirect()->back()->with('success', 'Notification marked as read successfully.');
        }

        return redirect()->back()->with('error', 'Notification not found or unauthorized to mark as read.');
    }


    /**search bar controller code
     *
     */
    public function search(Request $request)
    {
        $search = $request->input('search');

        // Perform the search query using $search variable
        $notifications = DB::table('post_notifications')
            ->where('type', 'LIKE', '%' . $search . '%')
            ->orWhere('message', 'LIKE', '%' . $search . '%')
            ->orWhere('expiration_date', 'LIKE', '%' . $search . '%')
            ->get();

        return view('users.show_notification', compact('notifications'));
    }
}

