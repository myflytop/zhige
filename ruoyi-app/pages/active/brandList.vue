<template>
	<view class="brandList-wrapper wrapperLayer borderBox">
		<view class="barbac"></view>
		<view class="fixed-container colCen" :style="'background:rgba(255,255,255,'+pageTop+');'">
			<view class="topbarbox"></view>
			<view class="headerBar-container rowCenBet">
				<view class="iconfont backicon" :style="'color:'+ (pageTop>0.5?'#000000;':'#ffffff;')" @tap="goback()">
					&#xe630;
				</view>
				<view class="titleBox rowCen" :style="'color:'+ (pageTop>0.5?'#000000;':'#ffffff;')">
					{{shopInfo.fqBrandName}}
				</view>
				<view class="rightEmpty">
				</view>
			</view>
		</view>
		<view class="topbarbox"></view>
		<view class="pageContent-container colCen">
			<view class="shopExplain-container">
				<view class="shopLogo rowCenCen">
					<image class="logobox" :src="shopInfo.brandLogo" mode="aspectFill"></image>
				</view>
				<view class="textcontent">
					{{shopInfo.introduce}}
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
									</view><!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
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
				id:'',
				shopInfo:'',
				
				goodsList:[],
				pageCurrent: 1,
				canloadmore: false,
				loadstatus: 'loading'
			}
		},
		onLoad(options) {
			this.id = options.id
			this.getPageinfo()
		},
		onReachBottom() {
			if (this.canloadmore) {
				this.getPageinfo()
			}
		},
		methods:{
			getPageinfo(){
				this.$http.post('brand/getSingleBrand',{
					back:20,
					id:this.id,
					minId:this.pageCurrent,
					order:1
				},'application/json').then(res=>{
					uni.stopPullDownRefresh();
					this.shopInfo = res.brandList
					this.goodsList = this.goodsList.concat(res.brandList.items)
					if(res.brandList.items.length<20){
						this.canloadmore = false
						this.loadstatus = 'nomral'
						this.pageCurrent = res.minId
					}else{
						this.canloadmore = true
						this.loadstatus = 'loading'
						this.pageCurrent = res.minId
					}
				})
			},
			goDetail(info) {
				console.log(info);
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},
			goback(){
				uni.navigateBack({
					delta:1
				})
			}
		},
		onPageScroll(e) {
			this.pageTop = e.scrollTop / 10
		},
		onPullDownRefresh() {
			this.pageCurrent = 1
			this.goodsList = []
			this.canloadmore = false
			this.getPageinfo()
		}
	}
</script>

<style lang="scss">
	.brandList-wrapper {
		width: 100%;

		.barbac {
			width: 100%;
			height: 600rpx;
			background: linear-gradient(0deg, rgba(255, 255, 255, 0), rgba(171, 171, 171, 1));
			background-size: 100% 100%;
			position: absolute;
			pointer-events: none;
			top: 0;
			left: 0;
		}

		.fixed-container {
			width: 100%;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 100;

			.headerBar-container {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;

				.backicon {
					font-size: 30rpx;
					transition: all 0.5s;
				}

				.titleBox {
					font-size: 32rpx;
					font-weight: 500;
					color: #FFFFFF;
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
			margin-top: 150rpx;
			padding: 0 32rpx;
			z-index: 10;

			.shopExplain-container {
				width: 100%;
				position: relative;

				.shopLogo {
					position: absolute;
					top: -40rpx;
					width: 100%;
					height: 80rpx;

					.logobox {
						width: 80rpx;
						height: 80rpx;
						border-radius: 50%;
					}
				}

				.textcontent {
					width: 100%;
					padding: 70rpx 40rpx 40rpx 40rpx;
					background: rgba(254, 254, 246, 1);
					border-radius: 20rpx;
					text-indent: 2em;
					font-size: 28rpx;
					font-weight: 400;
					color: #333333;
					line-height: 44rpx;
				}
			}
		}
		
		
		.goodsList-container {
			z-index: 1;
			width: 100%;
			margin-top: 20rpx;
		
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
