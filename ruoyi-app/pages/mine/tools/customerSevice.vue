<template>
	<view class="customerSevice-wrapper wrapperLayer colCen">
		<view class="topheaderCard-container colCen"></view>
		<view class="topbarbox"></view>
		<view class="headerNavigationbar borderBox rowCenBet">
			<view class="backBtn defIcon" @click="pathBack()">
				<image src="../../../static/images/home/returnWhite.png" mode=""></image>
			</view>
			<view class="pageTitle">
				专属客服
			</view>
			<view class="emptybox"></view>
		</view>

		<view class="customerSevice-container borderBox colCen">
			<view class="customerSevice-card colCen">
				<view class="customerHeader-container rowCenCen">
					<view class="headerbox defIcon">
						<image :src="appLogo"></image>
					</view>
				</view>
				<view class="customerInfo colCen">
					<view class="customerName">
						专属客服
					</view>
					<view class="customerWXnum">
						微信号：<text :selectable="true">{{wxNum}}</text>
					</view>

					<view class="qrcode-title">
						长按保存客服微信二维码
					</view>

					<view class="qrcode-container defIcon" @longpress="saveImg">
						<image :src="wxImg" mode=""></image>
					</view>
				</view>

			</view>
		</view>

		<view class="textTips borderBox">
			添加微信有助于更好的帮您解决问题哦~
		</view>
		
		<u-toast ref="uToast" />
	</view>
</template>

<script>
	export default {
		data() {
			return {
				wxNum: 'fisjf390',
				wxImg: '',
				appLogo: ''
			}
		},
		onLoad() {
			this.getpageData()
		},
		methods: {
			getpageData() {
				this.$http.post('cpssystemConfig/getCustomerServiceInfo').then(res => {
					console.log(res, '========>客服信息');
					this.wxNum = res.wxNumber
					this.wxImg = res.wxImg
					this.appLogo = res.appLogo
				})
			},
			pathBack() {
				uni.navigateBack({
					delta: 1,
				})
			},
			saveImg(e) {
				console.log(e);
				uni.saveImageToPhotosAlbum({
					filePath: this.wxImg,
					success: res=> {
						this.$refs.uToast.show({
							title: '保存成功，可在相册中查看',
							type: 'success',
							position: 'bottom'
						})
					}
				});
			}
		}
	}
</script>

<style lang="scss">
	.customerSevice-wrapper {
		.topheaderCard-container {
			width: 750rpx;
			height: 525rpx;
			background: url(../../../static/images/mine/tools/customer.png)no-repeat;
			background-size: 100% 100%;
			position: absolute;
			top: 0;
			left: 0;
		}

		.headerNavigationbar {
			width: 100%;
			height: 90rpx;
			padding: 0 32rpx;
			z-index: 1;

			.emptybox {
				width: 32rpx;
				height: 32rpx;
			}

			.pageTitle {
				font-size: 32rpx;
				font-weight: 500;
				color: #FFFFFF;
			}

			.backBtn {
				width: 32rpx;
				height: 32rpx;

				image {
					width: 17rpx;
					height: 32rpx;
				}
			}
		}

		.customerSevice-container {
			width: 100%;
			padding: 0 42rpx;
			margin-top: 150rpx;
			z-index: 1;

			.customerSevice-card {
				width: 100%;
				height: 900rpx;
				background-color: rgba(255, 255, 255, 0.77);
				box-shadow: 0px 7rpx 16rpx 0px rgba(88, 91, 120, 0.38);
				border-radius: 10rpx;
				position: relative;

				.customerHeader-container {
					position: absolute;
					width: 100%;
					height: 200rpx;
					top: -120rpx;
					z-index: 10;

					.headerbox {
						width: 200rpx;
						height: 200rpx;
						border: 2rpx solid #FFFFFF;
						border-radius: 50%;
						overflow: hidden;
					}
				}

				.customerInfo {
					width: 100%;
					margin-top: 115rpx;

					.customerName {
						font-size: 32rpx;
						font-weight: bold;
						color: #095AC1;
					}

					.customerWXnum {
						font-size: 28rpx;
						font-weight: 400;
						color: #095AC1;
						margin-top: 30rpx;
					}

					.qrcode-title {
						font-size: 32rpx;
						font-weight: 400;
						color: #095AC1;
						margin-top: 100rpx;
					}

					.qrcode-container {
						margin-top: 35rpx;
						width: 375rpx;
						height: 375rpx;
						background: url(../../../static/images/mine/tools/qrcode.png) no-repeat;
						background-size: 100% 100%;

						image {
							width: 345rpx;
							height: 345rpx;
						}
					}
				}
			}
		}

		.textTips {
			width: 100%;
			margin-top: 50rpx;
			font-size: 24rpx;
			font-weight: 400;
			color: #095AC1;
			padding-left: 54rpx;
		}
	}
</style>
