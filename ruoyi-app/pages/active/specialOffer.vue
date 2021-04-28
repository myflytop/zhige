<template>
	<view class="specialOffer-wrapper colCen wrapperLayer">
		<view class="topbarbox"></view>
		<view class="topbac-content">
			<view class="colorContent defIcon">
				<image src="../../static/images/active/orgbac.png" mode="aspectFill"></image>
			</view>
		</view>

		<view class="fixed-content colCen">
			<view class="barbac"></view>
			<view class="topbarbox"></view>
			<view class="headerBar-container colCen">
				<view class="borderBox rowCenBet headerbox">
					<view class="leftbackicon defIcon" @tap="goback()">
						<image src="@/static/images/home/returnWhite.png" mode=""></image>
					</view>
					<view class="titleBox rowCen">
						<view class="titleIcon defIcon">
							<image src="../../static/images/active/nine.png" mode=""></image>
						</view>
						<view class="titleText">
							包邮
						</view>
					</view>
					<view class="rightEmpty">
					</view>
				</view>
			</view>

			<view class="rangeList-container rowCen">
				<block v-for="(items,index) in priceRangelist" :key="index">
					<view class="rangeItem colCen" :class="nowCurrent==items.type?'rangeItem-active':''" @tap="changeRange(items.type)">
						<view class="nameBox">
							{{items.txt}}
						</view>
						<view class="border"></view>
					</view>
				</block>
			</view>
		</view>



		<view class="goodsList-container colCen borderBox">
			<view class="goods-content rowStaBet">
				<view class="goods-items borderBox colCen" v-for="(items,index) in goodsList" :key='index' @click="goDetail(items)">
					<view class="items-container borderBox colCen">
						<view class="image-container defIcon">
							<image :src="items.mainPic" mode=""></image>
						</view>
						<view class="goodsInfo colCenBet borderBox">
							<view class="topgoodsname-box colCen">
								<view class="goodsName-box rowCen">
									<view class="typeIcon-content defIcon" v-if="items.searchSource ==1">
										<image v-if="items.shopType==0" src="@/static/images/goods/tbtips.png" mode="heightFix"></image>
										<image v-else src="@/static/images/goods/tmtips.png" mode="heightFix"></image>
									</view>
									<view class="typeIcon-content defIcon" v-if="items.searchSource ==2">
										<image src="@/static/images/goods/pddtips.png" mode="heightFix"></image>
									</view>
									<view class="typeIcon-content defIcon" v-if="items.searchSource ==3">
										<image src="@/static/images/goods/jdtips.png" mode="heightFix"></image>
									</view>
									<view class="goodsText">
										{{items.dtitle}}
									</view>
								</view>

								<view class="couponInfo-bar rowCen">
									<view class="couponbox rowCenCen" v-if="items.couponPrice>0">
										<view>
											{{items.couponPrice}}元券
										</view>
									</view>
									<!-- <view class="backPrice"> -->
									<!-- 返{{items.backprice}}元 -->
									<!-- </view> -->
								</view>
							</view>
							<view class="goodsPrice-goodSale colCen borderBox">
								<view class="goods-price rowEnd">
									<view class="font">
										券后
									</view>
									<view class="rmb">
										￥
									</view>
									<view class="price">
										{{items.actualPrice}}
									</view>
								</view>
								<view class="saleNum-box">
									已售{{items.monthSales}}
								</view>
								<view class="shopinfo-box">
									{{items.shopName}}
								</view>
							</view>
						</view>
					</view>
				</view>
				<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				nowCurrent: -1,
				priceRangelist: [{
						txt: '推荐',
						type: -1
					},
					{
						txt: '5.9元区',
						type: 1
					},
					{
						txt: '9.9元区',
						type: 2
					},
					{
						txt: '19.9元区',
						type: 3
					}
				],
				goodsList: [],

				pageCurrent: 1,
				canloadmore: false,
				loadstatus: 'loading'
			}
		},
		onLoad() {
			this.getData()
		},
		onReachBottom() {
			if (this.canloadmore) {
				this.getData()
			}
		},
		methods: {
			changeRange(type) {
				this.pageCurrent = 1
				this.canloadmore = false
				this.nowCurrent = type
				this.getData()
			},
			getData() {
				this.$http.post('tb/getNineGoods', {
					nineCid: this.nowCurrent,
					pageId: this.pageCurrent,
					pageSize: 20
				}, 'application/json').then(res => {
					uni.stopPullDownRefresh();
					if (this.pageCurrent == 1) {
						this.goodsList = res.t
					} else {
						this.goodsList = this.goodsList.concat(res.t)
					}
					if (res.t.length < 20) {
						this.canloadmore = false
						this.loadstatus = 'nomarl'
					} else {
						this.canloadmore = true
						this.loadstatus = 'loading'
						this.pageCurrent++
					}
				})
			},
			goDetail(info) {
				console.log(info);
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},
			goback() {
				uni.navigateBack({
					delta: 1
				})
			}
		},
		onPullDownRefresh() {
			this.pageCurrent = 1
			this.goodsList = []
			this.canloadmore = false
			this.getData()
		}
	}
