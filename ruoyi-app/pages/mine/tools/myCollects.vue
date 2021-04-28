<template>
	<view class="myCollects-wrapper wrapperLayer">
		<view class="backTitlebar-wrapper colCen borderBox">
			<view class="fixedBox">
				<view class="topbarbox"></view>
				<view class="headerNavigationbar rowCenBet borderBox">
					<view class="backIcon rowCenSta" @click="backUrl()">
						<image src="@/static/images/home/return.png" mode=""></image>
					</view>
					<view class="pageTitle">
						我的收藏
					</view>
					<view class="statebox rowCenEnd" @click="editFnc()">
						<view class="stateText">
							{{pageState?'完成':'编辑'}}
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

		<view class="collectGoods-wrapper colCen borderBox">
			<view class="goodsList-container colCen">
				<view class="goods-items rowCen" :class="pageState?'':'paddingbox'" v-for="(items,index) in datalists" :key='index' @tap="goDetails(items)">
					<view class="leftselectBox rowCenCen" v-if="pageState" @tap.stop="selectItem(index)">
						<image class="selectIcon" v-if="items.isSelected" src="../../../static/images/mine/tools/select.png" mode=""></image>
						<view v-else class="onSelect borderBox"></view>
					</view>
					<view class="goodsPic defIcon">
						<image :src="items.mainPic" mode="aspectFill"></image>
					</view>
					<view class="goodsinfo-container colCen">
						<view class="goodsName-box rowCenBet">
							<view class="icontype defIcon" v-if="items.shopType!=-1">
								<image v-if="items.shopType==1" src="../../../static/images/goods/tmtips.png" mode=""></image>
								<image v-else src="../../../static/images/goods/tbtips.png" mode=""></image>
							</view>
							<view class="namebox">
								{{items.dtitle}}
							</view>
						</view>
						<view class="goodsPrice rowCen">
							<view class="goods-price rowEnd">
								<view class="after">券后<span class='rmb'>￥</span></view>
								<view class="price">{{items.actualPrice}}</view>
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
						<view class="has-sale rowCen">
							<view class="hassaleText">
								已售{{items.monthSales}}
							</view>
						</view>
						<!-- <view class="storeName-content rowCen">
							<view class="storeName-text">
								{{items.storeName}}
							</view>
						</view> -->
					</view>
				</view>

				<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
			</view>
		</view>

		<view class="fixed-container rowSta" v-if="pageState">
			<view class="bottom-bar rowCenBet">
				<view class="leftselctAll rowCen" @click="selectAllfnc()">
					<image class="selectIcon" v-if="selectAll" src="../../../static/images/mine/tools/select.png" mode=""></image>
					<view v-else class="onSelect borderBox"></view>
					<view class="selecttext">
						全选
					</view>
				</view>

				<view class="rightsebtn rowCenCen" @click="delGoods()">
					<view>
						删除
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		components: {},
		data() {
			return {
				pageState: false,
				datalists: [],
				canloadmore: false,
				loadstatus: 'loading',
				currentPage: 1,
				selectAll: false
			}
		},
		onLoad() {
			this.getData()
		},
		onShow() {
			// this.getData()
		},
		methods: {
			getData() {
				this.$http.post('collectProducts/getList', {
					limit: 10,
					offset: this.currentPage,
					type: 1
				}, 'application/json').then(res => {
					console.log(res);
					res.map(itm => {
						return itm.isSelected = false
					})
					if (res.length < 10) {
						this.currentPage = 1
						this.loadstatus = 'nomarl'
					} else {
						this.currentPage += 10
						this.loadstatus = 'loading'
						this.canloadmore = true
					}

					this.datalists = res
				})
			},
			selectItem(idx) {
				this.datalists.forEach((items, index) => {
					if (idx == index) {
						items.isSelected = !items.isSelected
						if (items.isSelected) {
							const x = this.datalists.every(a => {
								return a.isSelected
							})
							this.selectAll = x
						} else {
							this.selectAll = false
						}
					}
				})
				console.log(this.selectAll);
			},
			editFnc() {
				this.pageState = !this.pageState
			},
			backUrl() {
				uni.navigateBack({
					delta: 1
				})
			},
			goDetails(info){
				console.log(info);
				uni.navigateTo({
					url: '../../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},
			selectAllfnc() {
				this.selectAll = !this.selectAll
				this.datalists.forEach(itm => {
					itm.isSelected = this.selectAll
				})
			},
			delGoods(){
				var ids = []
				this.datalists.forEach((itm,idx)=>{
					if(itm.isSelected){
						ids.push(itm.goodsId)
					}
				})
				
				console.log(ids);
				this.$nextTick(()=>{
					this.$http.post('collectProducts/cancelCollect',{
						ids
					},'application/json',true).then(res=>{
						console.log(res);
						this.currentPage= 1 
						this.getData()
					})
				})
			}
		}
	}
</script>

<style lang="scss">
	.myCollects-wrapper {
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

					.statebox {
						width: 60rpx;

						.stateText {
							font-size: 26rpx;
							font-weight: 400;
							color: #333333;
						}
					}
				}
			}
		}

		.collectGoods-wrapper {
			width: 100%;

			.goodsList-container {
				width: 100%;
				margin-top: 10rpx;

				.goods-items {
					width: 100%;
					height: 290rpx;
					background-color: #FFFFFF;

					.leftselectBox {
						width: 70rpx;
						height: 100%;

						.onSelect {
							width: 30rpx;
							height: 30rpx;
							border-radius: 50%;
							border: 1rpx solid #999999;
						}

						.selectIcon {
							width: 30rpx;
							height: 30rpx;
						}
					}

					.goodsinfo-container {
						width: 420rpx;
						height: 240rpx;

						.goodsName-box {
							width: 100%;
							margin-top: 8rpx;

							.icontype {
								width: 50rpx;
								height: 24rpx;
							}

							.namebox {
								width: 420rpx;
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
								white-space: nowrap;
								overflow: hidden;
								text-overflow: ellipsis;
							}
						}

						.goodsPrice {
							width: 100%;

							.goods-price {
								margin-top: 40rpx;

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
						}

						.couponInfo-bar {
							width: 100%;
							margin-top: 10rpx;

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

						.has-sale {
							width: 100%;
							margin-top: 10rpx;

							.hassaleText {
								font-size: 20rpx;
								font-weight: 400;
								color: #999999;
							}
						}

						.storeName-content {
							width: 100%;

							.storeName-text {
								font-size: 14px;
								font-weight: 400;
								color: #999999;
							}
						}
					}

					.goodsPic {
						width: 220rpx;
						height: 220rpx;
						overflow: hidden;
						border-radius: 10rpx;
						margin-right: 20rpx;
					}
				}

				.paddingbox {
					padding-left: 34rpx;
				}
			}
		}

		.fixed-container {
			position: fixed;
			bottom: 0;
			left: 0;
			width: 100%;
			background-color: #FFFFFF;
			height: 90rpx;
			height: calc(90rpx + constant(safe-area-inset-bottom));
			height: env(90rpx + constant(safe-area-inset-bottom));

			.bottom-bar {
				width: 100%;
				padding: 0 32rpx;
				height: 90rpx;

				.leftselctAll {

					.onSelect {
						width: 30rpx;
						height: 30rpx;
						border-radius: 50%;
						border: 1rpx solid #999999;
					}

					.selectIcon {
						width: 30rpx;
						height: 30rpx;
					}

					.selecttext {
						font-size: 24rpx;
						font-weight: 400;
						margin-left: 15rpx;
					}
				}

				.rightsebtn {
					width: 88rpx;
					height: 38rpx;
					background: #FFFFFF;
					border: 1rpx solid #CC0004;
					border-radius: 19rpx;
					font-size: 24rpx;
					font-weight: 400;
					color: #CC0004;
				}
			}
		}
	}
</style>
