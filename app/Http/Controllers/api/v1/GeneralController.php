<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Model\HelpTopic;
use App\Model\BusinessSetting;
use App\Model\SocialMedia;
use App\facebook_post;
use App\metaAdd;

class GeneralController extends Controller
{
    public function faq(){
        return response()->json(HelpTopic::orderBy('ranking')->get(),200);    
    }
    
     public function conpanyInfo(){
        
        $company_logo = BusinessSetting::where('type', 'company_web_logo')->first();
        return response()->json($company_logo,200);
    }
    
    public function conpanyInfo1(){
        
        $company_phone = BusinessSetting::where('type', 'company_phone')->first();
        return response()->json($company_phone,200);
    }
    
    public function conpanyInfo2(){
        
        $company_name = BusinessSetting::where('type', 'company_name')->first();
        return response()->json($company_name ,200);
    }
    
    public function conpanyInfo3(){
        
        $company_email = BusinessSetting::where('type', 'company_email')->first();
        return response()->json($company_email,200);
    }
    
    public function conpanyInfo4(){
        
        $company_footer_logo = BusinessSetting::where('type', 'company_footer_logo')->first();
        return response()->json($company_footer_logo,200);
    }
    
    public function conpanyInfo5(){
        
       $company_copyright_text = BusinessSetting::where('type', 'company_copyright_text')->first();
        return response()->json($company_copyright_text,200);
    }
    public function conpanyInfo6(){
        
       $company_about_us = BusinessSetting::where('type', 'about_us')->first();
        return response()->json($company_about_us,200);
    }
    
    public function terms_condition(){
        
    $company_about_us = BusinessSetting::where('type', 'terms_condition')->first();
     return response()->json($company_about_us,200);
 }
 
 public function privacy_policy(){
        
    $company_about_us = BusinessSetting::where('type', 'privacy_policy')->first();
     return response()->json($company_about_us,200);
 }
    
    public function conpanyInfo7(){
        
       $company_about_us = BusinessSetting::where('type', 'shop_address')->first();
        return response()->json($company_about_us,200);
    }
    
    public function SocialMedia1(){
       $company_about_us =SocialMedia::where('active_status', 1)->get();
        return response()->json($company_about_us,200);
    }
    
    public function facebookPost(){
       $facebookPost =facebook_post::where('status', 1)->get();
        return response()->json($facebookPost,200);
    }
    
    public function metaTitle(){
        $metaTitle =metaAdd::all();
        return response()->json($metaTitle,200);
    }
}