</script>

<style lang="scss">
	.specialOffer-wrapper {
		width: 100%;
		min-height: 380rpx;
		position: relative;

		.topbac-content {
			width: 100%;
			height: 380rpx;
			position: absolute;

			.colorContent {
				width: 100%;
				height: 380rpx;
			}
		}

		.fixed-content {
			width: 100%;
			overflow: hidden;
			position: fixed;
			z-index: 100;

			.barbac {
				width: 100%;
				height: 380rpx;
				background: url('../../static/images/active/orgbac.png')no-repeat;
				background-size: 100% 100%;
				position: absolute;
				pointer-events: none;
				top: 0;
				left: 0;
			}

			.headerBar-container {
				width: 100%;
				height: 90rpx;
				z-index: 100;

				.headerbox {
					width: 100%;
					height: 90rpx;
					padding: 0 32rpx;

					.leftbackicon {
						width: 32rpx;
						height: 32rpx;
						display: flex;
						align-items: center;
						justify-content: flex-start;

						image {
							width: 17rpx;
							height: 32rpx;
						}
					}

					.titleBox {
						.titleIcon {
							width: 46rpx;
							height: 37rpx;
						}

						.titleText {
							font-size: 32rpx;
							font-weight: 500;
							color: #FFFFFF;
							margin-left: 15rpx;
							z-index: 101;
						}
					}

					.rightEmpty {
						width: 32rpx;
						height: 32rpx;
					}
				}
			}

			.rangeList-container {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;
				z-index: 101;

				.rangeItem {
					margin-right: 45rpx;

					.nameBox {
						font-size: 28rpx;
						font-weight: 500;
						color: #FFFFFF;
					}

					.border {
						width: 70%;
						height: 1rpx;
						background: transparent;
					}
				}

				.rangeItem-active {
					.nameBox {
						font-size: 36rpx;
					}

					.border {
						background: #FFFFFF;
						margin-top: 8rpx;
					}
				}
			}
		}

		.goodsList-container {
			z-index: 1;
			width: 100%;
			padding: 0 32rpx;
			margin-top: 210rpx;

			.goods-content {
				width: 100%;
				flex-wrap: wrap;

				.goods-items {
					width: 336rpx;
					height: 526rpx;
					margin-bottom: 20rpx;

					.items-container {
						width: 336rpx;
						height: 100%;
						overflow: hidden;
						border-radius: 8rpx;
						background-color: #FFFFFF;

						.image-container {
							width: 100%;
							height: 336rpx;
						}

						.goodsInfo {
							width: 100%;
							height: 190rpx;
							margin-top: 10rpx;
							padding: 0 10rpx 10rpx 10rpx;

							.topgoodsname-box {
								width: 100%;

								.goodsName-box {
									width: 100%;

									.typeIcon-content {
										width: 60rpx;
										height: 24rpx;
										margin-right: 5rpx;
									}

									.goodsText {
										width: 250rpx;
										font-size: 28rpx;
										line-height: 34rpx;
										font-weight: 400;
										color: #333333;
										white-space: nowrap;
										overflow-x: hidden;
										text-overflow: ellipsis;
									}
								}

								.couponInfo-bar {
									width: 100%;
									margin-top: 20rpx;

									.couponbox {
										width: 100rpx;
										height: 30rpx;
										line-height: 30rpx;
										text-align: center;
										background: url(../../static/images/goods/couponbac.png)no-repeat;
										background-size: 100% 100%;
										font-size: 20rpx;
										font-weight: 500;
										color: #FF4242;
										margin-right: 10rpx;
									}

									.backPrice {
										width: 100rpx;
										height: 30rpx;
										background: linear-gradient(-90deg, #7619EC, #A429F3);
										border-radius: 5rpx;
										font-size: 20rpx;
										font-weight: 500;
										text-align: center;
										line-height: 30rpx;
										color: #FFFFFF;
									}
								}
							}

							.goodsPrice-goodSale {
								width: 100%;

								.goods-price {
									width: 100%;
									font-size: 20rpx;
									font-weight: 500;
									color: #999999;
									line-height: 34rpx;

									.font {
										font-weight: 500;
										color: #999999;
										line-height: 32rpx;
										margin-right: 10rpx;
									}

									.rmb {
										font-weight: bold;
										color: #FF4242;
										line-height: 32rpx;
									}

									.price {
										color: #FF4242;
										font-weight: 500;
										font-size: 28rpx;
									}
								}

								.saleNum-box {
									width: 100%;
									font-size: 20rpx;
									font-weight: 400;
									line-height: 34rpx;
									color: #999999;
								}

								.shopinfo-box {
									width: 100%;
									font-size: 20rpx;
									font-weight: 400;
									line-height: 34rpx;
									color: #999999;
								}
							}
						}
					}

				}
			}
		}
	}
</style>
