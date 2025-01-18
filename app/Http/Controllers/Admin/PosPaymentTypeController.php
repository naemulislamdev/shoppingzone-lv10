<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\PosPaymentType;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class PosPaymentTypeController extends Controller
{
    public function index(Request $request)
    {
        $query_param = [];
        $search = $request['search'];

        if ($request->has('search'))
        {
            $key = explode(' ', $request['search']);
            $attributes = PosPaymentType::where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->Where('name', 'like', "%{$value}%");
                }
            });

            $query_param = ['search' => $request['search']];
        }else{
            $attributes = new PosPaymentType();
        }
        $attributes = $attributes->latest()->paginate(Helpers::pagination_limit())->appends($query_param);
        return view('admin-views.pospaymenttype.view',compact('attributes','search'));
    }

    public function store(Request $request)
    {
        $pospaymenttype = new PosPaymentType;
        $pospaymenttype->name = $request->name;
        $pospaymenttype->save();

        Toastr::success('PosPaymentType added successfully!');
        return back();
    }

    public function edit($id)
    {
        $attribute = PosPaymentType::where(['id'=>$id])->withoutGlobalScopes()->first();
        // dd($pospaymenttype);
        return view('admin-views.pospaymenttype.edit', compact('attribute'));
    }

    public function update(Request $request)
    {
        $pospaymenttype = PosPaymentType::find($request->id);
        $pospaymenttype->name = $request->name;
        $pospaymenttype->save();

        Toastr::success('PosPaymentType updated successfully!');
        return back();
    }

    public function delete(Request $request)
    {

        PosPaymentType::destroy($request->id);
        return response()->json();
    }

    public function fetch(Request $request)
    {
        if ($request->ajax()) {
            $data = PosPaymentType::orderBy('id', 'desc')->get();
            return response()->json($data);
        }
    }
}
