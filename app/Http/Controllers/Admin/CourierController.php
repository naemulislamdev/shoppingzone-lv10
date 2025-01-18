<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\Courier;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class CourierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search      = $request['search'];
        $query_param = $search ? ['search' => $request['search']] : '';
            $data = Courier::when($request['search'], function ($q) use($request){
                $key = explode(' ', $request['search']);
                foreach ($key as $value) {
                    $q->Where('name', 'like', "%{$value}%");
                }
            })->latest()->paginate(Helpers::pagination_limit($query_param));
            // dd($couriers);
           return view('admin-views.courier.index', compact('data','search'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin-views.courier.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'payable' => 'required',
            'delivery_charge' => 'required',
            'cod_charge' => 'required',
            'inside_dhaka_amount' => 'required',
            'outside_dhaka_amount' => 'required',
        ], [
            'name.required'   => 'Courier name is required!',
            'phone.required'   => 'Courier phone is required!',
            'payable.required'   => 'Courier payable is required!',
            'delivery_charge.required'   => 'Courier delivery_charge is required!',
            'cod_charge.required'   => 'Courier cod_charge is required!',
            'inside_dhaka_amount.required'   => 'Courier inside_dhaka_amount is required!',
            'outside_dhaka_amount.required'   => 'Courier Map URL is required!',
        ]);

        $courier = new Courier();
        $courier->name = $request->name;
        $courier->phone = $request->phone;
        $courier->payable = $request->payable;
        $courier->delivery_charge = $request->delivery_charge;
        $courier->cod_charge = $request->cod_charge;
        $courier->inside_dhaka_amount = $request->inside_dhaka_amount;
        $courier->outside_dhaka_amount = $request->outside_dhaka_amount;
        $courier->status = 1;
        $courier->save();


        Toastr::success('Courier added successfully!');
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $b = Courier::where(['id' => decrypt($id)])->withoutGlobalScopes()->first();
        // dd($b);
        return view('admin-views.courier.edit', compact('b'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($id);
        $request->validate([
            'name' => 'required',
            'payable' => 'required',
            'phone' => 'required',
            'delivery_charge' => 'required',
            'cod_charge' => 'required',
            'inside_dhaka_amount' => 'required',
            'outside_dhaka_amount' => 'required',
        ], [
            'name.required'   => 'Courier name is required!',
            'phone.required'   => 'Courier phone is required!',
            'payable.required'   => 'Courier payable is required!',
            'delivery_charge.required'   => 'Courier delivery_charge is required!',
            'cod_charge.required'   => 'Courier cod_charge is required!',
            'inside_dhaka_amount.required'   => 'Courier inside_dhaka_amount is required!',
            'outside_dhaka_amount.required'   => 'Courier outside_dhaka_amount is required!',
        ]);

        $courier = Courier::find($id);
        $courier->name = $request->name;
        $courier->phone = $request->phone;
        $courier->payable = $request->payable;
        $courier->delivery_charge = $request->delivery_charge;
        $courier->cod_charge = $request->cod_charge;
        $courier->inside_dhaka_amount = $request->inside_dhaka_amount;
        $courier->outside_dhaka_amount = $request->outside_dhaka_amount;
        $courier->status = $request->status;
        $courier->save();
        Toastr::success('Courier Updated successfully!');
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
