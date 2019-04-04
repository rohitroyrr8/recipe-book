<template>
	<section class="section section-lg pt-4">
  		<div class="container description">
  			<h2>{{action}} Recipe</h2>
  			<div class="row">
					<div class="col-md-6">
						<h3>Recipe name</h3>
						<span>Uploaded by : 28 Dev, 2019	</span>
					</div>
					<div class="col-md-6" style="padding: 30px; ">
						<button @click="save" class="btn btn-primary" :disabled="isProcessing">Save Recipe</button>
						<button @click="$router.back()" class="btn btn-default" :disabled="isProcessing">Cancel</button>
                  	</div>
            </div>
            <div class="row">
            	<div class="col-md-6">
            		<image-upload class v-model="form.image"></image-upload>
            		 <small class="error__control" v-if="error.image">{{error.image[0]}}</small>
            	</div>
            	<div class="col-md-6">
            		<div class="form-group">
            			<label>Name</label>
            			<input type="text" class="form-control" v-model="form.name">
						<small class="error__control" v-if="error.name">{{error.name[0]}}</small> 
            		</div>
            		<div class="form-group"> <label>Description</label>
            			<input type="text" class="form-control" v-model="form.description">
            			<small class="error__control" v-if="error.name">{{error.description[0]}}</small>
            		</div>		
            	</div>
            </div>
            <div class="row">
            	<div class="col-md-6">
            		<h3>Ingredients</h3>
            		
            		<div v-for="(ingredient, index) in form.ingredients">
            			<div class="row">
            				<div class="col-md-4">
	            				<div class="form-group">
		            				<input type="text" name="form-control" v-model="ingredient.name">

		            			</div>
	            			</div>
	            			<div class="col-md-4">
	            				<div class="form-group">
		            				<input type="text" name="form-control" v-model="ingredient.qty" >
		            			</div>
	            			</div>
	            			<div class="col-md-4">
	            				<button class="btn btn-danger" @click="remove('ingredients', index)">x</button>
	            			</div>
            			</div>
            		</div>
            		<button class="btn" @click="addIngredient">Add Ingredients</button>
            	</div>
            	<div class="col-md-6">
            		<h3>Directions</h3>
            		<div class="row" v-for="(direction, index) in form.directions">
            			<div class="col-md-10">
            				<div class="form-group">
            					<textarea class="form-control" v-model="direction.description"></textarea>
	            				
	            			</div>
            			</div>
            			<div class="col-md-2">
            				<button class="btn btn-danger" @click="remove('directions', index)">x</button>
            			</div>
            		</div>
            		
            		<button class="btn " @click="addDirection">Add Directions</button>
            	</div>
            </div>
      	</div>
    </section>
</template>


<script type="text/javascript">

	import Vue from 'vue'
	import Flash from '../../helper/flash'
	import {get, post} from '../../helper/api'
	import {toMultipartedForm} from '../../helper/form'
	import ImageUpload from '../../components/ImageUpload.vue'

	export default {
		components: {
			ImageUpload
		},
		data() {
			return {
				form: {
					ingredients: [],
					directions: []
				},
				error: {},
				isProcessing: false,
				initializeURL: 'api/recipes/create',
				storeUrl: 'api/recipes',
				action: 'Create'
			}
		},
		created() {
			if(this.$route.meta.mode == 'edit') {
				this.initializeURL = `api/recipes/${this.$route.params.id}/edit`
				this.storeUrl = `api/recipes/${this.$route.params.id}?_method=PUT`
				this.action = 'Update'
			}
			get(this.initializeURL)
				.then((res) => {
					Vue.set(this.$data, 'form', res.data.form)
				})
		},

		methods: {
			save() {
				this.$Progress.start()
				this.isProcessing = true
				const form = toMultipartedForm(this.form, this.$route.meta.mode)
				post(this.storeUrl, form)
					.then((res) => {
						if(res.data.saved) {
							Flash.setSuccess(res.data.message)
							this.$router.push(`/`)
						}
						this.isProcessing = false
					})
					.catch((err) => {
						if(err.response.status === 422) {
				            this.error = err.response.data.errors
				        }
				        this.isProcessing = false
					})
				this.$Progress.finish()
			},

			addDirection() {
				this.form.directions.push({
					description: ''
				})
			},

			addIngredient() {
				this.form.ingredients.push({
					name: '',
					qty: ''
				})
			},

			remove(type,index) {
				if(this.form[type].length > 1) {
					this.form[type].splice(index, 1)
				}
			}
		}
	}
</script>