<template>
	<view class="noNet wrapperLayer">
		<view class="contentbox colCenCen">
			<image class="img" src="../../static/images/app/nonet.png" mode="aspectFill"></image>
			<view class="txt">
				亲，没有网络了~
			</view>
			<view class="btn-refresh rowCenCen" @tap="refresh()">
				<view>点击刷新</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				
			}
		},
		methods:{
			refresh(){
				uni.getNetworkType({
				    success: res => {
				        console.log(res.networkType);
						if(res.networkType!='none'){
							uni.navigateBack({
								delta:1
							})
						}
				    }
				})
			}
		}
	}
</script>

<style lang="scss">
	.noNet {
		width: 100%;
		height: 100vh;
		overflow: hidden;

		.contentbox {
			width: 100%;
			height: 100%;

			.img {
				width: 324rpx;
				height: 313rpx;
			}

			.txt {
				font-size: 28rpx;
				font-weight: bold;
				margin-top: 45rpx;
				margin-bottom: 30rpx;
			}
			.btn-refresh{
				width: 201rpx;
				height: 61rpx;
				border: 1rpx solid #0099FF;
				border-radius: 5rpx;
				font-size: 30rpx;
				font-weight: bold;
				color: #0099FF;
			}
		}
	}
</style>
