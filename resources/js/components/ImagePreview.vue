<template>
	<div class="" v-if="image">
		<button class="btn" @click="close" style="">&times;</button>
		<img :src="image"  class="img-responsive img-thumbnail">
		
	</div>
</template>
<script type="text/javascript">
	export default {
		props: {
			preview: {
			    type: [String, File],
			    default: null
			}
		},
		data() {
			return {
				image: null
			}
		},
		created() {
			this.setPreview()
		},
		watch: {
			'preview': 'setPreview'
		},
		methods: {
			setPreview() {
				if(this.preview instanceof File ) {
					const fileReader = new FileReader()
					fileReader.onload = (event) => {
					  this.image = event.target.result
					}
					fileReader.readAsDataURL(this.preview)
				} else if (typeof this.preview === 'string') {
					this.image = `images/${this.preview}`
				} else {
					this.image = null
				}
			},
			close() {
				this.$emit('close')
			}
		}
	}
</script>