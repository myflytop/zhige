<template>
	<view class="searchindex-wrapper wrapperLayer">
		<view class="backTitlebar-wrapper colCen borderBox">
			<view class="fixedBox">
				<view class="topbarbox"></view>
				<view>
					<view class="headerNavigationbar rowCenBet borderBox">
						<view class="leftContent rowCen">
							<view class="backIcon rowCenSta" @click="backUrl()">
								<image src="@/static/images/home/return.png" mode=""></image>
							</view>
							<view class="search-container rowCenBet borderBox">
								<input class="searchInput" type="text" @input='searchInput' @confirm="GoSearch()" v-model="searchText"
								 placeholder="输入商品或粘贴宝贝标题搜索" placeholder-class='searchplaceHolder' />
								<view class="rightIcon rowCenBet" v-if="searchText">
									<view class="searchicon iconfont" @click="cleanSearch()">
										&#xe641;
									</view>
								</view>
							</view>
						</view>
						<view class="searchbtn rowCenEnd" @click="GoSearch()">
							<view>搜索</view>
						</view>
					</view>
				</view>
				<view class="onlineStore-container rowCen" v-if="searchText==''">
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
			</view>
			<view class="placeBox">
				<view class="topbarbox"></view>
				<view class="placeemptybox" :style="searchText==''?'height: 190rpx;':'height: 110rpx;'"></view>
			</view>
		</view>


		<view class="pageContent-container colCen borderBox">
			<view class="searchcontent" v-if="searchText==''">
				<view class="receiptNotes-container colCen borderBox" v-if="storeCurrent==0">
					<view class="content-title">
						<view class="title-box">
							三步轻松获得优惠券
						</view>
					</view>

					<view class="steplist-container rowCen">
						<view class="itembox rowCen">
							<view class="defIcon iconbox">
								<image src="../../static/images/home/searchTao.png" mode=""></image>
							</view>
							<view class="textTips">
								1.进入淘宝
							</view>
						</view>
						<view class="itembox rowCen">
							<view class="defIcon iconbox">
								<image src="../../static/images/home/searchCopy.png" mode=""></image>
							</view>
							<view class="textTips">
								2.复制商品标题
							</view>
						</view>
						<view class="itembox rowCen">
							<view class="defIcon iconbox">
								<image src="../../static/images/home/searchQuan.png" mode=""></image>
							</view>
							<view class="textTips">
								3.打开APP
							</view>
						</view>
					</view>
				</view>


				<view class="historyWrap" v-if="showHistory && historyList.length>0">
					<view class="rowCenBet">
						<view class="historyTitle">历史记录</view>
						<view class="iconbox iconfont" @click="deleteSearch()">
							&#xe608;
						</view>
					</view>
					<view class="historyCon">
						<view class="historyItem" v-for="(item,index) in historyList" :key="index" @click="hotSearchItem(item)">
							{{item}}
						</view>
					</view>
				</view>


				<view class="historyWrap" style="margin-top: 1rpx;" v-if="showHistory">
					<view class="rowCenBet">
						<view class="historyTitle">搜索发现</view>
					</view>
					<view class="historyCon">
						<view class="historyItem" v-for="(item,index) in findList" :key="index" @click="hotSearchItem(item)">
							{{item}}
						</view>
					</view>
				</view>

				<view class="guessLike-container colCen borderBox" v-if="storeCurrent==0">
					<view class="bottom-title rowCenCen">
						<view class="bordercontent"></view>
						<view class="texttitle">
							猜你喜欢
						</view>
						<view class="bordercontent"></view>
					</view>


					<view class="colCen borderBox goodsList-container">
						<view class="listbox colCen borderBox">
							<block v-for="(items,index) in bottomGoodsList" :key="index">
								<view class="goods-items-container rowCen borderBox" @click="goDetail(items)">
									<view class="left-imagecontent defIcon">
										<image :src="items.mainPic" mode="aspectFill"></image>
									</view>

									<view class="right-goodsinfo-container colCen borderBox">
										<view class="goodsnameinfo-content rowSta">
											<view class="typeIcon-content defIcon" v-if="items.searchSource ==1">
												<image v-if="items.shopType=='0'" src="@/static/images/goods/tbtips.png" mode="heightFix"></image>
												<image v-else src="@/static/images/goods/tmtips.png" mode="heightFix"></image>
											</view>
											<view class="typeIcon-content defIcon" v-if="items.searchSource ==2">
												<image src="@/static/images/goods/jdtips.png" mode="heightFix"></image>
											</view>
											<view class="typeIcon-content defIcon" v-if="items.searchSource ==3">
												<image src="@/static/images/goods/pddtips.png" mode="heightFix"></image>
											</view>

											<view class="tradename">
												{{items.dtitle}}
											</view>
										</view>

										<view class="price-saleNums-container rowEndBet">
											<view class="left-price-box rowEnd">
												<span class='greytxt'>券后</span>
												<span class='rmb'>￥</span>
												<span class='pricebox'>{{items.actualPrice}}</span>
											</view>
										</view>

										<view class="discounts-container rowCen borderBox">
											<view class="coupon-box rowCenCen">
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

										<view class="saleNum-content">
											已售{{items.monthSales}}
										</view>

										<!-- <view class="shopEnter-bar rowCen">
											<view class="storename">
												{{items.shopName}}
											</view>
											<view class="enterbtn rowCen">
												<view class="enterStore">进店</view>
												<view class="defIcon arrow">
													<image src="../../static/images/goods/entershop.png" mode=""></image>
												</view>
											</view>
										</view> -->
									</view>
								</view>
							</block>
						</view>
					</view>

					<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
				</view>

			</view>

			<view class="associationSearch-container colCen" v-else>
				<view class="associationList-container colCen">
					<block v-for="(items,index) in associationList" :key='index'>
						<view class="association-items rowCen" @click="hotSearchItem(items.kw)">
							<view>
								{{items.kw}}
							</view>
						</view>
					</block>
				</view>
			</view>
		</view>

		<u-modal v-model="showModel" show-cancel-button :content="'确定要清空搜索记录吗？'" @confirm="confirm" :async-close="true"></u-modal>
	</view>
