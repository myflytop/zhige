<template>
	<view class="takeoutFood-wrapper wrapperLayer">
		<titleBar titleText='外卖' :pageForm='"takeout"'></titleBar>
		<view class="pageContent-container colCen">
			<block v-for="(items,index) in cardList" :key="index">
				<view class="card-items element colCen" @tap="goNextpage(items)">
					<view class="card-title rowCenBet">
						<view class="left-content rowCen">
							<view class="platIcon defIcon">
								<image :src="items.goodsImg" mode="aspectFill"></image>
							</view>
							<view class="platTitle">
								{{items.goodsName}}
							</view>
						</view>
						<view class="right-btn rowCenCen">
							<view class="fonttext">
								点我领券
							</view>
							<view class="rightbtn defIcon">
								<image src="../../static/images/active/right_icon.png" mode=""></image>
							</view>
						</view>
					</view>
					<view class="card-desc">
						{{items.goodsDes}}
					</view>

					<view class="cardimg defIcon">
						<view class="tipsbox rowCenBet">
							<view class="platinfo rowCenCen">
								<image class="iconbox" :src="appInfo.logo" mode="aspectFill"></image>
								<view class="textbox">
									{{appInfo.appName}}
								</view>
							</view>
							<view class="platinfo rowCenCen">
								<image class="iconbox" :src="items.goodsImg" mode="aspectFill"></image>
								<view class="textbox">
									{{items.nameTitle}}
								</view>
							</view>
						</view>
						<image :src="items.goodsPic" mode="aspectFill"></image>
					</view>
				</view>
			</block>
		</view>
	</view>
</template>

<script>
	import titleBar from '../../components/backTitlebar.vue';
	import common from '../../utils/utils.js'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				appInfo: '',
				cardList: [],
			}
		},
		onLoad() {
			this.getData()
			common.getCache('appInfo').then(res => {
				console.log(res);
				this.appInfo = res
			})
		},
		methods: {
			getData() {
				this.$http.post('localLife/getList').then(res => {
					console.log(res);
					this.cardList = res
				})
			},
			goNextpage(info) {
				uni.navigateTo({
					url: info.urlType == 0 ? '../webView/webView?url=' + info.url : info.url
				})
			}
		}
	}
</script>


<style lang="scss">
	.takeoutFood-wrapper {
		width: 100%;

		.pageContent-container {
			width: 100%;
			margin-top: 20rpx;
			padding: 0 32rpx;

			.card-items {
				width: 100%;
				background-color: #FFFFFF;
				height: 450rpx;
				border-radius: 12rpx;
				padding: 0 20rpx 20rpx 20rpx;
				box-shadow: 0 0 10px rgba(0, 0, 0, .1);
				margin-bottom: 20rpx;

				.card-title {
					width: 100%;
					margin-top: 20rpx;

					.left-content {
						.platIcon {
							width: 35rpx;
							height: 35rpx;
						}

						.platTitle {
							font-size: 32rpx;
							color: #1B1B1B;
							font-weight: bold;
							margin-left: 20rpx;
						}
					}

					.right-btn {
						width: 190rpx;
						height: 58rpx;
						border-radius: 28rpx;
						background-image: linear-gradient(left, #FB4E40, #FE1B4A);

						.fonttext {
							font-size: 28rpx;
							font-weight: 400;
							color: #FFFFFF;
						}

						.rightbtn {
							width: 22rpx;
							height: 22rpx;
							margin-left: 10rpx;
						}
					}
				}

				.card-desc {
					width: 100%;
					color: #FE5958;
					font-weight: 400;
					font-size: 24rpx;
					margin-top: 10rpx;
				}

				.cardimg {
					width: 100%;
					height: 275rpx;
					margin-top: 30rpx;
					position: relative;

					.tipsbox {
						width: 260rpx;
						height: 40rpx;
						background-color: #FFFFFF;
						position: absolute;
						top: 0;
						left: 40rpx;
						border-bottom-left-radius: 12rpx;
						border-bottom-right-radius: 12rpx;
						z-index: 20;

						.platinfo {
							width: 50%;
							height: 100%;
							border-left: 1rpx solid #F0F1F7;

							.iconbox {
								width: 26rpx;
								height: 26rpx;
								margin-right: 10rpx;
							}

							.textbox {
								color: #4A4A4A;
								font-size: 20rpx;
							}
						}
					}
				}
			}
		}
	}
</style>
