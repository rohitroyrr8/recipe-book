<template>
	<section class="section section-lg pt-4">
      <div class="container description">
      	<div class="row">

                  <div class="col-md-6" style="padding: 30px; ">
                         <img style="width: 100%;" class="pt-4 pb-4" :src="`images/${recipe.image}`" v-if="recipe.image">
                  </div>
                  <div class="col-md-6" style="padding: 30px; ">
                        <small>Submitted By : {{recipe.user.name}}</small>
                        <h2>{{recipe.name}}</h2>
                        <p>{{recipe.description}}</p>
                        <div v-if="auth.api_token && auth.user_id === recipe.user_id">
                        	<router-link :to="`/recipes/${recipe.id}/edit`" class="btn btn-primary mt-4 mb-4">
							Edit Recipe
							</router-link>
                        	<button class="btn btn-danger mt-4 mb-4" @click="remove" disabled:="isRemoving">Remove Recipe</button>
                        </div>
                  </div>
                  <div class="col-md-6" style="padding: 30px; ">
                  		<h3>Ingredients</h3>
                  		<ul>
                         	<li v-for="ingredient in recipe.ingredients">
                 				<p>
                 					<span>{{ingredient.name}}</span>
                 					<span>{{ingredient.qty}}</span>
                 				</p>
                         	</li>
                        </ul>
                  </div>
                  <div class="col-md-6" style="padding: 30px; ">
                        <div>
                        	<h3>Direction</h3>
                        	<ul>
                        		<li v-for="(direction, i) in recipe.directions">
									<p>
										<strong>Step {{i + 1}}: </strong>
										{{direction.description}}
									</p>
								</li>
                        	</ul>
                        </div>
                  </div>
                  
                  
            </div>
</div>
</section>
</template>

<script type="text/javascript">
	import Auth from '../../store/auth'
	import Flash from '../../helper/flash'
	import { get, del } from '../../helper/api'
	export default {
		data() {
			return {
				auth: Auth.state,
				isRemoving: false,
				i: 0,
				recipe: {
					user: {},
					ingredients: [],
					directions: []
				}
			}
		},
		created() {
      		this.$Progress.start()
			get(`api/recipes/${this.$route.params.id}`)
				.then((res) => {
					this.recipe = res.data.recipe
				})
      		this.$Progress.finish()
		},
		methods: {
			remove() {
        		this.$Progress.start()
				this.isRemoving = false
				del(`api/recipes/${this.$route.params.id}`)
					.then((res) => {
						if(res.data.deleted) {
							Flash.setSuccess('You have successfully deleted recipe!')
							this.$router.push('/')

						}
					})
       			 this.$Progress.finish()
			}
		}
	}
</script>