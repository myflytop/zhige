<template>
	<view class="zeroBuy-wrapper wrapperLayer">
		<view class="flexbox borderBox colCen" :style="'background:rgba(255,255,255,'+ scrollTop/100 +');'">
			<view class="topbarbox"></view>
			<view class="headerBar-container rowCenBet">
				<view class="leftimgbox rowCen" @tap="back()">
					<view class="shadow rowCenCen" :style="'background:rgba(255,183,32,'+ (1-scrollTop/100) +');'">
						<view class="iconfont" :style="'color:' + ((scrollTop/100)>0.5?'#222222;':'#ffffff;')">&#xe630;</view>
					</view>
				</view>

				<view class="pageTitle" :style="'color:' + ((scrollTop/100)>0.5?'#222222;':'#ffffff;')">
					{{(scrollTop/100)>0.5?'新人零元购':''}}
				</view>

				<view class="right-goListbtn rowCenCen" :style="'background:rgba(255,183,32,'+ (1-scrollTop/100) +');'" @tap="gosubsidy()">
					<view :style="'color:' + ((scrollTop/100)>0.5?'#222222;':'#ffffff;')">返款订单</view>
				</view>
			</view>
		</view>

		<view class="pageContent-container colCen borderBox">
			<view class="bannerpic defIcon">
				<image src="../../static/images/active/zero.png" mode="aspectFill"></image>
			</view>
			
			<view class="inside-content colCen borderBox">
				<view class="flow-Chart rowCen borderBox">
					<view class="redcolor-content rowCen borderBox">
						<view class="yellow-Content colSta borderBox">
							<view class="content-title rowCenEnd">
								<view class="title-text">
									补贴返款 流程3步骤
								</view>
								<view class="endBtn colCenCen" @tap="gorules()">
									<view>点击查看规则</view>
								</view>
							</view>


							<view class="flow-container rowCenBet">
								<view class="icon-content colCen">
									<view class="icon-box defIcon">
										<image src="../../static/images/active/cart.png" mode="aspectFill"></image>
									</view>
									<view class="text">
										购物下单
									</view>
								</view>
								<view class="defIcon jiantou">
									<image src="../../static/images/active/jiantou.png" mode=""></image>
								</view>
								<view class="icon-content colCen">
									<view class="icon-box defIcon">
										<image src="../../static/images/active/code.png" mode="aspectFill"></image>
									</view>
									<view class="text">
										验证下单
									</view>
								</view>
								<view class="defIcon jiantou">
									<image src="../../static/images/active/jiantou.png" mode=""></image>
								</view>
								<view class="icon-content colCen">
									<view class="icon-box defIcon">
										<image src="../../static/images/active/wallet.png" mode="aspectFill"></image>
									</view>
									<view class="text">
										补贴返款
									</view>
								</view>
							</view>
						</view>
					</view>
				</view>
				
				<view class="bottomList-container colCen">
					<view class="title-container rowCenCen">
						<view class="leftborder"></view>
						<view class="pageTitle">
							每日福利购 新人抢免单
						</view>
						<view class="leftborder"></view>
					</view>
					
					
					<view class="goods-container colCen">
						<block v-for="(items,index) in goodsList" :key="index">
							<view class="goods-items-container rowCen borderBox" @click="goDetail(items)">
								<view class="left-imagecontent defIcon">
									<image :src="items.mainPic" mode="aspectFill"></image>
								</view>
						
								<view class="right-goodsinfo-container colCen borderBox">
									<view class="goodsnameinfo-content rowCen">
										<view class="typeIcon-content defIcon" v-if="items.searchSource ==1">
											<image v-if="items.shopType=='0'" src="@/static/images/goods/tbtips.png" mode="heightFix"></image>
											<image v-else src="@/static/images/goods/tmtips.png" mode="heightFix"></image>
										</view>
										<view class="typeIcon-content defIcon" v-if="items.searchSource ==2">
											<image src="@/static/images/goods/pddtips.png" mode="heightFix"></image>
										</view>
										<view class="typeIcon-content defIcon" v-if="items.searchSource ==3">
											<image src="@/static/images/goods/jdtips.png" mode="heightFix"></image>
										</view>
						
										<view class="tradename">
											{{items.dtitle}}
										</view>
									</view>
						
									<view class="cardbottom-container colCenEnd">
										<view class="discounts-container rowCen borderBox">
											<view class="coupon-box rowCenCen" v-if="items.couponPrice>0">
												<view>
													{{items.couponPrice}}元券
												</view>
											</view>
											<view class="back-box rowCenCen">
												<view>
													返{{items.actualPrice}}元
												</view>
											</view>
										</view>
										<view class="price-saleNums-container rowCen">
											补贴后￥0元
										</view>
						
										<view class="shopEnter-bar rowCenBet">
											<s>
												原价￥{{items.originalPrice}}
											</s>
											<view class="robBtn rowCenCen">
												<view>
													马上抢
												</view>
											</view>
										</view>
									</view>
								</view>
							</view>
						</block>
					</view>
					<aLoadMore :status="loadingstates" mode="loading3" :showTitle='true' color="#FFF6AC"></aLoadMore>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	/**** 此文件说明请看注释
	
	
	淘宝客技术支持 https://www.jiuduoyun.net/ 
	gitee开源地址 https://gitee.com/s55555/taobao-customer-uniapp-version
	禁止二次售卖
	
	*****/
	export default {
		data() {
			return {
				scrollTop: 0,
				goodsList:[],
				
				
				pageCurrent:1,
				canloadmore:false,
				loadingstates:'loading'
			}
		},
		onLoad() {
			this.getData()
		},
		onPageScroll(e) {
			this.scrollTop = e.scrollTop;
		},
		onReachBottom() {
			if(this.canloadmore){
				this.getData()
			}
		},
		methods: {
			getData(){
				this.canloadmore = false
				this.$http.post('zeroBuyOrder/getZeroGoods',{
					limit:10,
					offset:this.pageCurrent,
					type:1
				},'application/json').then(res=>{
					uni.stopPullDownRefresh();
					if(res.length<10){
						this.canloadmore = false
						this.loadingstates = 'nomarl'
					}else{
						this.canloadmore = true
						this.loadingstates = 'loading'
						this.pageCurrent+=10
					}
					this.goodsList = this.goodsList.concat(res)
				})
			},
			gorules(){
				uni.navigateTo({
					url:'./zeroRules'
				})
			},
			gosubsidy(){
				uni.navigateTo({
					url:'./subsidy'
				})
			},
			back(){
				uni.navigateBack({
					delta:1
				})
			},
			goDetail(info) {
				uni.navigateTo({
					url: '/pages/goods/goodsDetail?id=' + info.goodsId
				})
			},
		},
		onPullDownRefresh() {
			this.pageCurrent=1
			this.canloadmore= false
			this.loadingstates = 'loading'
			this.goodsList = []
			this.getData()
		}
	}
