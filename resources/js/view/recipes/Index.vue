<template>
	<div class="container mt-4">
		<div class="row" >
			<div class="col-md-4 " v-for="recipe in recipes">
			<div style="border-radius: 5px;box-shadow: 0 2px 2px rgba(0,0,0,.2); margin: 10px; padding: 12px">
				<router-link :to="`/recipes/${recipe.id}`">

					<div class="text-center">
						<img style="width: 100%;" class="pt-4 pb-4" :src="`images/${recipe.image}`" v-if="recipe.image">
						<h4 class="font20 font-weight700">{{recipe.name}}</h4>
					</div>
					<span style=" color: #8c8c8c;">Upload on : {{recipe.updated_at}}</span>
				</router-link>
			</div>
			</div>
		</div>

		<!-- <div class="row" v-for="recipe in recipes">
			<div class="col-md-4" style="border-radius: 5px;
    box-shadow: 0 2px 2px rgba(0,0,0,.2); margin: 10px; padding: 12px;">
				<router-link :to="`/recipes/${recipe.id}`">
					<img class="image-thumbnail image-responsive " :src="`images/${recipe.image}`" v-if="recipe.image">
					<p class="">{{recipe.name}}</p>
			</router-link>
			</div>
		</div> -->
	</div>
</template>

<script type="text/javascript">
	import {get} from '../../helper/api'
	export default {
		data() {
			return {
				recipes: []
			}
		},
		created() {
			get('api/recipes')
				.then((res) => {
					this.recipes = res.data.recipes
					//console.log(this.recipes)
				});
		}
	}
</script>