<template>
	<view class="elmgs-wrapper wrapperLayer">
		<titleBar :titleText='"饿了么"' :pageForm='"elmgs"'></titleBar>
		<view class="pageContent-container colCen">
			<view class="pagePic defIcon">
				<image src="../../static/images/active/elmgs.png" mode="aspectFill"></image>
			</view>

			<view class="pageTitle rowCenCen">
				<view class="appName">
					{{appInfo.appName}}
				</view>
				<view class="borderCenter"></view>
				<view class="icon-box iconfont">
					&#xe8ca; 饿了么
				</view>
			</view>

			<view class="collectCoupons colCen">
				<view class="content-box colCen">
					<view class="buzhou-content defIcon">
						<image src="../../static/images/active/ekmgs.png" mode=""></image>
					</view>
					<view class="collectCoupons-btn colCenCen" @tap="shareClick()">
						<view>领券点外卖</view>
					</view>
				</view>
			</view>

			<view class="bottom-container colCen">
				<view class="content-box colCen">
					<view class="share-btn colCenCen" @tap="sharewx()">
						<view>分享饿了么小程序</view>
					</view>

					<view class="copy-btn colCenCen" @tap="copyWord()">
						<view>复制饿了么口令</view>
					</view>

					<view class="red-text">
						好友使用您分享的小程序码图/口令下单，您可享受返现
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
				canvasInfo: {
					canvasW: 750,
					canvasH: 1335
				},
				backpic:'',
				sharePostUrl:''
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
			geturl() {
				this.$http.post('eleme/activityLink', {
					promotionSceneId: '1585018034441'
				}, 'application/json').then(res => {
					console.log(res);
					this.urlsInfo = res.linkmodel
					this.backpic = res.pic
				})
			},

			shareClick() {
				this.$nextTick((res) => {
					// #ifdef APP-PLUS
					if (this.urlsInfo) {
						if (plus.os.name == 'Android') {
							console.log(plus.os.name);
							plus.runtime.openURL(this.urlsInfo.click_url, res => {
								uni.showModal({
									content: "本机未检测到淘宝客户端，是否打开浏览器访问？",
									success: res => {
										if (res.confirm) {
											plus.runtime.openURL(this.urlsInfo.click_url)
										}
									}
								})
							}, 'com.taobao.taobao');
						} else {
							this.urlsInfo.click_url = this.urlsInfo.click_url.split('//')[1]
							plus.runtime.openURL('taobao://' + this.urlsInfo.click_url, function(res) {
								uni.showModal({
									content: "本机未检测到淘宝客户端，是否打开浏览器访问？",
									success: res => {
										if (res.confirm) {
											plus.runtime.openURL(this.urlsInfo.click_url)
										}
									}
								})
							}, 'taobao://');
						}
					}
					// #endif
				})
			},

			sharewx() {
				if (this.sharePostUrl) {
					uni.hideLoading()
					uni.shareWithSystem({
						imageUrl: this.sharePostUrl,
						success: (res) => {},
					})
				} else {
					if (this.urlsInfo.wx_qrcode_url) {
						uni.showLoading({
							title: ''
						});
						this.CVS = uni.createCanvasContext('sharePoster', this);
						this.CVS.drawImage(this.backpic, 0, 0, this.canvasInfo.canvasW, this.canvasInfo.canvasH);
						this.CVS.drawImage(this.urlsInfo.wx_qrcode_url, 276, 1014, 198, 198);

						this.CVS.setFillStyle('#333333');
						this.CVS.setFontSize(uni.upx2px(58));
						this.CVS.fillText(this.appInfo.appName, 245, 42); //商品价格

						setTimeout(() => {
							this.CVS.draw(false, res => {
								uni.canvasToTempFilePath({
									canvasId: 'sharePoster',
									success: ress => {
										uni.hideLoading();
										console.log(ress);
										this.sharePostUrl = ress.tempFilePath
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
									fail() {
										uni.hideLoading();
									}
								});
							});
						}, 300);
					}
				}
			},

			copyWord() {
				if (this.urlsInfo) {
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
	}
</script>

<style lang="scss">
	.elmgs-wrapper {
		width: 100%;
		min-height: 100vh;
		background: linear-gradient(6deg, #7BB4B6, #8DC0C4);

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
				background: linear-gradient(6deg, #F0BE38, #FCC73A);
				border: 1rpx solid #FFFFFF;
				box-shadow: 0px 1rpx 0px 0px #38696A;
				opacity: 0.98;
				z-index: 2;
				border-radius: 0rpx 0rpx 30rpx 30rpx;

				.appName {
					font-size: 24rpx;
					font-weight: 500;
					color: #FFFFFF;
				}

				.borderCenter {
					width: 2rpx;
					height: 24rpx;
					background: #FFFFFF;
					margin: 0 10rpx;
				}

				.icon-box {
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
					box-shadow: 5rpx 9rpx 32rpx 0px rgba(1, 143, 243, 0.25), -5rpx -5rpx 35rpx 0px rgba(1, 143, 243, 0.14);
					border-radius: 24rpx;

					.buzhou-content {
						width: 506rpx;
						height: 136rpx;
						margin-top: 50rpx;
					}

					.collectCoupons-btn {
						width: 430rpx;
						height: 80rpx;
						background: #529C9E;
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
					height: 365rpx;
					background: #FFFFFF;
					box-shadow: 5rpx 9rpx 32rpx 0px rgba(1, 143, 243, 0.25), -5rpx -5rpx 35rpx 0px rgba(1, 143, 243, 0.14);
					border-radius: 24rpx;
					padding: 0 20rpx;

					.share-btn {
						width: 430rpx;
						height: 80rpx;
						background: #529C9E;
						border-radius: 40rpx;
						font-size: 32rpx;
						font-weight: 500;
						color: #FFFFFF;
						margin-top: 70rpx;
					}

					.copy-btn {
						width: 430rpx;
						height: 80rpx;
						background: #FFFFFF;
						border: 1rpx solid #529C9E;
						border-radius: 40rpx;
						font-size: 32rpx;
						font-weight: 500;
						color: #529C9E;
						margin-top: 40rpx;
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
