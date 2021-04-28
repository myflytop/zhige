<template>
	<view class="elmgs-wrapper wrapperLayer">
		<titleBar :titleText='"美团外卖"' :pageForm='"mtwm"'></titleBar>
		<view class="pageContent-container colCen">
			<view class="pagePic defIcon">
				<image src="../../static/images/active/mtwmpic.png" mode="aspectFill"></image>
			</view>

			<view class="pageTitle rowCenCen">
				<view class="appName">
					{{appInfo.appName}}
				</view>
				<view class="borderCenter"></view>
				<view class="icon-box defIcon">
					<image src="../../static/images/active/wtmwlgos.png" mode=""></image>
				</view>
			</view>

			<view class="collectCoupons colCen">
				<view class="content-box colCen">
					<view class="buzhou-content defIcon">
						<image src="../../static/images/active/mtwmbg.png" mode=""></image>
					</view>
					<view class="collectCoupons-btn colCenCen" @tap="shareClick()">
						<view>领券点外卖</view>
					</view>
				</view>
			</view>

			<view class="bottom-container colCen">
				<view class="content-box colCen">
					<view class="share-btn colCenCen" @tap="goshare()">
						<view>分享海报</view>
					</view>

					<view class="red-text">
						好友使用您分享的小程序码图下单，您可享受返现
					</view>
				</view>
			</view>

			<view class="empty-canvas" style="width: 100%; height: 0px; overflow: hidden;">
				<canvas @click.stop='()=>{return false}' canvas-id="sharePoster" :style="{ width: canvasInfo.canvasW + 'px', height: canvasInfo.canvasH + 'px' }"></canvas>
			</view>
		</view>
	</view>
</template>

<script>
	import titleBar from '../../components/backTitlebar.vue'
	import common from '../../utils/utils.js'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				appInfo: '',
				urlsInfo: '',
				CVS: null,
				canvasInfo: {
					canvasW: '',
					canvasH: ''
				},
				sharePostUrl: ''
			}
		},
		onLoad(options) {
			common.getCache('appInfo').then(res => {
				console.log(res);
				this.appInfo = res
			})
			this.geturl();
		},
		methods: {
			async geturl() {
				await this.$http.post('meituan/meituanPrivilege', {
					generateWeApp: true,
					qrcode: true
				}, 'application/json').then(res => {
					console.log(res);
					this.urlsInfo = res
				})
			},

			goshare() {
				uni.showLoading({
					title: ''
				});
				if (this.sharePostUrl) {
					uni.hideLoading()
					uni.shareWithSystem({
						imageUrl: this.sharePostUrl,
						success: (res) => {},
					})
				} else {
					uni.getImageInfo({
						src: this.urlsInfo.qrcode,
						success: image => {
							console.log(image);
							if (image.height) {
								this.CVS = uni.createCanvasContext('sharePoster', this);
								this.canvasInfo.canvasW = image.width
								this.canvasInfo.canvasH = image.height
								this.CVS.drawImage(image.path, 0, 0, this.canvasInfo.canvasW, this.canvasInfo.canvasH);
								setTimeout(() => {
									this.CVS.draw(false, res => {
										uni.canvasToTempFilePath({
											canvasId: 'sharePoster',
											success: ress => {
												console.log(ress);
												this.sharePostUrl = ress.tempFilePath
												uni.hideLoading()
												if (this.sharePostUrl) {
													uni.shareWithSystem({
														imageUrl: this.sharePostUrl,
														success: (res) => {},
													})
												} else {
													uni.showModal({
														content: "分享出错，请稍后重试",
														success: res => {}
													})
												}
											},
											complete() {
												uni.hideLoading()
											}
										});
									});
								}, 300);
							}
						},
					});
				}
			},

			shareClick(e) {
				// #ifdef APP-PLUS
				if (plus.os.name == 'Android') {
					console.log(plus.os.name);
					plus.runtime.openURL(this.urlsInfo.deeplink, res => {
						uni.showModal({
							content: "本机未检测到美团客户端，是否打开浏览器访问？",
							success: res => {
								if (res.confirm) {
									plus.runtime.openURL(this.urlsInfo.h5Evoke)
								}
							}
						})
					}, 'com.sankuai.meituan');
				} else {
					plus.runtime.openURL(this.urlsInfo.deeplink, res => {
						uni.showModal({
							content: "本机未检测到美团客户端，是否打开浏览器访问？",
							success: res => {
								if (res.confirm) {
									plus.runtime.openURL(this.urlsInfo.h5Evoke)
								}
							}
						})
					}, 'com.sankuai.meituan');
				}
				// #endif
			},

			copyWord() {
				uni.setClipboardData({
					data: this.urlsInfo.Tpwd,
					success: res => {
						uni.showToast({
							title: '口令已复制',
							duration: 1000
						});
					}
				});
			}
		}
	}
