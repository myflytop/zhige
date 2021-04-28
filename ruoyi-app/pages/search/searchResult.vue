<template>
	<view class="searchResult wrapperLayer">
		<view class="backTitlebar-wrapper colCen borderBox">
			<view class="fixedBox">
				<view class="topbarbox"></view>
				<view>
					<view class="headerNavigationbar rowCenBet borderBox">
						<view class="leftContent rowCen">
							<view class="backIcon rowCenSta" @click="backUrl()">
								<image src="@/static/images/home/return.png" mode=""></image>
							</view>
							<view class="search-container rowCenCen borderBox" @click="gosearch()">
								<view>{{searchText}}</view>
							</view>
						</view>
						<view class="typeSetting-btn defIcon" @click="changeSet()">
							<image v-if="rowset" src="../../static/images/goods/row.png" mode=""></image>
							<image v-else src="../../static/images/goods/col.png" mode=""></image>
						</view>
					</view>
				</view>
				<view class="onlineStore-container rowCen">
					<view class="onlineStoreList rowSta" v-if="!appinfo || platform!='ios'">
						<block v-for="(items,index) in onlineStoreList" :key="index">
							<view class="store-items colCen" :class="storeCurrent==index?'store-items-active':''" @click="checkstore(index)">
								<view class="store-name">
									{{items.name}}
								</view>
								<view class="bordercontent"></view>
							</view>
						</block>
					</view>
				</view>
				<view class="sortbar-container rowCenBet borderBox">
					<block v-for="(items,index) in sortList" :key="index">
						<view class="sortItems-container rowCenCen" :class="sortCurrent==index?'sortItems-container-active':''" @click="selectSort(index)">
							<view class="sortname">
								{{items.sortname}}
							</view>
							<view class="defIcon directionbox" v-if="index==2">
								<image v-if="sortCurrent!=2 " src="https://cmsstatic.ffquan.cn//wap_new/search/images/sort.svg" mode=""></image>
								<block v-else>
									<image v-if="saleUp" src="https://cmsstatic.ffquan.cn//wap_new/search/images/asce.svg" mode=""></image>
									<image v-else src="https://cmsstatic.ffquan.cn//wap_new/search/images/desc.svg" mode=""></image>
								</block>
							</view>
						</view>
					</block>
					<view class="couponSort colCen" v-if="storeCurrent>0">
						<view class="leftContent rowCen" @click="couponClick()">
							<view v-if="selectCoupon" class="defIcon icon-box">
								<image src="../../static/images/home/select.png" mode="aspectFill"></image>
							</view>
							<view class="nocoupon" v-else></view>
							<view class="textContent">
								优惠券
							</view>
						</view>
					</view>
					<view class="couponSort colCen" v-if="storeCurrent==1">
						<view class="leftContent rowCen" @click="selfsupportClick()">
							<view v-if="selfsupport" class="defIcon icon-box">
								<image src="../../static/images/home/select.png" mode="aspectFill"></image>
							</view>
							<view class="nocoupon" v-else></view>
							<view class="textContent">
								自营
							</view>
						</view>
					</view>
				</view>
			</view>
			<view class="placeBox">
				<view class="topbarbox"></view>
				<view class="placeemptybox"></view>
			</view>
		</view>


		<view class="pageContent-container colCen">
			<view class="advert-container colCenCen borderBox" v-if="advertList.length>0">
				<swiper class="picbox" :autoplay="true" :interval="3000" :duration="1000">
					<swiper-item v-for="(items,index) in advertList" :key="index">
						<view class="picbox defIcon" @tap='goUrl(items)'>
							<image :src="items.pic" mode="aspectFill"></image>
						</view>
					</swiper-item>
				</swiper>
			</view>

			<view class="goodsList-container" :style="'background-color:'+(rowset?'':'#fff')">
				<view class="goods-content rowStaBet" v-if="rowset">
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


				<view class="colSetting-container colCen" v-else>
					<view class="listbox colCen borderBox">
						<block v-for="(items,index) in goodsList" :key="index">
							<view class="goods-items-container rowCen borderBox" @click="goDetail(items)">
								<view class="left-imagecontent defIcon">
									<image :src="items.mainPic" mode="aspectFill"></image>
								</view>

								<view class="right-goodsinfo-container colCenBet borderBox">
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
											<!-- <view class="back-box rowCenCen">
												<view>
													返{{items.backmoney}}元
												</view>
											</view> -->
										</view>
										<view class="price-saleNums-container rowEnd">
											<span class='greytxt'>券后</span>
											<span class='rmb'>￥</span>
											<span class='pricebox'>{{items.actualPrice}}</span>
										</view>

										<view class="saleNum-content">
											已售{{items.monthSales}}
										</view>

										<view class="shopEnter-bar rowCen">
											<view class="storename">
												{{items.shopName}}
											</view>
											<!-- <view class="enterbtn rowCen">
												<view class="enterStore">进店</view>
												<view class="defIcon arrow">
													<image src="../../static/images/goods/entershop.png" mode=""></image>
												</view>
											</view> -->
										</view>
									</view>
								</view>
							</view>
						</block>
					</view>
				</view>
			</view>

			<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				memberId: '',
				appinfo:false,

				searchText: '',
				storeCurrent: '',
				sortCurrent: '',
				rowset: false,
				advertPic: '',
				onlineStoreList: [{
						name: '淘宝',
						type: 'tb'
					},
					{
						name: '京东',
						type: 'jd'
					},
					{
						name: '拼多多',
						type: 'pdd'
					},
				],

				sortList: [{
						sortname: '人气',
					},
					{
						sortname: '销量',
					},
					{
						sortname: '价格',
					}
				],
				saleUp: false,
				sortType: 'renqi',
				selectCoupon: false,
				selfsupport: false,


				goodsList: [],
				advertList:[],
				loadstatus: 'loading',
				canloadmore: false,

				platform:'',
				currentPage: 1,
			}
		},
		onLoad(options) {
			if (getApp().globalData.userInfo.memberId) {
				this.memberId = getApp().globalData.userInfo.memberId
			}
			this.appinfo = getApp().globalData.appinfo.iosExamine;
			this.platform = getApp().globalData.platform
			this.searchText = options.searchText
			this.storeCurrent = options.storetype
			this.getbanner()
			this.$nextTick(() => {
				if (this.storeCurrent == 0) {
					this.getTbData()
				} else if (this.storeCurrent == 1) {
					this.getJdData()
				} else {
					this.getPddData()
				}
			})
		},

		onReachBottom() {
			if (this.canloadmore) {
				if (this.storeCurrent == 0) {
					this.getTbData()
				} else if (this.storeCurrent == 1) {
					this.getJdData()
				} else {
					this.getPddData()
				}
			}
		},

		methods: {
			getTbData() {
				this.$http.post('tb/taobaoSuperSearch', {
					keyWords: this.searchText,
					memberId: this.memberId,
					pageId: this.currentPage,
					pageSize: 10,
					sort: this.sortType,
				}, 'application/json').then(res => {
					console.log(res.goodsList, '=========>淘宝商品搜索结果');
					uni.stopPullDownRefresh();
					if (res.goodsList.length < 10) {
						this.canloadmore = false
						this.loadstatus = 'nomarl'
					} else {
						this.currentPage++
						this.canloadmore = true
						this.loadstatus = 'loading'
					}
					if (this.currentPage > 1) {
						this.goodsList = this.goodsList.concat(res.goodsList)
					} else {
						this.goodsList = res.goodsList
					}
				})
			},

			getJdData() {
				this.$http.post('jd/superSearch', {
					keyword: this.searchText,
					memberId: this.memberId,
					pageIndex: this.currentPage,
					owner: this.selfsupport ? 'g' : '',
					pageSize: 10,
					sort: this.sortType
				}, 'application/json').then((res) => {
					console.log(res, '=========>京东商品搜索结果');
					uni.stopPullDownRefresh();
					if (res.length < 10) {
						this.canloadmore = false
						this.loadstatus = 'nomarl'
					} else {
						this.currentPage++
						this.canloadmore = true
						this.loadstatus = 'loading'
					}
					if (this.currentPage > 1) {
						this.goodsList = this.goodsList.concat(res)
					} else {
						this.goodsList = res
					}
				})
			},
			gosearch(){
				uni.redirectTo({
					url:'./search?type='+this.storetype
				})
			},
			
			goUrl(info) {
				if (info.urlType == '0') {
					uni.navigateTo({
						url: '../webView/webView?url=' + info.url
					})
				} else if (info.urlType == 1) {
					uni.navigateTo({
						url: info.url
					})
				} else if (info.urlType == '2') {
					// #ifdef APP-PLUS
					if (plus.os.name == 'Android') {
						console.log(plus.os.name);
						plus.runtime.openURL(info.url, res => {
							uni.navigateTo({
								url: '../webView/webView?url=' + info.url
							})
						}, 'com.taobao.taobao');
					} else {
						info.url = info.url.split('//')[1]
						plus.runtime.openURL('taobao://' + info.url, function(res) {
							uni.navigateTo({
								url: '../webView/webView?url=' + info.url
							})
						}, 'taobao://');
					}
					// #endif
				}
			},

			getPddData() {
				this.$http.post('pddgoods/superSearch', {
					keyWords: this.searchText,
					memberId: this.memberId,
					pageId: this.currentPage,
					withCoupon: this.selectCoupon,
					pageSize: 10,
					sort: this.sortType
				}, 'application/json').then((res) => {
					console.log(res, '=========>拼多多商品搜索结果');
					uni.stopPullDownRefresh();
					if (res.goodsList.length < 10) {
						this.canloadmore = false
						this.loadstatus = 'nomarl'
					} else {
						this.currentPage++
						this.canloadmore = true
						this.loadstatus = 'loading'
					}
					if (this.currentPage > 1) {
						this.goodsList = this.goodsList.concat(res.goodsList)
					} else {
						this.goodsList = res.goodsList
					}
				})
			},


			couponClick() {
				this.currentPage = 1
				this.goodsList = []
				this.selectCoupon = !this.selectCoupon
				if (this.storeCurrent == 0) {
					this.getTbData()
				} else if (this.storeCurrent == 1) {
					this.getJdData()
				} else {
					this.getPddData()
				}
			},

			selfsupportClick() {
				this.currentPage = 1
				this.goodsList = []
				this.selfsupport = !this.selfsupport
				this.getJdData()
			},

			getbanner() {
				this.$http.get('banner/list/0').then((res) => {
					console.log(res, '=========>广告数据');
					this.advertList = res
					this.advertPic = res[0].pic
				})
			},

			selectSort(idx) {
				this.sortCurrent = idx
				this.currentPage = 1
				this.goodsList = []
				if (idx == 0) {
					this.sortType = 'renqi'
				} else if (idx == 1) {
					this.sortType = 'total_sales_des'
				} else if (idx == 2) {
					this.saleUp = !this.saleUp
					if (this.saleUp) {
						this.sortType = 'price_asc'
					} else {
						this.sortType = 'price_des'
					}
				}


				this.$nextTick(() => {
					if (this.storeCurrent == 0) {
						this.getTbData()
					} else if (this.storeCurrent == 1) {
						this.getJdData()
					} else {
						this.getPddData()
					}
				})
			},

			checkstore(idx) {
				this.storeCurrent = idx
				this.sortType = 'renqi'
				this.currentPage = 1
				this.sortCurrent = 0
				this.selectCoupon = false
				this.selfsupport = false
				this.goodsList = []
				this.$nextTick(() => {
					if (this.storeCurrent == 0) {
						this.getTbData()
					} else if (this.storeCurrent == 1) {
						this.getJdData()
					} else {
						this.getPddData()
					}
				})
			},

			changeSet() {
				// 切换排版
				this.rowset = !this.rowset
				this.currentPage = 1
			},

			backUrl() {
				uni.navigateBack({
					delta: 1
				})
			},
			goDetail(info) {
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			}
		},
		onPullDownRefresh() {
			this.currentPage = 1
			this.goodsList = []
			if (this.storeCurrent == 0) {
				this.getTbData()
			} else if (this.storeCurrent == 1) {
				this.getJdData()
			} else {
				this.getPddData()
			}
		}
	}
