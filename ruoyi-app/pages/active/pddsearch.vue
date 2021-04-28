<template>
	<view class="pddsearch-wrapper wrapperLayer borderBox">
		<view class="topbarbox"></view>
		<view class="fixed-container colCen">
			<view class="topbarbox"></view>
			<view class="headerBar-container rowCenBet">
				<view class="iconfont backicon" @tap="goback()">
					&#xe630;
				</view>
				<view class="titleBox rowCen" :style="'color:'+ (scrollTop<fiexdtop?'#DD2425;':'#ffffff;')">
					拼多多
				</view>
				<view class="rightEmpty">
				</view>
			</view>
		</view>
		<view class="pageContent-container colCen">
			<view class="search-region colCen">
				<view class="pageTitle-bar rowCenCen">
					<view class="leftIcon defIcon">
						<image src="../../static/images/active/pdd.png" mode="aspectFill"></image>
					</view>
					<view class="titleInfo colSta">
						<view class="topfont" >
							拼多多全网优惠
						</view>
						<view class="bottomfont">
							领券下单最高省千元
						</view>
					</view>
				</view>

				<view class="searchContent rowCenBet" @tap="gosearch()">
					<view class="leftcontent rowCen">
						<view class="search-icon iconfont">
							&#xe616;
						</view>
						<view class="tipsfont">
							输入商品名称或粘贴宝贝标题搜索
						</view>
					</view>
					<view class="right-btn rowCenCen">
						<view>搜索</view>
					</view>
				</view>
			</view>
			<view class="emptybar" :style="'width:100%;height:'+(scrollTop>fiexdtop?'90':'0')+'rpx;'">
			</view>
			
			<view class="rangeList-container rowCen" :class="scrollTop>fiexdtop?'tofixed':''" :style="'top:'+(scrollTop>fiexdtop?fiexdHeight:'0')+'px;'">
				<scroll-view class="scrollview-content" scroll-x scroll-with-animation="true">
					<block v-for="(items,index) in navList" :key="index">
						<view class="rangeItem" :class="nowCurrent==items.cid?'rangeItem-active':''" @tap="changeRange(items.cid)">
							<view class="boxcontent colCenCen">
								<view class="nameBox">
									{{items.cname}}
								</view>
								<view class="border"></view>
							</view>
						</view>
					</block>
				</scroll-view>
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
	</view>
</template>

<script>
	export default {
		data() {
			return {
				pageTop: 0,
				nowCurrent: 0,
				scrollTop:0,
				navList: [],
				
				fiexdHeight:'',
				fiexdtop:'',
				goodsList: [],
				pageCurrent: 1,
				canloadmore: false,
				loadstatus: 'loading'
			}
		},
		onLoad() {
			this.getNav()
		},
		onPageScroll(e) {
			this.scrollTop = e.scrollTop
		},
		onReachBottom() {
			if(this.canloadmore){
				this.getData()
			}
		},
		mounted() {
			uni.createSelectorQuery().in(this).select('.fixed-container').boundingClientRect(data => {
				console.log(data.top);
				this.fiexdHeight =data.height
			}).exec();
			uni.createSelectorQuery().in(this).select('.rangeList-container').boundingClientRect(data => {
				console.log(data.top);
				this.fiexdtop =data.top - this.fiexdHeight
			}).exec();
		},
		methods: {
			getNav() {
				this.$http.post('category/getCategoryList', {
					ctype: 2,
					"parentId": 0
				}, 'application/json').then(res => {
					console.log(res);
					this.navList = res
					this.nowCurrent = res[0].cid
					this.getData()
				})
			},
			getData() {
				this.$http.post('pddgoods/getGoodsRecommend', {
					catId: this.nowCurrent,
					channelType: 4,
					limit: 10,
					offset: this.pageCurrent
				}, 'application/json').then(res => {
					uni.stopPullDownRefresh();
					console.log(res);
					if (res.goodsList.length < 10) {
						this.pageCurrent+=10
						this.canloadmore = false
						this.loadstatus = 'nomarl'
					} else {
						this.canloadmore = true
						this.loadstatus = 'loading'
						this.pageCurrent+=10
					}
					this.goodsList = this.goodsList.concat(res.goodsList)
				})
			},
			
			changeRange(id) {
				this.pageCurrent = 1
				this.canloadmore = false
				this.nowCurrent = id
				this.loadstatus = 'loading'
				this.goodsList = []
				this.getData()
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
			},
			
			gosearch(){
				uni.navigateTo({
					url: '../search/search?type=2'
				})
			}
		},
		onPullDownRefresh() {
			this.pageCurrent = 1;
			this.canloadmore = false;
			this.goodsList = [];
			this.loadstatus = 'loading';
			this.getData()
		}
	}
</script>

<style lang="scss">
	.pddsearch-wrapper {
		width: 100%;

		.fixed-container {
			width: 100%;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 110;
			background-color: #DD2425;

			.headerBar-container {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;

				.backicon {
					font-size: 30rpx;
					color: #FFFFFF;
				}

				.titleBox {
					font-size: 32rpx;
					font-weight: 500;
					z-index: 10;
					transition: all 0.5s;
				}

				.rightEmpty {
					width: 32rpx;
					height: 32rpx;
				}
			}
		}

		.pageContent-container {
			width: 100%;

			.search-region {
				width: 100%;
				height: 340rpx;
				padding: 0 75rpx;
				background-color: #DD2425;

				.pageTitle-bar {
					width: 100%;
					margin-top: 110rpx;

					.leftIcon {
						width: 75rpx;
						height: 75rpx;
					}

					.titleInfo {
						margin-left: 15rpx;

						.topfont {
							font-size: 36rpx;
							font-weight: 800;
							color: #FFFFFF;
						}

						.bottomfont {
							font-size: 26rpx;
							font-weight: 500;
							color: #FFFFFF;
						}
					}
				}

				.searchContent {
					width: 100%;
					height: 80rpx;
					border-radius: 40rpx;
					background-color: #FFFFFF;
					margin-top: 40rpx;
					padding: 0 10rpx;

					.leftcontent {
						margin-left: 25rpx;

						.search-icon {
							font-size: 32rpx;
							font-weight: 500;
							color: #999999;
							margin-right: 25rpx;
						}

						.tipsfont {
							font-size: 26rpx;
							font-weight: 500;
							color: #999999;
						}
					}

					.right-btn {
						width: 116rpx;
						height: 60rpx;
						background: linear-gradient(266deg, #FF012E, #FF1017);
						border-radius: 30rpx;
						font-size: 24rpx;
						font-weight: 500;
						color: #FFFFFF;
					}
				}
			}

			.rangeList-container {
				width: 100%;
				height: 80rpx;
				padding-left: 32rpx;
				z-index: 101;

				.scrollview-content {
					width: 100%;
					height: 100%;
					white-space: nowrap;

					.rangeItem {
						display: inline-flex;
						margin-right: 45rpx;
						height: 100%;

						.boxcontent {
							height: 100%;

							.nameBox {
								font-size: 30rpx;
								font-weight: 500;
								color: #333333;
							}

							.border {
								width: 60%;
								height: 2rpx;
								background: transparent;
							}
						}
					}

					.rangeItem-active {
						.boxcontent {
							.nameBox {
								font-size: 32rpx;
							}

							.border {
								background: #FF012E;
								margin-top: 8rpx;
							}
						}
					}
				}
			}
			
			.tofixed{
				position: fixed;
				z-index: 100;
				background-color: #FFFFFF;
			}

			.goodsList-container {
				z-index: 1;
				width: 100%;
				padding: 0 32rpx;
				margin-top: 10rpx;

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
	}
</style>
