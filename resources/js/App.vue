<template>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<router-link class="navbar-brand" to="/">Recipe Book</router-link>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>

			  <div class="collapse navbar-collapse" id="navbarText">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Features</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Pricing</a>
			      </li>
			    </ul>
			    	
				    <span class="navbar-text" v-if="guest" >
					    <router-link class="nav-link" to="/login">Login</router-link>
				    </span>

				    <span class="navbar-text" v-if="guest">
				      	<router-link class="nav-link" to="/register">Register</router-link>
				    </span>
				    <span class="navbar-text" v-if="auth">
				      	<router-link class="nav-link" to="/recipes/create">Create Recipe</router-link>
				    </span>
				    <span class="navbar-text" v-if="auth">
				      	<a class="nav-link" @click="logout">Logout</a>
				    </span>
			  </div>
		</nav>
		<div class="p-4 m-4  text-center alert alert-danger" v-if="flash.error">
			{{flash.error}}
		</div>
		<div class="p-4 m-4 text-center alert alert-success" v-if="flash.success">
			{{flash.success}}
		</div>

		<router-view></router-view>
	</div>
</template>


<script type="text/javascript">
	import Auth from './store/auth'
	import Flash from './helper/flash'
	import { post, interceptors } from './helper/api'
	export default {
		created() {
			// global error http handler
			interceptors((err) => {
				if(err.response.status === 401) {
					Auth.remove()
					this.$router.push('/login')
				}
				if(err.response.status === 500) {
					Flash.setError(err.response.statusText)
				}
				if(err.response.status === 404) {
					this.$router.push('/not-found')
				}
			})
			Auth.initialize()
		},
		data() {
			return {
				authState: Auth.state,
				flash: Flash.state
			}
		},
		computed: {
			auth() {
				if(this.authState.api_token) {
					return true
				}
				return false
			},
			guest() {
				return !this.auth
			}
		},
		methods: {
			logout() {
				post('api/logout')
				    .then((res) => {
				        if(res.data.done) {
				            // remove token
				            Auth.remove()
				            Flash.setSuccess('You have successfully logged out.')
				            this.$router.push('/login')
				        }
				    })
			}
		}
	}
</script>