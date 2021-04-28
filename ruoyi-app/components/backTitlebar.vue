<template>
	<view class="backTitlebar-wrapper colCen borderBox">
		<view class="fixedBox">
			<view class="topbarbox"></view>
			<view class="headerNavigationbar rowCenBet borderBox">
				<view class="backIcon rowCenSta" @click="backUrl()">
					<image src="@/static/images/home/return.png" mode=""></image>
				</view>
				<view class="pageTitle">
					{{titleText}}
				</view>
				<view class="emptybox rowCenEnd">
					<view v-if="pageForm=='browsing'" class="cleanAll iconfont" @click="cleanAll()">&#xe601;</view>
					<view v-if="pageForm=='subsidy'" class="rightfont" @click="gopath()">
						订单详情
					</view>
				</view>
			</view>
		</view>
		<view class="placeBox">
			<view class="topbarbox"></view>
			<view class="placeemptybox">
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			titleText: {
				type: String,
				default: ''
			},
			pageForm: {
				type: String,
				default: ''
			}
		},
		data() {
			return {

			}
		},
		methods: {
			backUrl() {
				if (this.pageForm == 'loginPage') {
					this.$emit('backIndex')
				} else {
					uni.navigateBack({
						delta: 1
					})
				}
			},
			cleanAll() {
				this.$emit('cleanAll')
			},
			gopath(){
				this.$emit('gopath')
			}
		}
	}
</script>

<style lang="scss">
	.backTitlebar-wrapper {
		.placeBox {
			.placeemptybox {
				height: 90rpx;
			}
		}

		.fixedBox {
			width: 100%;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 100;
			background-color: #FFFFFF;

			.headerNavigationbar {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;

				.backIcon {
					width: 60rpx;
					height: 32rpx;
					z-index: 1;

					image {
						width: 17rpx;
						height: 32rpx;
					}
				}

				.pageTitle {
					font-size: 32rpx;
					font-weight: 500;
					color: #333333;
				}

				.emptybox {
					width: 60rpx;
					height: 32rpx;
					position: relative;

					.cleanAll {
						font-size: 32rpx;
					}

					.rightfont {
						position: absolute;
						white-space: nowrap;
						font-size: 24rpx;
						font-weight: 500;
						color: #666666;
					}
				}
			}
		}
	}
</style>
