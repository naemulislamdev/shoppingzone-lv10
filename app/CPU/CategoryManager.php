<?php

namespace App\CPU;

use App\Model\Category;
use App\Model\Product;

class CategoryManager
{
    public static function parents()
    {
        $x = Category::with(['childes.childes'])->where('position', 0)->priority()->get();
        return $x;
    }

    public static function child($parent_id)
    {
        $x = Category::where(['parent_id' => $parent_id])->get();
        return $x;
    }

    public static function products($category_id,$limit = 10, $offset = 1)
    {
        $id = '"'.$category_id.'"';
        // return Product::active()
        //     ->where('category_ids', 'like', "%{$id}%")->get();
            /*->whereJsonContains('category_ids', ["id" => (string)$data['id']])*/

            $paginator = Product::with(['rating'])->active()->where('category_ids', 'like', "%{$id}%")->latest()->paginate($limit, ['*'], 'page', $offset);
        return [
            'total_size' => $paginator->total(),
            'limit' => (int)$limit,
            'offset' => (int)$offset,
            'products' => $paginator->items()
        ];
    }

    public static function homeProducts($category_id)
    {
        $id = '"'.$category_id.'"';
         return Product::active()
           ->where('category_ids', 'like', "%{$id}%")->inRandomOrder()->limit(10)->get();
            /*->whereJsonContains('category_ids', ["id" => (string)$data['id']])*/


    }

     public static function products_slug($category_slug)
    {
        $categoryInfo = Category::where('slug',$category_slug)->first();
        $id = $categoryInfo->id;
        return Product::active()
            ->where('category_ids', 'like', "%{$id}%")->get();
            /*->whereJsonContains('category_ids', ["id" => (string)$data['id']])*/
    }
}
