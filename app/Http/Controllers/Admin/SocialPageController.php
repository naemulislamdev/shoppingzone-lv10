<?php

namespace App\Http\Controllers\Admin;

use App\CPU\Helpers;
use App\Http\Controllers\Controller;
use App\Model\SocialPage;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class SocialPageController extends Controller
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
            $socialpages = SocialPage::when($request['search'], function ($q) use($request){
                $key = explode(' ', $request['search']);
                foreach ($key as $value) {
                    $q->Where('name', 'like', "%{$value}%");
                }
            })->latest()->paginate(Helpers::pagination_limit($query_param));
            // dd($branches);
           return view('admin-views.social-pages.index', compact('socialpages','search'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin-views.social-pages.create');
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
            'link' => 'required',
        ], [
            'name.required'   => 'Social Page name is required!',
            'link.required'   => 'Social Page LInk is required!',
        ]);

        $page = new SocialPage();
        $page->name = $request->name;
        $page->link = $request->link;
        $page->status = 1;
        $page->save();
        Toastr::success('Social Page added successfully!');
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
        $b = SocialPage::where(['id' => decrypt($id)])->withoutGlobalScopes()->first();
        // dd($b);
        return view('admin-views.social-pages.edit', compact('b'));
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
            'link' => 'required',
        ], [
            'name.required'   => 'Social Page name is required!',
            'link.required'   => 'Social Page Link is required!',
        ]);

        $socialPage = SocialPage::find($id);
        $socialPage->name = $request->name;
        $socialPage->link = $request->link;
        $socialPage->status = $request->status;
        $socialPage->save();
        Toastr::success('Social Page Updated successfully!');
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
