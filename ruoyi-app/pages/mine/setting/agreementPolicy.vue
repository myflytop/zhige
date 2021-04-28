<template>
	<view class="agreementPolicy-wrapper wrapperLayer">
		<titleBar :titleText='pageType' :pageForm='"aboutUs"'></titleBar>
	</view>
</template>
<!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
<script>
	import titleBar from '../../../components/backTitlebar.vue'
	export default{
		components:{
			titleBar
		},
		data(){
			return{
				pageType:''
			}
		},
		onLoad(options) {
			if(options.type=='agreement'){
				this.pageType = '用户协议'
			}else{
				this.pageType = '隐私政策'
			}
		},
		methods:{
			
		}
	}
</script>

<style lang="scss">
	
</style>
