<template>
	<view class="slidetop-icon" @tap="gotop()">
		<view class="iconfont">&#xe61c;</view>
	</view>
</template>

<script>
	export default{
		methods:{
			gotop(){
				console.log(123);
				this.$emit('toTop')
			}
		}
	}
</script>

<style lang="scss">
	.slidetop-icon{
		width: 90rpx;
		height: 90rpx;
		position: fixed;
		right: 32rpx;
		bottom: 120rpx;
		z-index: 200;
		color: #000000;
		font-size: 80rpx;
		opacity: 0.5;
	}
</style>
