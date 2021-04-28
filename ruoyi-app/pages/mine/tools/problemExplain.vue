<template>
	<view class="problemExplain-wrapper wrapperLayer">
		<titleBar :titleText='pageTitle' :pageForm='"problemExplain"'></titleBar>
		<view class="pageContent colCen borderBox">
			{{content}}
		</view>
	</view>
</template>

<script>
	import titleBar from '../../../components/backTitlebar.vue';
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				pageTitle: '',
				id: '',
				content: ''
			}
		},
		onLoad(options) {
			this.id = options.id
			this.getData()
		},
		methods: {
			getData() {
				this.$http.post('helpContent/getHelpDetail/' + this.id).then(res => {
					console.log(res);
					this.pageTitle = res.title
					this.content = res.content
				})
			}
		}
	}
</script>

<style lang="scss">
	.problemExplain-wrapper {
		width: 100%;
		min-height: 100vh;
		background-color: #FFFFFF;

		.pageContent {
			width: 100%;
			padding: 32rpx;
			text-indent: 2em;
			font-size: 32rpx;
			line-height: 48rpx;
		}
	}
</style>