</script>

<style lang="scss">
	.zeroBuy-wrapper {
		width: 100%;
		background: #FF2447;
		min-height: 100vh;

		.flexbox {
			position: fixed;
			z-index: 100;
			width: 100%;
			padding: 0 32rpx;

			.headerBar-container {
				width: 100%;
				height: 90rpx;

				.leftimgbox {
					width: 170rpx;
					height: 50rpx;

					.shadow {
						width: 50rpx;
						height: 50rpx;
						font-size: 28rpx;
						border-radius: 50%;
					}
				}

				.pageTitle {
					font-size: 30rpx;
				}

				.right-goListbtn {
					width: 170rpx;
					height: 50rpx;
					background: #FFB720;
					border-radius: 25rpx;
					font-size: 28rpx;
					font-weight: 500;
					color: #FFFFFF;
				}
			}
		}

		.pageContent-container {
			width: 100%;
			
			.bannerpic{
				width: 100%;
				height: 743rpx;
			}

			.inside-content {
				width: 100%;
				padding: 0 10rpx;

				.flow-Chart {
					width: 100%;
					height: 356rpx;
					padding: 16rpx 16rpx;
					border-radius: 20rpx;
					border: 4rpx solid #FDD900;

					.redcolor-content {
						width: 100%;
						height: 100%;
						padding: 20rpx;
						background: #E80626;
						border-radius: 20rpx;

						.yellow-Content {
							width: 100%;
							height: 100%;
							border: 3rpx solid #EFF1F7;
							background: #FFFFFF;
							border-radius: 20rpx;

							.content-title {
								width: 100%;
								margin-top: 25rpx;

								.title-text {
									font-size: 32rpx;
									font-weight: bold;
									color: #333333;
								}

								.endBtn {
									width: 169rpx;
									height: 42rpx;
									background: linear-gradient(-79deg, #FEB946, #FFA33C);
									border-radius: 21rpx 0px 0px 21rpx;
									font-size: 24rpx;
									font-weight: bold;
									color: #FFFFFF;
									margin-left: 30rpx;
								}
							}

							.flow-container {
								width: 100%;
								padding: 0 100rpx;

								.icon-content {
									margin-top: 35rpx;

									.icon-box {
										width: 80rpx;
										height: 80rpx;
									}

									.text {
										margin-top: 15rpx;
										font-size: 24rpx;
										font-weight: bold;
										color: #333333;
									}
								}
								
								.jiantou{
									width: 41rpx;
									height: 27rpx;
								}
							}
						}
					}
				}
				
				.bottomList-container{
					width: 100%;
					.title-container{
						width: 100%;
						margin-top: 60rpx;
						margin-bottom: 30rpx;
						.pageTitle{
							font-size: 32rpx;
							font-weight: 500;
							color: #FFF6AC;
							margin: 0 65rpx;
						}
						.leftborder{
							width: 82rpx;
							height: 4rpx;
							background: linear-gradient(0deg, #FFFABC, #FFE77D, #FFF8B5, #FFE182, #FFF8B5, #FFE182);
						}
					}
					
					.goods-container{
						width: 100%;
						background-color: #FFFFFF;
						border-top-left-radius: 20rpx;
						border-top-right-radius: 20rpx;
						.goods-items-container {
							width: 100%;
							height: 240rpx;
							padding: 0 32rpx;
							border-bottom: 1rpx solid #f5f5f5;
						
							.left-imagecontent {
								width: 200rpx;
								height: 200rpx;
								border-radius: 8rpx;
								overflow: hidden;
							}
						
							.right-goodsinfo-container {
								margin-left: 20rpx;
								width: 460rpx;
								height: 200rpx;
						
								.goodsnameinfo-content {
									width: 100%;
						
									.typeIcon-content {
										width: 60rpx;
										height: 24rpx;
										margin-right: 5rpx;
									}
						
									.tradename {
										width: 400rpx;
										overflow: hidden;
										text-overflow: ellipsis;
										white-space: nowrap;
										font-size: 28rpx;
										line-height: 34rpx;
										font-weight: 500;
										color: #333333;
									}
								}
						
								.cardbottom-container {
									width: 100%;
						
									.price-saleNums-container {
										width: 100%;
										line-height: 34rpx;
										font-size: 24rpx;
										font-weight: bold;
										color: #FF4242;
									}
						
									.discounts-container {
										width: 100%;
										margin: 25rpx 0;
										.coupon-box {
											width: 102rpx;
											height: 30rpx;
											background: url(../../static/images/goods/couponbac.png)no-repeat;
											background-size: 100% 100%;
											font-size: 20rpx;
											font-weight: 500;
											color: #FF4242;
										}
						
										.back-box {
											height: 30rpx;
											background: linear-gradient(-90deg, #FF6B2A, #FF2A35);
											border-radius: 5rpx;
											margin-left: 8rpx;
											font-size: 20rpx;
											font-weight: 500;
											padding: 0 6rpx;
											color: #FFFFFF;
										}
									}
						
									.saleNum-content {
										width: 100%;
										font-size: 20rpx;
										font-weight: 400;
										line-height: 34rpx;
										color: #999999;
									}
						
									.shopEnter-bar {
										width: 100%;
										line-height: 34rpx;
										s{
											font-size: 20rpx;
											font-weight: 500;
											text-decoration: line-through;
											color: #999999;
										}
										.robBtn{
											width: 146rpx;
											height: 56rpx;
											background: linear-gradient(-79deg, #FEB946, #FFA33C);
											border-radius: 28rpx;
											font-size: 24rpx;
											font-weight: 500;
											color: #FFFFFF;
										}
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
