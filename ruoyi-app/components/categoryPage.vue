<template>
	<scroll-view class="swiper-scroll" scroll-y="true" :scroll-top='scrollindex' @scroll='pagescroll' scroll-with-animation lower-threshold='500'
	 @scrolltolower='scrollmorePage' :refresher-threshold='75' :refresher-triggered='triggeredstate' :refresher-enabled='canrefresh && canrefush'
	 @refresherrefresh='refresh' @refresherrestore="onRestore" refresher-default-style='none' :bounce='false'>
		<view class="category-page-wrapper colCen borderBox wrapperLayer">
			<view :style="'padding-top:'+(Topheight-75)+'px;background-color: #FFFFFF; width: 100%;'">
				<view class="loading-img rowCenCen">
					<view class="imgbox defIcon">
						<image src="../static/images/home/loading.gif" mode="aspectFill"></image>
					</view>
				</view>
			</view>
			<view class="secondary-classification-container colCen">
				<view class="classificationList-container rowCen borderBox">
					<block v-for="(items,index) in classificationList" :key="index">
						<view class="classification-item colCen" @tap="goPath(items)">
							<view class="items-container colCen">
								<view class="defIcon classpic">
									<image :src="items.cpic" mode="aspectFill"></image>
								</view>
								<view class="className-box">
									<view>{{items.cname}}</view>
								</view>
							</view>
						</view>
					</block>
				</view>
			</view>


			<view class="bottomGoodslist-container colCen borderBox">
				<view class="hotgoods colCen borderBox">
					<view class="titlebar-container rowCenCen">
						<image class="titlepic" src="../static/images/home/titpic.png" mode="aspectFill"></image>
					</view>
					<view class="hot-goods-content rowCenBet">
						<view class="hotgoods-items colCen" v-for="(items,index) in hotList" :key='index' @click="goDetails(items)">
							<view class="image-container defIcon">
								<image :src="items.mainPic" mode=""></image>
							</view>
							<view class="goodsInfo colCen borderBox">
								<view class="goodsName-box">
									{{items.dtitle}}
								</view>
								<view class="goods-price rowCen">
									<view class="font rowCenCen">
										<view>券后价</view>
									</view>
									<view class="price">
										￥{{items.actualPrice}}
									</view>
								</view>
							</view>
						</view>
					</view>
				</view>
				<view class="sortbar-container rowCenBet borderBox">
					<block v-for="(items,index) in sortList" :key="index">
						<view class="sortItems-container rowCenCen" :class="sortCurrent==index?'sortItems-container-active':''" @click="selectSort(index)">
							<view class="sortname">
								{{items.sortname}}
							</view>
							<view class="defIcon directionbox" v-if="index==3">
								<image v-if="sortCurrent!=3 " src="https://cmsstatic.ffquan.cn//wap_new/search/images/sort.svg" mode=""></image>
								<block v-else>
									<image v-if="priceUp" src="https://cmsstatic.ffquan.cn//wap_new/search/images/asce.svg" mode=""></image>
									<image v-else src="https://cmsstatic.ffquan.cn//wap_new/search/images/desc.svg" mode=""></image>
								</block>
							</view>
						</view>
					</block>
				</view>

				<view class="colCen borderBox goodsList-container" v-if='canload'>
					<view class="listbox rowCenBet borderBox">
						<view class="goods-items-container borderBox colCen" v-for="(items,index) in goodsList" :key='index' @click="goDetails(items)">
							<view class="items-container borderBox colCen">
								<view class="image-container defIcon">
									<image :src="items.mainPic" mode="aspectFill"></image>
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
										<view class="goods-price rowEnd">
											<view class="font">
												券后价
											</view>
											<view class="rmb">
												￥
											</view>
											<view class="price">
												{{items.actualPrice}}
											</view>
										</view>
									</view>
									<view class="goodsPrice-goodSale colCen borderBox">
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
					</view>
					<aLoadMore status="loading" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
				</view>
			</view>
		</view>
	</scroll-view>
</template>