</template>

<script>
	import utils from '../../utils/utils.js'
	export default {
		data() {
			return {
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
				searchText: '',
				storeCurrent: 0,
				showModel: false,
				historyList: [],
				findList: '',
				bottomGoodsList: [],
				associationList: '',
				showHistory: true,
				currentPage: 1,
				loadingState: false,
				loadstatus: 'loading',
				appinfo:false,
				platform:''
			}
		},
		onLoad(options) {
			if (options.type) {
				this.storeCurrent = options.type
			}
			this.appinfo = getApp().globalData.appinfo.iosExamine;
			this.platform = getApp().globalData.platform
			this.getSearchFind();
			this.getSearchList();
			this.getbottomList()
		},
		onReachBottom() {
			if (this.loadingState) {
				this.getNextPage()
			}
		},
		methods: {
			getbottomList() {
				this.$http.post('tb/getGoodThing', {
					deviceType: getApp().globalData.platform == 'android' ? (getApp().globalData.systemLevel < 10 ? 'IMEI' : 'OAID') :
						'IDFA',
					deviceValue: getApp().globalData.equipmentNumber,
					pageId: 1,
					pageSize: 10,
					type: 3
				}, 'application/json').then((res) => {
					console.log(res, '=========>底部猜你喜欢');
					if (res.length < 10) {
						this.loadingState = false
						this.loadstatus = 'normal'
					} else {
						this.currentPage++
						this.loadstatus = 'loading'
						this.loadingState = true
					}
					this.bottomGoodsList = res
				})
			},

			getNextPage() {
				this.$http.post('tb/getGoodThing', {
					deviceType: getApp().globalData.platform == 'android' ? (getApp().globalData.systemLevel < 10 ? 'IMEI' : 'OAID') :
						'IDFA',
					deviceValue: getApp().globalData.equipmentNumber,
					pageId: this.currentPage,
					pageSize: 10,
					type: 3
				}, 'application/json').then((res) => {
					console.log(res, '=========>底部猜你喜欢');
					if (res.length < 10) {
						this.loadingState = false
						this.loadstatus = 'normal'
					} else {
						this.currentPage++
						this.loadstatus = 'loading'
						this.loadingState = true
					}
					this.bottomGoodsList = this.bottomGoodsList.concat(res)
				})
			},

			getSearchList() {
				utils.getCache('searchList').then(res => {
					console.log(res);
					this.historyList = res
				}).catch(res => {
					this.historyList = []
				})
			},

			GoSearch() {
				if (this.searchText.substring(0, 1).includes(' ')) {
					uni.showToast({
						title: "输入内容带有非法字符，请重新输入",
						duration: 1000,
						icon: "none"
					});
					this.searchText = null
					return
				}

				if (this.searchText == '') {
					uni.showToast({
						title: "请输入搜索内容",
						duration: 1000,
						icon: "none"
					});
					this.searchText = ''
					return
				}

				if (this.historyList.length > 0) {
					var ifadd = this.historyList.some(items => {
						return items == this.searchText
					})
					if (!ifadd) {
						if (this.historyList.length < 10) {
							this.historyList.unshift(this.searchText)
						} else {
							this.historyList.unshift(this.searchText)
							this.historyList.pop()
						}
					}
				} else {
					this.historyList.unshift(this.searchText)
				}
				this.$nextTick(() => {
					utils.setCache('searchList', this.historyList);
					uni.redirectTo({
						url: './searchResult?searchText=' + this.searchText + '&storetype=' + this.storeCurrent
					})
				})
			},

			getSearchFind() {
				this.$http.get('tb/getHotKey').then((res) => {
					console.log(res, '========>搜索发现');
					this.findList = res
				})
			},

			cleanSearch() {
				this.searchText = ''
			},

			deleteSearch() {
				this.showModel = true
			},

			hotSearchItem(content) {
				this.searchText = content
				this.GoSearch()
			},

			confirm() {
				uni.removeStorage({
					key: 'searchList',
					success: res => {
						console.log('success');
						this.showModel = false
						this.historyList = []
					}
				});
			},

			checkstore(idx) {
				this.storeCurrent = idx
			},

			searchInput(e) {
				if (this.searchText.substring(0, 1).includes(' ')) {
					uni.showToast({
						title: "输入内容带有非法字符，请重新输入",
						duration: 1000,
						icon: "none"
					});
					this.searchText = null
				} else {
					this.vagueSearch()
				}
			},

			vagueSearch() {
				this.$http.post('tb/searchSuggestion', {
					keyWords: this.searchText
				}).then((res) => {
					console.log(res, '=========>联想搜索');
					this.associationList = res
				})
			},

			goDetail(info) {
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},

			backUrl() {
				uni.navigateBack({
					delta: 1
				})
			}
		}
	}
