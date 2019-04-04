import Vue from 'vue'
import App from './App.vue'
import router from './router'
import VueProgressBar from 'vue-progressbar'

const options = {
	color: '#3F51B5',
    failedColor: '#dd1414',
	thickness: '2px',
	transition: {
	speed: '0.2s',
	opacity: '0.6s',
	termination: 300
	},
	autoRevert: true,
	location: 'top',
	inverse: false
}

Vue.use(VueProgressBar, options)

const app = new Vue({
	el : '#root',
	template : '<app></app>',
	components : {App},
	router
})