<script>
	export default {
		props: {
			Topheight: {
				type: Number,
				default: 90
			},
			canload: {
				type: Boolean,
				default: false
			},
			canrefush:{
				type:Boolean
			},
			parentId: [Number, String],
		},
		data() {
			return {
				sortCurrent: 0,
				priceUp: false,
				classificationList: [],
				sortList: [{
						sortname: '人气',
						type: 'mood'
					},
					{
						sortname: '最新',
						type: 'newest'
					},
					{
						sortname: '销量',
						type: 'salesvolume'
					},
					{
						sortname: '价格',
						type: 'price'
					}
				],
				sortType: 0,
				goodsList: [],
				hotList: [],

				canloadmore: false,
				currentPage: 1,
				loadstatus: 'loading',

				scrollindex: 0,
				canrefresh: true,
				triggeredstate: true,
				canrefresh: true,
			}
		},
		created() {
			this.currentPage = 1
			this.canloadmore = false
			this.loadstatus = 'loading'
			if (this.canload) {
				if (this.parentId) {
					this.getcateList()
					this.getGoodsList();
				}
			}
		},
		watch: {
			canload(nval, oval) {
				if (nval) {
					// if (this.parentId) {
					this.currentPage = 1
					this.canloadmore = false
					this.getcateList()
					this.getGoodsList();
					// } else {

					// }
				}
			}
		},
		methods: {
			refresh(e) {
				this.triggeredstate = true
				if (this._freshing) return;
				this._freshing = true;
				this.goodsList = [];
				this.currentPage = 1;
				this.canloadmore = false;
				this.loadstatus = 'loading';

				this.getcateList();
				this.getGoodsList();
			},
			onRestore() {
				console.log('下拉被终止')
			},
			
			pagescroll(e) {
				this.$emit('scrollNum', e.detail.scrollTop)
				if (!e.detail.scrollTop > 0) {
					setTimeout(() => {
						this.canrefresh = true
					})
				} else {
					// this.canrefresh = false
				}
			},

			onAbort() {
				console.log('refushstop');
			},

			getGoodsList() {
				this.$http.post('tb/getGoodsList', {
					cids: this.parentId,
					pageId: 1,
					pageSize: 10,
					sort: this.sortType,
				}, 'application/json').then((res) => {
					if (res.goodsList.length < 10) {
						this.loadstatus = 'nomarl'
						this.canloadmore = false
					} else {
						this.loadstatus = 'loading'
						this.canloadmore = true
						this.currentPage++
					}
					setTimeout(() => {
						this.triggeredstate = false;
						this._freshing = false;
					}, 100)
					this.goodsList = res.goodsList;
					this.hotList = res.topGoodsList.slice(0, 3);

				})
			},


			scrollmorePage() {
				this.$http.post('tb/getGoodsList', {
					cids: this.parentId,
					pageId: this.currentPage,
					pageSize: 10,
					sort: this.sortType,
				}, 'application/json').then((res) => {
					if (res.goodsList.length < 10) {
						this.loadstatus = 'nomarl'
						this.canloadmore = false
					} else {
						this.loadstatus = 'loading'
						this.canloadmore = true
						this.currentPage++
					}
					if (this.currentPage > 1) {
						this.goodsList = this.goodsList.concat(res.goodsList)
					} else {
						this.goodsList = res.goodsList;
					}
				})
			},


			getcateList() {
				this.$http.post('tb/getTopClass', {
					ctype: 1,
					parentId: this.parentId
				}, 'application/json').then((res) => {
					this.classificationList = res;
				})
			},

			selectSort(idx) {
				this.sortCurrent = idx
				this.currentPage = 1
				this.canloadmore = false
				if (idx != 3) {
					if (idx != this.sortType) {
						this.sortType = idx;
					}
				} else {
					this.priceUp = !this.priceUp;
					if (this.priceUp) {
						console.log('true');
						this.sortType = 6
					} else {
						this.sortType = 5
					}
				}
				this.$nextTick(() => {
					this.getGoodsList();
				})
			},

			goDetails(info) {
				info.searchSource = 1
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},

			goPath(info) {
				uni.navigateTo({
					url: './categories?cid=' + info.cid + '&title=' + info.cname
				})
			}
		}
	}
</script>

