<template>
	<view class="pageWapper wrapperLayer borderBox colCen">
		<titleBar :titleText="pageType==2?'用户协议':'隐私政策'"></titleBar>
		<view class="pageContent" v-html="pageContent"></view>
	</view>
</template>
<!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
<script>
	import titleBar from '../../components/backTitlebar.vue'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				pageType: 1,
				pageContent:''
			};
		},
		onLoad(options) {
			if (options.type == 'policy') {
				this.pageType = 1
			} else {
				this.pageType = 2
			}
			this.getData()
		},
		methods: {
			getData() {
				this.$http.get('agreement/list/'+this.pageType).then((res) => {
					console.log(res, '========>信息');
					this.pageContent = res.content
				})
			}
		}
	}
</script>

<style lang="scss">
	.pageWapper{
		width: 100%;
		min-height: 100vh;
		background-color: #FFFFFF;
		.pageContent{
			padding: 32rpx;
		}
	}
</style>
