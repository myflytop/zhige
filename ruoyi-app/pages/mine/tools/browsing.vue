<template>
	<view class="browsing-wrapper colCen wrapperLayer">
		<titleBar :titleText='"浏览足迹"' :pageForm='"browsing"' @cleanAll="clean"></titleBar>
<!-- 九朵云淘宝客。https://www.jiuduoyun.net/ -->
		<view class="colCen browsingGoodslist borderBox">
			<view class="goodslist-wrapper borderBox rowCen">
				<view class="goods-items borderBox colCen" v-for="(items,index) in goodsList" :key='index'>
					<view class="items-container borderBox colCen">
						<view class="image-container defIcon">
							<image :src="items.mainPic" mode=""></image>
						</view>
						<view class="goodsInfo colCenBet borderBox">
							<view class="goodsName-box rowCen">
								<image class="logoicon" src="../../../static/images/goods/tmtips.png" mode=""></image>
								<view class="goodsText">
									{{items.dtitle?items.dtitle:items.title}}
								</view>
							</view>
							<view class="couponInfo-bar rowCen">
								<view class="couponbox">
									{{items.couponPrice}}元券
								</view>
								<!-- <view class="backPrice">
									返{{items.backprice}}元
								</view> -->
							</view>
							<view class="goodsPrice-goodSale rowCenBet">
								<view class="goods-price rowEnd">
									<view class="after">券后<span class='rmb'>￥</span></view>
									<view class="price">{{items.actualPrice}}</view>
								</view>
								<view class="saleNum-box">
									已售{{items.monthSales}}
								</view>
							</view>
						</view>
					</view>
				</view>
				<view class="empty-container colCenCen" style="width: 100%;height: 100%;margin-top: 30vh;" v-if="loadstatus=='nomarl' && goodsList.length==0">
					<view class="defIcon" style="width: 200rpx; height: 200rpx;" >
						<image src="../../../static/images/goods/empty.png" mode="aspectFill"></image>
					</view>
					<view class="texttips" style="margin-top: 40rpx; font-size: 28rpx;font-weight: 400;color: #666666;width: 100%; text-align: center;">
						您还没有浏览过商品哦~
					</view>
				</view>
				<view style="width: 100%;" v-else>
					<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
				</view>
			</view>
		</view>
		
		<u-modal v-model="showModel" :show-title="false" :show-cancel-button="true" :content="'确定要清空浏览记录嘛？'" @confirm="confirm" :async-close="true"></u-modal>
	</view>
</template>

<script>
	import titleBar from '../../../components/backTitlebar.vue'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				goodsList: [],
				loadstatus: 'loading',
				currentPage: 1,
				showModel: false,
				canloadMore: false
			}
		},
		onLoad() {
			this.getData();
		},
		onReachBottom() {
			if (this.canloadMore) {
				this.getData()
			}
		},
		methods: {
			getData() {
				this.$http.post('browsingHistory/getList', {
					limit: 10,
					offset: this.currentPage
				}, 'application/json').then((res) => {
					console.log(res, '=========>浏览足迹');
					uni.stopPullDownRefresh()
					if (res.length < 10) {
						this.loadstatus = 'nomarl'
						this.canloadMore = false
					} else {
						this.currentPage+=10
						this.loadstatus = 'loading'
						this.canloadMore = true
					}

					if (this.currentPage > 1) {
						this.goodsList = this.goodsList.concat(res)
					} else {
						this.goodsList = res
					}
				})
			},
			clean(){
				this.showModel = true
			},
			confirm(){
				this.$http.post('browsingHistory/cancelBrowsing').then(res=>{
					this.showModel = false
					this.goodsList = []
				})
			}
		},
		onPullDownRefresh() {
			this.currentPage = 0
			this.goodsList = []
			this.getData()
		}
	}
</script>

<style lang="scss">
	.browsing-wrapper {
		width: 100%;
	}

	.browsingGoodslist {
		width: 100%;
		margin-top: 20rpx;
		background-color: #F0F1F7;

		.goodslist-wrapper {
			width: 100%;
			padding: 0 22rpx;
			flex-wrap: wrap;

			.goods-items {
				width: 50%;
				height: 490rpx;
				margin-bottom: 20rpx;

				.items-container {
					width: 340rpx;
					height: 100%;
					margin: 10rpx 0;
					background-color: #FFFFFF;
					padding: 10rpx;

					.image-container {
						width: 100%;
						height: 310rpx;
					}

					.goodsInfo {
						width: 100%;
						height: 160rpx;
						margin-top: 10rpx;

						.goodsName-box {
							width: 100%;

							.logoicon {
								width: 50rpx;
								height: 24rpx;
								margin-right: 10rpx;
							}

							.goodsText {
								width: 250rpx;
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
								white-space: nowrap;
								overflow-x: hidden;
								text-overflow: ellipsis;
							}
						}

						.couponInfo-bar {
							width: 100%;

							.couponbox {
								width: 100rpx;
								height: 30rpx;
								line-height: 30rpx;
								text-align: center;
								background: url(../../../static/images/goods/couponbac.png)no-repeat;
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

						.goodsPrice-goodSale {
							width: 100%;
							margin-bottom: 10rpx;

							.goods-price {
								.after {
									font-size: 20rpx;
									font-weight: 400;
									color: #999999;
									line-height: 42rpx;

									.rmb {
										font-size: 22rpx;
										color: #FF4242;
									}
								}

								.price {
									color: #FF4242;
									font-weight: 500;
									font-size: 34rpx;
								}
							}

							.saleNum-box {
								font-size: 20rpx;
								font-weight: 400;
								color: #999999;
							}
						}
					}
				}
			}
		}
	}
</style>
