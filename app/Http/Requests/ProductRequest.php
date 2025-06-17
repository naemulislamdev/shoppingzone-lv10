<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Arr;

class ProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
            $images = 'required|max:3072';
            $image = 'required|max:3072';
            $code = 'required|min:3|max:30|unique:products,code';
        if(request()->route()->id){
            $images = 'nullable';
            $image = 'nullable';
            //Unique code
            $pId = request()->route()->id;
            $code = 'required|min:3|max:30|unique:products,code,'.$pId;
        }
        return [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'short_description' => 'nullable|string',
            'category_id' => 'required',
            'brand_id' => 'required',
            'unit' => 'required',
            'images' => $images,
            'image' => $image,
            'tax' => 'required|min:0',
            'unit_price' => 'required|numeric|min:1',
            'purchase_price' => 'required|numeric|min:1',
            'discount' => 'required|gt:-1',
            'shipping_cost' => 'required|gt:-1',
            'code' => $code,
            'minimum_order_qty' => 'required|numeric|min:1',
            'meta_title' => 'nullable',
            'meta_description' => 'nullable',
        ];
    }
    public function messages()
    {
        return [
            'images.required' => 'Product images is required!',
            'image.required' => 'Product thumbnail is required!',
            'category_id.required' => 'category  is required!',
            'brand_id.required' => 'brand  is required!',
            'unit.required' => 'Unit  is required!',
            'code.min' => 'The code must be minimum 4 digits!',
            'minimum_order_qty.required' => 'The minimum order quantity is required!',
            'minimum_order_qty.min' => 'The minimum order quantity must be positive!',
        ];
    }
}