</script>

<style lang="scss">
	.searchResult {
		.backTitlebar-wrapper {
			.placeBox {
				.placeemptybox {
					height: 270rpx;
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

					.leftContent {
						.backIcon {
							width: 40rpx;
							height: 32rpx;
							z-index: 1;

							image {
								width: 17rpx;
								height: 32rpx;
							}
						}

						.search-container {
							width: 554rpx;
							height: 60rpx;
							view{
								width: 554rpx;
								background: #F0F1F7;
								border-radius: 30rpx;
								font-size: 28rpx;
								padding: 0 32rpx;
								font-weight: 400;
								text-overflow: ellipsis;
								white-space: nowrap;
								overflow: hidden;
							}
						}
					}

					.typeSetting-btn {
						width: 65rpx;
						height: 35rpx;

						image {
							width: 35rpx;
							height: 35rpx;
						}
					}
				}

				.onlineStore-container {
					width: 100%;
					height: 80rpx;
					background-color: #FFFFFF;
					padding: 0 32rpx;

					.onlineStoreList {
						width: 100%;
						height: 100%;

						.store-items {
							margin-right: 60rpx;

							.store-name {
								font-size: 28rpx;
								font-weight: 500;
								color: #999999;
								margin-top: 20rpx;
							}

							.bordercontent {
								width: 30rpx;
								height: 4rpx;
								margin-top: 10rpx;
								border-radius: 2rpx;
								background-color: transparent;
							}
						}

						.store-items-active {
							.store-name {
								font-size: 32rpx;
								font-weight: 500;
								color: #FF4242;
							}

							.bordercontent {
								width: 30rpx;
								height: 4rpx;
								background-color: #FF4242;
							}
						}
					}
				}

				.sortbar-container {
					z-index: 10;
					position: fixed;
					left: 0;
					width: 100%;
					height: 80rpx;
					background-color: #FFFFFF;
					padding: 0 50rpx;

					.sortItems-container {
						width: 90rpx;

						.sortname {
							font-size: 28rpx;
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

					.couponSort {
						.leftContent {
							.nocoupon {
								width: 30rpx;
								height: 30rpx;
								background: #FFFFFF;
								border: 1rpx solid #BFBFBF;
								border-radius: 50%;
								margin-right: 10rpx;
							}

							.icon-box {
								width: 30rpx;
								height: 30rpx;
								margin-right: 10rpx;
							}

							.textContent {
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
							}
						}
					}
				}
			}
		}

		.pageContent-container {
			width: 100%;

			.advert-container {
				width: 100%;
				height: 200rpx;
				background-color: #FFFFFF;
				box-shadow: 0px -1rpx 0px 0px #EFF1F7;
				padding: 0 32rpx;
				margin-bottom: 20rpx;

				.picbox {
					width: 100%;
					height: 160rpx;
					border-radius: 12rpx;
					overflow: hidden;
				}
			}

			.goodsList-container {
				width: 100%;
				// background-color: #FFFFFF;

				.goods-content {
					width: 100%;
					padding: 0 32rpx;
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

				.colSetting-container {
					width: 100%;

					.listbox {
						width: 100%;

						.goods-items-container {
							width: 100%;
							height: 240rpx;
							padding: 0 32rpx;
							border-top: 1rpx solid #f5f5f5;

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
										line-height: 30rpx;

										.greytxt {
											font-size: 20rpx;
											font-weight: 400;
											color: #999999;
											line-height: 30rpx;
										}

										.rmb {
											font-size: 20rpx;
											font-weight: bold;
											color: #FF4242;
											line-height: 30rpx;
										}

										.pricebox {
											font-size: 28rpx;
											line-height: 34rpx;
											font-weight: bold;
											color: #FF4242;
										}
									}

									.discounts-container {
										width: 100%;
										margin-bottom: 5rpx;
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
											width: 100rpx;
											height: 30rpx;
											background: linear-gradient(-90deg, #7619EC, #A429F3);
											border-radius: 5rpx;
											margin-left: 8rpx;
											font-size: 20rpx;
											font-weight: 500;
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

										.storename {
											font-size: 20rpx;
											font-weight: 400;
											color: #999999;
										}

										.enterbtn {
											.enterStore {
												font-size: 20rpx;
												font-weight: 400;
												color: #333333;
												margin: 0 5rpx;
											}

											.arrow {
												width: 6rpx;
												height: 12rpx;
												margin-top: 4rpx;
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
	}
</style>
