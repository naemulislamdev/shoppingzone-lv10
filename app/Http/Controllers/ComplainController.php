<?php

namespace App\Http\Controllers;

use App\CPU\ImageManager;
use App\Model\Complaint;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ComplainController extends Controller
{
    public function customerComplain()
    {
        if (auth('customer')->check()) {
            return view('web-views.complain');
        } else {
            Toastr::info("Please at first you need to login as customer!");
            return redirect()->route('home');
        }
    }
    public function customerComplainStore(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:140',
            'phone' => ['required', function ($attribute, $value, $fail) {
                if (!preg_match('/^(?:\+88|88)?(01[3-9]\d{8})$/', $value)) {
                    $fail('The ' . $attribute . ' must be a valid Bangladesh phone number.');
                }
            }],
            'image' => 'nullable|mimes:png,jpg,jpeg|max:2048',
            'complain_details' => 'required|string|max:500'
        ]);

        $imagePath = ImageManager::upload('complaints/', 'png', $request->file('image'));
        if ($imagePath == 'def.png') {
            $imagePath = null;
        }
        $complain = Complaint::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'reasons' => $request->complain_details,
            'images' => $imagePath,
            'status' => false
        ]);
        Toastr::success("Your complaint has been send!");
        return back();
    }

    public function showComplain(){
        echo "hello";
    }
}