</script>

<style lang="scss">
	.searchindex-wrapper {
		width: 100%;

		.backTitlebar-wrapper {
			.placeBox {
				.placeemptybox {}
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
							background: #F0F1F7;
							border-radius: 30rpx;
							padding: 0 32rpx;

							.searchInput {
								width: 90%;
								height: 100%;
								font-size: 24rpx;
								font-weight: 400;
								color: #222222;
							}

							.searchplaceHolder {
								font-size: 24rpx;
								font-weight: 400;
								color: #999999;
							}

							.rightIcon {
								.searchicon {
									color: #222222;
								}
							}
						}
					}

					.searchbtn {
						font-size: 28rpx;
						font-weight: 500;
						color: #333333;
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
								font-size: 28rpx;
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
			}
		}

		.pageContent-container {
			width: 100%;

			.receiptNotes-container {
				width: 100%;
				height: 130rpx;
				margin-bottom: 20rpx;
				padding: 0 32rpx;
				background-color: #FFFFFF;

				.content-title {
					width: 100%;
					font-size: 24rpx;
					font-weight: bold;
					color: #333333;
					margin-top: 15rpx;
				}

				.steplist-container {
					width: 100%;
					margin-top: 25rpx;

					.itembox {
						margin-right: 50rpx;

						.iconbox {
							width: 31rpx;
							height: 31rpx;
							margin-right: 10rpx;
						}

						.textTips {
							font-size: 26rpx;
							font-weight: 500;
							color: #333333;
							white-space: nowrap;
						}
					}
				}
			}

			.searchcontent {
				width: 100%;
			}

			.historyWrap {
				width: 100%;
				background-color: #FFFFFF;
				padding: 30rpx;

				.historyTitle {
					font-size: 28rpx;
					color: #333333;
					font-weight: bold;
				}

				.iconbox {
					font-size: 30rpx;
				}

				.historyCon {
					margin-top: 10rpx;
					display: flex;
					flex-wrap: wrap;

					.historyItem {
						font-size: 24rpx;
						line-height: 34rpx;
						font-weight: 500;
						color: #666666;
						border-radius: 27rpx;
						padding: 8rpx 28rpx;
						margin-top: 20rpx;
						margin-right: 24rpx;
						background-color: #F0F1F7;
						white-space: nowrap;
					}
				}
			}

			.guessLike-container {
				width: 100%;
				background-color: #FFFFFF;
				margin-top: 20rpx;

				.bottom-title {
					margin-top: 30rpx;
					margin-bottom: 20rpx;

					.texttitle {
						font-size: 28rpx;
						font-weight: 500;
						color: #FF4242;
						margin: 0 30rpx;
					}

					.bordercontent {
						width: 35rpx;
						height: 4rpx;
						background-color: #FF4242;
					}
				}

				.goodsList-container {
					width: 100%;

					.listbox {
						width: 100%;

						.goods-items-container {
							width: 100%;
							height: 240rpx;
							padding: 0 32rpx;
							border-bottom: 1rpx solid #F0F1F7;

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
										margin-top: 8rpx;
									}

									.tradename {
										width: 400rpx;
										overflow: hidden;
										text-overflow: ellipsis;
										white-space: nowrap;
										font-size: 28rpx;
										font-weight: 400;
										color: #333333;
									}
								}


								.price-saleNums-container {
									width: 100%;
									margin-top: 30rpx;

									.left-price-box {
										.greytxt {
											font-size: 20rpx;
											font-weight: 400;
											color: #999999;
											line-height: 32rpx;
										}

										.rmb {
											font-size: 20rpx;
											font-weight: 600;
											color: #FF4242;
											line-height: 32rpx;
										}

										.pricebox {
											font-size: 28rpx;
											line-height: 34rpx;
											font-weight: 600;
											color: #FF4242;
										}
									}
								}

								.discounts-container {
									width: 100%;
									margin-top: 10rpx;

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
									margin-top: 10rpx;
									color: #999999;
								}

								.shopEnter-bar {
									width: 100%;

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

			.associationSearch-container {
				width: 100%;
				background-color: #FFFFFF;

				.associationList-container {
					width: 100%;

					.association-items {
						width: 100%;
						height: 70rpx;
						box-shadow: 0px -1rpx 0rpx 0px #EFF1F7;
						padding: 0 35rpx;
						font-size: 24rpx;
						font-weight: 400;
						color: #333333;
					}
				}
			}
		}
	}
</style>