</script>

<style lang="scss">
	.elmgs-wrapper {
		width: 100%;
		min-height: 100vh;
		background: #FEE15A;

		.pageContent-container {
			width: 100%;
			z-index: 0;
			position: relative;

			.pagePic {
				position: absolute;
				width: 100%;
				height: 390rpx;
				z-index: 1;
				top: 0;
				left: 0;
			}

			.pageTitle {
				min-width: 210rpx;
				height: 56rpx;
				background-color: #FFFFFF;
				border: 1rpx solid #FFFFFF;
				box-shadow: 0px 1rpx 0px 0px #FE8923;
				opacity: 0.98;
				z-index: 2;
				border-radius: 0rpx 0rpx 30rpx 30rpx;

				.appName {
					font-size: 24rpx;
					font-weight: 500;
					color: #333333;
				}

				.borderCenter {
					width: 2rpx;
					height: 24rpx;
					background: #FFFFFF;
					margin: 0 10rpx;
				}

				.icon-box {
					width: 70rpx;
					height: 40rpx;
					font-size: 24rpx;
					font-weight: 500;
					color: #FFFFFF;
				}
			}

			.collectCoupons {
				width: 100%;
				padding: 0 32rpx;
				z-index: 2;
				margin-top: 305rpx;

				.content-box {
					width: 100%;
					height: 380rpx;
					background: #FFFFFF;
					box-shadow: 5rpx 9rpx 32rpx 0px rgba(254, 137, 35, 0.25), -5rpx -5rpx 35rpx 0px rgba(254, 137, 35, 0.14);
					border-radius: 24rpx;

					.buzhou-content {
						width: 506rpx;
						height: 136rpx;
						margin-top: 50rpx;
					}

					.collectCoupons-btn {
						width: 430rpx;
						height: 80rpx;
						background: #FE8923;
						border-radius: 40rpx;
						font-size: 32rpx;
						font-weight: 500;
						color: #FFFFFF;
						margin-top: 50rpx;
					}
				}
			}

			.bottom-container {
				width: 100%;
				padding: 0 32rpx;
				z-index: 2;
				margin-top: 40rpx;

				.content-box {
					width: 100%;
					height: 280rpx;
					background: #FFFFFF;
					box-shadow: 5rpx 9rpx 32rpx 0px rgba(254, 137, 35, 0.25), -5rpx -5rpx 35rpx 0px rgba(254, 137, 35, 0.14);
					border-radius: 24px;
					border-radius: 24rpx;
					padding: 0 20rpx;

					.share-btn {
						width: 430rpx;
						height: 80rpx;
						background: #FE8923;
						border-radius: 40rpx;
						font-size: 32rpx;
						font-weight: 500;
						color: #FFFFFF;
						margin-top: 70rpx;
					}


					.red-text {
						width: 100%;
						margin-top: 40rpx;
						font-size: 24rpx;
						font-weight: 500;
						color: #FF4242;
					}
				}
			}
		}
	}
</style>
