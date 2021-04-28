<template>
	<view class="specialOffer-wrapper colCen wrapperLayer">
		<view class="topbarbox"></view>
		<view class="fixed-content colCen">
			<view class="barbac"></view>
			<view class="topbarbox"></view>
			<view class="headerBar-container colCen">
				<view class="borderBox rowCenBet headerbox">
					<view class="leftbackicon defIcon" @tap="goback()">
						<image src="@/static/images/home/returnWhite.png" mode=""></image>
					</view>
					<view class="titleBox rowCen">
						<view class="titleText">
							品牌特卖
						</view>
					</view>
					<view class="rightEmpty">
					</view>
				</view>
			</view>

			<view class="rangeList-container rowCen">
				<scroll-view class="scrollview-content" scroll-x scroll-with-animation="true">
					<block v-for="(items,index) in navList" :key="index">
						<view class="rangeItem colCen" :class="nowCurrent==items.cid?'rangeItem-active':''" @tap="changeRange(items.cid)">
							<view class="nameBox">
								{{items.cname}}
							</view>
							<view class="border"></view>
						</view>
					</block>
				</scroll-view>
			</view>
		</view>

		<view class="shoplist-container colCen">
			<block v-for="(items,index) in shopList" :key='index'>
				<view class="shopItem-card colCen" @tap="goMall(items)">
					<view class="shop-title rowCenBet borderBox">
						<view class="leftshop-icon rowCen">
							<view class="logobox defIcon">
								<image :src="items.brandLogo" mode=""></image>
							</view>
							<view class="shopinfo colCen">
								<view class="shopname">
									{{items.fqBrandName}}
								</view>
							</view>
						</view>

						<view class="rightSale rowCen">
							<view class="goright defIcon">
								<image src="../../static/images/goods/entershop.png" mode="aspectFill"></image>
							</view>
						</view>
					</view>

					<view class="goods-container rowCenBet">
						<block v-for="(itm,index) in items.item" :key="index">
							<view class="goods-items colCen">
								<view class="items-picContent defIcon">
									<image :src="itm.mainPic" mode="aspectFill"></image>
								</view>
								<view class="goodsName">
									{{itm.dtitle}}
								</view>
								<view class="goodsPirce rowCen">
									<view class="rmb">￥</view>
									<view class="autprice">
										{{itm.actualPrice}}
									</view>
									<s class='yuanjia'>{{itm.originalPrice}}</s>
								</view>
							</view>
						</block>
					</view>
				</view>
			</block>
		</view>
		<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				nowCurrent: 0,
				navList: [],
				shopList: [],

				pageCurrent: 1,
				canloadmore: false,
				loadstatus: 'loading'
			}
		},
		onLoad() {
			this.getNav()
		},
		onReachBottom() {
			if (this.canloadmore) {
				this.getData()
			}
		},
		methods: {
			changeRange(id) {
				this.pageCurrent = 1
				this.canloadmore = false
				this.nowCurrent = id
				this.loadstatus = 'loading'
				this.shopList = []
				this.getData()
			},
			getNav() {
				this.$http.post('category/getCategoryList', {
					ctype: 5,
					parentId: 0
				}, 'application/json').then(res => {
					this.navList = res
					this.nowCurrent = res[0].cid
					this.getData()
				})
			},
			getData() {
				this.$http.post('brand/getBrandList', {
					back: 10,
					brandcat: this.nowCurrent,
					minId: this.pageCurrent
				}, 'application/json').then(res => {
					uni.stopPullDownRefresh();
					if(res.brandList.length<10){
						this.pageCurrent = res.minId
						this.canloadmore = false
						this.loadstatus = 'nomarl'
					}else{
						this.canloadmore = true
						this.loadstatus = 'loading'
						this.pageCurrent = res.minId
					}
					this.shopList = this.shopList.concat(res.brandList)
				})
			},
			goDetail(info) {
				console.log(info);
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},
			goMall(info){
				uni.navigateTo({
					url: './brandList?id=' + info.id
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
			this.shopList = []
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
				background: linear-gradient(266deg, #7D0DFC, #D116FD);
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

				.scrollview-content {
					width: 100%;
					height: 100%;
					white-space: nowrap;
					vertical-align: center;

					.rangeItem {
						display: inline-flex;
						margin-right: 45rpx;
						margin-top: 15rpx;

						.nameBox {
							font-size: 30rpx;
							font-weight: 500;
							color: #FFFFFF;
						}

						.border {
							width: 60%;
							height: 1rpx;
							background: transparent;
						}
					}

					.rangeItem-active {
						.nameBox {
							font-size: 32rpx;
						}

						.border {
							background: #FFFFFF;
							margin-top: 8rpx;
						}
					}
				}
			}
		}

		.shoplist-container {
			z-index: 1;
			width: 100%;
			margin-top: 200rpx;
			padding: 0 32rpx;

			.shopItem-card {
				width: 100%;
				height: 360rpx;
				background: #FFFFFF;
				border-radius: 20rpx;
				padding: 0 20rpx;
				margin-bottom: 20rpx;

				.shop-title {
					width: 100%;
					height: 90rpx;

					.leftshop-icon {
						.logobox {
							width: 70rpx;
							height: 50rpx;
						}

						.shopinfo {
							margin-left: 20rpx;

							.shopname {
								font-size: 22rpx;
								font-weight: 500;
								color: #333333;
							}
						}
					}

					.rightSale {
						.goright {
							width: 8rpx;
							height: 17rpx;
						}
					}
				}

				.goods-container {
					width: 100%;

					.goods-items {
						width: 210rpx;
						height: 270rpx;

						.items-picContent {
							width: 100%;
							height: 180rpx;
							border-radius: 8rpx;
							overflow: hidden;
						}

						.goodsName {
							font-size: 22rpx;
							font-weight: 500;
							color: #333333;
							white-space: nowrap;
							overflow: hidden;
							text-overflow: ellipsis;
							width: 100%;
							line-height: 34rpx;
							margin-top: 10rpx;
						}
						
						.goodsPirce{
							width: 100%;
							font-weight: bold;
							color: #FF3537;
							.rmb{
								font-size: 20rpx;
								font-weight: bold;
								color: #FF3537;
								line-height: 30rpx;
							}
							.autprice{
								font-size: 24rpx;
								line-height: 36rpx;
							}
							.yuanjia{
								font-size: 18rpx;
								font-weight: 400;
								text-decoration: line-through;
								color: #333333;
								margin-left: 10rpx;
							}
						}
					}
				}
			}
		}
	}
</style>
