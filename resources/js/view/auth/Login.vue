<template>
	<div class="container mt-4">
		<div class="card " style="margin: 10px 20%; background-color: white; padding: 20px; ">
            <form class="form" @submit.prevent="login">
    			<h3>Login to your account</h3>
    		
    			<div class="form-group">
    				<input class="form-control" type="email" placeholder="email here" v-model="form.email">
    				
    			</div>
    			<div class="form-group">
    				<input class="form-control" type="password" placeholder="password here" v-model="form.password">
    				 
    			</div>	
    			<div class="form-group">
    				<button :disabled="isProcessing" class="btn btn-primary">Login</button>
    			</div>	
			</form>
		</div>
	</div>
</template>
<script type="text/javascript">
    import Flash from '../../helper/flash'
    import { post } from '../../helper/api'
    import Auth from '../../store/auth'
    
    export default {
        data() {
            return {
                form: {
                    email: '',
                    password: ''
                },
                error: {},
                isProcessing: false
            }
        },
        methods: {
            login() {
                this.isProcessing = true
                this.error = {}
                if(!this.form.email || !this.form.password) {
                    Flash.setError('given data was invalid. try again')
                    this.isProcessing = false
                } else {
                    post('api/login', this.form)
                    .then((res) => {
                        if(res.data.authenticated) {
                            // set token
                            Auth.set(res.data.api_token, res.data.user_id)
                            Flash.setSuccess('You have successfully logged in.')
                            this.$router.push('/')
                        }
                        
                      
                    })
                    .catch((err) => {
                        if(err.response.status === 422) {
                            this.error = err.response.data
                            Flash.setError(this.error.message)
                        }
                        Flash.setError('Incorrect combination of email and password')
                        this.isProcessing = false
                    })  
                }
                
            }
        }
    }
</script>