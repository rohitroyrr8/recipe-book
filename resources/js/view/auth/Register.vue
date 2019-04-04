<template>
	<div class="container mt-4">
		<div class="card " style="margin: 10px 20%; background-color: white; padding: 20px; ">
		    <form class="form" @submit.prevent="register">
		        <h1 class="form-title">Create an Account</h1>
		        <div class="form-group">
		            <label>Name</label>
		            <input type="text" class="form-control" v-model="form.name">
		            <small class="error__control" v-if="error.name">{{error.name[0]}}</small>
		        </div>
		        <div class="form-group">
		            <label>Email</label>
		            <input type="text" class="form-control" v-model="form.email">
		            <small class="error__control" v-if="error.email">{{error.email[0]}}</small>
		        </div>
		        <div class="form-group">
		            <label>Password</label>
		            <input type="password" class="form-control" v-model="form.password">
		            <small class="error__control" v-if="error.password">{{error.password[0]}}</small>
		        </div>
		        <div class="form-group">
		            <label>Confirm Password</label>
		            <input type="password" class="form-control" v-model="form.password_confirmation">
		        </div>
		        <div class="form-group">
		            <button :disabled="isProcessing" class="btn btn-primary">Register</button>
		        </div>
		    </form>
		</div>
	</div>
</template>
<script type="text/javascript">
    import Flash from '../../helper/flash'
    import { post } from '../../helper/api'
    export default {
        data() {
            return {
                form: {
                    name: '',
                    email: '',
                    password: '',
                    password_confirmation: ''
                },
                error: {},
                isProcessing: false
            }
        },
        methods: {
            register() {
                this.isProcessing = true
                this.error = {}
                if(!this.form.email ||! this.form.password || !this.form.name || !this.form.password_confirmation){
                	Flash.setError('All fields are required. try again')
                	this.isProcessing = false
                	return
                }
                if(this.form.password_confirmation != this.form.password) {
                	Flash.setError('Password and confirm password does not match')
                	this.isProcessing = false
                	return
                }
                post('api/register', this.form)
                    .then((res) => {
                        if(res.data.registered) {
                            Flash.setSuccess('Congratulations! You have now successfully registered.')
                            this.$router.push('/login')
                        }
                        this.isProcessing = false
                    })
                    .catch((err) => {
                        if(err.response.status === 422) {
                        	this.error = err.response.data.errors
                        }
                        Flash.setError('Registration failed.. Try again')
                        this.isProcessing = false
                    })
            }
        }
    }
</script>