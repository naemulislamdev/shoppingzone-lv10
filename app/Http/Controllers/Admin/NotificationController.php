<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\CPU\ImageManager;
use App\Http\Controllers\Controller;
use App\Model\Notification;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Http;

class NotificationController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];
        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $notifications = Notification::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('title', 'like', "%{$value}%");
                }
            });
            $query_param = ['search' => $request['search']];
        }else{
            $notifications = new Notification();
        }
        $notifications = $notifications->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.notification.index', compact('notifications','search'));
    }

    public function store(Request $request)
{
    $request->validate([
        'title' => 'required',
        'description' => 'required',
        'url' => 'required'
    ], [
        'title.required' => 'title is required!',
    ]);

    $notification = new Notification;
    $notification->title = $request->title;
    $notification->description = $request->description;
    $notification->url = $request->url;

    if ($request->has('image')) {
        $image_path = ImageManager::upload('notification/', 'png', $request->file('image'));
        $notification->image =$image_path;
        $notification->image_url ='https://shoppingzonebd.com.bd/storage/notification/'.$image_path;
    } else {
        $notification->image = 'null';
    }


    $notification->status = 1;
    $notification->notification_count = 1;
    $notification->save();

    // Prepare the data to send to the API
    $apiData = [
        "title"=> $notification->title,
        "body"=> $notification->description,
        "image"=> $notification->image_url,
        "url"=> $notification->url,
        "topic"=>"shoppingzonebd",
    ];

    try {
        // Send the data to the API
        $response = Http::post('https://admin.szbdfinancing.com/api/send/evertech/notification', $apiData);

        // Check if the API request was successful
        if ($response->successful()) {
            Toastr::success('Notification sent successfully!');
        } else {
            Toastr::warning('Failed to send notification to API. Response: ' . $response->body());
        }
    } catch (\Exception $e) {
        Toastr::warning('Push notification failed: ' . $e->getMessage());
    }

    return back();
}//01713956717


    public function edit($id)
    {
        $notification = Notification::find($id);
        return view('admin-views.notification.edit', compact('notification'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
        ], [
            'title.required' => 'title is required!',
        ]);

        $notification = Notification::find($id);
        $notification->title = $request->title;
        $notification->description = $request->description;
        $notification->image = $request->has('image')? ImageManager::update('notification/', $notification->image, 'png', $request->file('image')):$notification->image;
        $notification->save();

        Toastr::success('Notification updated successfully!');
        return back();
    }

    public function status(Request $request)
    {
        if ($request->ajax()) {
            $notification = Notification::find($request->id);
            $notification->status = $request->status;
            $notification->save();
            $data = $request->status;
            return response()->json($data);
        }
    }

    public function resendNotification(Request $request){
        $notification = Notification::find($request->id);

        // Prepare the data to send to the API
    $apiData = [
        "title"=> $notification->title,
        "body"=> $notification->description,
        "image"=> $notification->image_url,
        "url"=> $notification->url,
        "topic"=>"shoppingzonebd",
    ];
        $data = array();
        try {
            Helpers::send_push_notif_to_topic($notification);
            $notification->notification_count += 1;
            $notification->save();
            $response = Http::post('https://admin.szbdfinancing.com/api/send/evertech/notification', $apiData);
            $data['success'] = true;
            $data['message'] = \App\CPU\translate("Push notification successfully!");
        } catch (\Exception $e) {
            $data['success'] = false;
            $data['message'] = \App\CPU\translate("Push notification failed!");
        }

        return $data;
    }

    public function delete(Request $request)
    {
        $notification = Notification::find($request->id);
        ImageManager::delete('/notification/' . $notification['image']);
        $notification->delete();
        return response()->json();
    }
}
