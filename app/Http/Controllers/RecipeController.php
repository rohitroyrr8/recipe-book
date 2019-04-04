<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Recipe;
use App\RecipeIngredient;
use App\RecipeDirection;
use File;

class RecipeController extends Controller
{
	public function __construct() {
		$this->middleware('auth:api')->except('index', 'show');
	}

	public function index()
	{
		$recipes = Recipe::orderBy('created_at', 'desc')->get();

		return response()->json([
			'recipes' => $recipes
		]);
	}

	public function create() {
		$form = Recipe::form();

		return response()->json([
			'form' => $form
		]);
	}

	public function store(Request $request) {

		$this->validate($request, [
			'name' => 'required|max:255',
			'description' => 'required|max:3000',
			'image' => 'image',
			'ingredients' => 'required|array|min:1',
			'ingredients.*.name' => 'required|max:255',
			'ingredients.*.qty' => 'required|max:255',
			'directions.*.description' => 'required|max:3000'

		]);

		$ingredients = [];

		foreach ($request->ingredients as $ingredient) {
			$ingredients[] = new RecipeIngredient($ingredient);

		}

		$directions = [];

		foreach($request->directions as $direction) {
			$directions[] = new RecipeDirection($direction);
		}

		if(!$request->hasFile('image') && !$request->file('image')->isValid()) {
			return abort(404, 'Image Not uploaded');
		}

		$filename = $this->getFileName($request->image);
    	$request->image->move(base_path('public/images'), $filename);

		
		$recipe = new Recipe($request->all());

		$recipe->image = $filename;
		$request->user()->recipes()->save($recipe);

		$recipe->directions()->saveMany($directions);
		$recipe->ingredients()->saveMany($ingredients);

		return response()->json([
			'saved' => true,
			'id' => $recipe->id,
			'message' => 'You have successfully created recipe!!'
		]);
	}

	public function getFileName($file) {
		return str_random(32).'.'.$file->extension();
	}

	public function show($id){
		$recipe = Recipe::with(['user', 'ingredients', 'directions'])->findOrFail($id);

		return response()->json([
			'recipe' => $recipe
		]);
	}

	public function edit($id, Request $request)
	{
		$form = $request->user()->recipes()
			->with(['ingredients' => function($query) {
				$query->get(['id', 'name', 'qty']);
			}, 'directions' => function($query) {
				$query->get(['id', 'description']);
			}])
			->findOrFail($id, [
				'id', 'name', 'description', 'image'
			]);

		return response()->json([
			'form' => $form
		]);	
	}

	public function update($id, Request $request)
	{
		$this->validate($request, [
			'name' => 'required|max:255',
			'description' => 'required|max:3000',
			'image' => 'image',
			'ingredients' => 'required|array|min:1',
			'ingredients.*.id' => 'integer|exists:recipe_ingredients',
			'ingredients.*.name' => 'required|max:255',
			'directions.*.id' => 'integer|exists:recipe_directions',
			'ingredients.*.qty' => 'required|max:255',
			'directions.*.description' => 'required|max:3000'

		]);

		$recipe = $request->user()->recipes()->findOrFail($id);
		$ingredients = [];
		$ingredientsUpadated = [];

		foreach ($request->ingredients as $ingredient) {
			if(isset($ingredient['id'])) {
				//update
				RecipeIngredient::where('recipe_id', $recipe->id)
					->where('id', $ingredient['id'])
					->update($ingredient);

				$ingredientsUpadated[] = $ingredient['id'];
			} else {
				$ingredients[] = new RecipeIngredient($ingredient);
			}
		}

		$directions = [];
		$directionsUpadated = [];

		foreach ($request->directions as $direction) {
			if(isset($direction['id'])) {
				//update
				RecipeDirection::where('recipe_id', $recipe->id)
					->where('id', $direction['id'])
					->update($direction);

				$directionsUpadated[] = $direction['id'];
			} else {
				$directions[] = new RecipeDirection($direction);
			}
		}

		$recipe->name = $request->name;
		$recipe->description = $request->description;


		// upload image
        if ($request->hasfile('image') && $request->file('image')->isValid()) {
            $filename = $this->getFileName($request->image);
            $request->image->move(base_path('/public/images'), $filename);
            // remove old image
            File::delete(base_path('/public/images/'.$recipe->image));
            $recipe->image = $filename;
        }

		$recipe->save();

		//delete all ids except updated

		RecipeIngredient::whereNotIn('id', $ingredientsUpadated)
			->where('recipe_id', $recipe->id)
			->delete();

		RecipeDirection::whereNotIn('id', $directionsUpadated)
			->where('recipe_id', $recipe->id)
			->delete();

		if(count($ingredients)) {
			$recipe->ingredients()->saveMany($ingredients);
		}

		if(count($directions)) {
			$recipe->directions()->saveMany($directions);
		}

		return response()->json([
			'saved' => true,
			'id' => $recipe->id,
			'message' => 'Recipe updated successfully'
		]);
	}

	public function destroy($id, Request $request) {
		$recipe = $request->user()->recipes()->findOrFail($id);

		RecipeIngredient::where('recipe_id', $recipe->id)->delete();
		RecipeDirection::where('recipe_id', $recipe->id)->delete();

		File::delete(base_path('public/images/'.$recipe->image));

		$recipe->delete();

		return response()
			->json([
				'deleted' => true
			]);

	}
}
