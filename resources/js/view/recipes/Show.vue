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
                  <!-- <div class="col-md-6" style="box-shadow: 1px 2px 17px 4px rgba(0,0,0,0.12);padding: 30px; ">
                        <form action="http://paisabulls.com/credit-card/store" method="GET">
                        <input type="hidden" name="_token" value="xZdWLHRyAWlAiT68nlMv73svtcm2O8FFNJ1YbE2q">
                        
                        <input type="hidden" name="offer_id" value="1">
                        <input type="hidden" name="bank_name" value="rbl-bank">
                        
                        <div class="row">
                              <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Name</label>
                                          <input required="" class="form-control" type="text" name="name" placeholder="Enter your Name">

                                    </div>
                              </div>
                              <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Mobile No.</label>
                                          <input required="" class="form-control" type="number" name="mobile_no" placeholder="Enter Mobile No.">
                                          
                                    </div>
                              </div>
                              <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Email-address</label>
                                          <input required="" class="form-control" type="email" name="email_addr" placeholder="Enter Email-address">
                                          
                                    </div>
                              </div>
                              <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Monthly Income</label>
                                          <input required="" class="form-control" type="number" name="monthly_income" placeholder="Enter Monthly Income" value="23423423">
                                          
                                    </div>
                              </div>
                               <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Employee Type</label>
                                          <select class="form-control selectpicker" data-style="btn" name="emp_type">
                                          <option value="">Select Employee Type</option>
                                            <option value="Salaried">Salaried</option>
                                            <option value="Self-employed">Self-employed</option>
                                            
                                          </select>
                                          
                                    </div>
                                </div>
								<div class="col-md-12">
                                    <div class="form-group">
                                          <label>City</label>
                                          <input required="" class="form-control" type="text" name="city" placeholder="Enter City" value="Gurugram">
                                          
                                    </div>
                              </div>
                              <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Pincode</label>
                                          <input required="" class="form-control" type="number" name="pincode" placeholder="Enter Pincode">
                                          
                                    </div>
                              </div> 
                              <div class="">
                                    <p class="pl-4">By clicking in this button , you agree to our terms and conditions</p>
                              
                              <div class="form-group col-md-12">
                                    <input class="form-control btn btn-primary" type="submit" name="apply_credit_card" value="Submit">
                              </div>
                              </div>
                        </div>
                  </form>
                  </div> -->
                  
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
			get(`api/recipes/${this.$route.params.id}`)
				.then((res) => {
					this.recipe = res.data.recipe
				})
		},
		methods: {
			remove() {
				this.isRemoving = false
				del(`api/recipes/${this.$route.params.id}`)
					.then((res) => {
						if(res.data.deleted) {
							Flash.setSuccess('You have successfully deleted recipe!')
							this.$router.push('/')
						}
					})
			}
		}
	}
</script>