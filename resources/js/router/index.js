import Vue from 'vue'
import VueRouter from 'vue-router'

import Register from '../view/auth/Register.vue'
import Login from '../view/auth/Login.vue'
import RecipeIndex from '../view/recipes/Index.vue'
import RecipeShow from '../view/recipes/Show.vue'
import RecipeForm from '../view/recipes/Form.vue'

Vue.use(VueRouter)

const router = new VueRouter({
	routes: [
		{ path: '/', component: RecipeIndex},
    { path: '/recipes/create', component: RecipeForm, meta: {mode: 'create'}},
		{ path: '/recipes/:id/edit', component: RecipeForm, meta: {mode: 'edit'}},
		{ path: '/recipes/:id', component: RecipeShow},
		{ path: '/register', component: Register},
		{ path: '/login', component: Login}


	]
})

// export default router

router.beforeResolve((to, from, next) => {
  // If this isn't an initial page load.
  if (to.name) {
      // Start the route progress bar.
      NProgress.start()
  }
  next()
})

router.afterEach((to, from) => {
  // Complete the animation of the route progress bar.
  NProgress.done()
})

export default router