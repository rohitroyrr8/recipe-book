<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecipeIngredient extends Model
{
    protected $fillable = [
    	'name', 'qty'
    ];

    public $timestamp = false;

    public static function form() {
    	return [
    		'name' => '',
    		'qty' => ''
    	];
    }
}