<style lang="scss">
	.category-page-wrapper {
		width: 100%;

		.loading-img {
			width: 100%;
			height: 150rpx;

			.imgbox {
				width: 208rpx;
				height: 126rpx;
				// max-height: 72rpx;
			}
		}

		.secondary-classification-container {
			width: 100%;
			background-color: #FFFFFF;

			.classificationList-container {
				flex-wrap: wrap;
				margin-top: 20rpx;
				padding: 0 5rpx;

				.classification-item {
					width: 185rpx;

					.items-container {
						margin-bottom: 40rpx;

						.classpic {
							width: 95rpx;
							height: 95rpx;
						}

						.className-box {
							font-size: 24rpx;
							font-weight: 400;
							color: #333333;
							margin-top: 15rpx;
						}
					}
				}
			}
		}

		.bottomGoodslist-container {
			width: 100%;

			.sortbar-container {
				width: 100%;
				height: 100rpx;
				background-color: #FFFFFF;
				padding: 0 50rpx;

				.sortItems-container {
					width: 90rpx;

					.sortname {
						font-size: 24rpx;
						font-weight: 400;
						color: #333333;
					}

					.directionbox {
						width: 25rpx;
						height: 35rpx;
						margin-left: 5rpx;
					}
				}

				.sortItems-container-active {
					.sortname {
						color: #FF4242;
					}
				}
			}

			.hotgoods {
				width: 100%;
				padding: 0 16rpx;
				background-color: #FFFFFF;

				.titlebar-container {
					width: 100%;

					.titlepic {
						width: 348rpx;
						height: 27rpx;
					}
				}

				.hot-goods-content {
					width: 100%;
					margin-top: 35rpx;
					padding-bottom: 20rpx;
					.hotgoods-items {
						width: 232rpx;

						.image-container {
							width: 232rpx;
							height: 232rpx;
							overflow: hidden;
							border-radius: 8rpx;
						}

						.goodsInfo {
							width: 100%;

							.goodsName-box {
								width: 232rpx;
								margin: 15rpx 0rpx;
								font-size: 28rpx;
								line-height: 34rpx;
								font-weight: 400;
								color: #333333;
								white-space: nowrap;
								overflow-x: hidden;
								text-overflow: ellipsis;
							}
							
							.goods-price{
								width: 100%;
								.font{
									width: 72rpx;
									height: 30rpx;
									background: linear-gradient(-90deg, #FF311C, #FF9102);
									border-radius: 5rpx;
									font-size: 20rpx;
									font-weight: 500;
									color: #FFFFFF;
								}
								.price{
									margin-left: 10rpx;
									font-size: 28rpx;
									font-weight: bold;
									color: #FF4242;
								}
							}
						}
					}
				}
			}

			.goodsList-container {
				width: 100%;

				.listbox {
					width: 100%;
					flex-wrap: wrap;
					margin-top: 20rpx;
					padding: 0 14rpx;

					.goods-items-container {
						width: 354rpx;
						height: 544rpx;
						margin-bottom: 20rpx;

						.items-container {
							width: 354rpx;
							height: 100%;
							overflow: hidden;
							border-radius: 8rpx;
							background-color: #FFFFFF;

							.image-container {
								width: 100%;
								height: 354rpx;
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

									.goods-price {
										width: 100%;
										font-size: 20rpx;
										font-weight: 500;
										color: #999999;
										margin-top: 15rpx;
										line-height: 34rpx;

										.font {
											font-weight: 500;
											color: #999999;
											line-height: 28rpx;
											margin-right: 10rpx;
										}

										.rmb {
											font-weight: bold;
											color: #FF4242;
											line-height: 28rpx;
										}

										.price {
											color: #FF4242;
											font-weight: 500;
											font-size: 32rpx;
										}
									}
								}

								.goodsPrice-goodSale {
									width: 100%;

									.couponInfo-bar {
										width: 100%;
										margin: 5rpx 0;

										.couponbox {
											width: 100rpx;
											height: 30rpx;
											line-height: 30rpx;
											text-align: center;
											background: url(@/static/images/goods/couponbac.png)no-repeat;
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
	}
</style>
