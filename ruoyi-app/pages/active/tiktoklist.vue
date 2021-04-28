<template>
	<view class="tiktok-wrapper wrapperLayer borderBox">
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
						<view class="titleIcon defIcon">
							<!-- <image src="../../static/images/active/tiktok.png" mode="aspectFill"></image> -->
						</view>
						<view class="titleText">
							抖好货
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

		<view class="pageContent-container colCen">
			<view class="warterfall_list" style="width: 100%;">
				<view class="list_container">
					<view class="water-flow-column colCen" v-for="(col, c) in currentArray" :key="c">
						<view class="fallitem colCen" :id="col.id" style="width: 100%;">
							<block v-for="(itms, idx) in col.list" :key="idx">
								<view class="video-card" @tap="godyDetals(itms)">
									<image class="gifpic" :src="itms.dynamicImage" mode="widthFix" :lazy-load="true"></image>
									<view class="shadowbox colCenBet">
										<view class="playerNum rowCen">
											<view class="lefticon rowCen">
												<view class="iconbox defIcon">
													<image src="../../static/images/active/playernum.png" mode="aspectFill"></image>
												</view>
												<view class="number-text">
													{{itms.dyVideoLikeCount}}人观看
												</view>
											</view>
										</view>

										<view class="playerBtn defIcon">
											<image src="../../static/images/goods/suspend.png" mode="aspectFill"></image>
										</view>

										<view class="shadow-bottom colCen">
											<view class="goods-name">
												{{itms.itemshorttitle}}
											</view>
											<view class="priceContent rowCenBet">
												<view class="left-price rowCen">
													<view class="text">
														券后
													</view>
													<view class="price">
														&yen;{{itms.itemendprice}}
													</view>
												</view>
												<view class="right-coupon rowCenCen">
													<view class="coupon-container rowCenCen">
														<view>&yen;{{itms.couponmoney}}券</view>
													</view>
												</view>
											</view>
										</view>
									</view>
								</view>
							</block>
						</view>
					</view>
				</view>
			</view>

			<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
		</view>
	</view>
</template>

<script>
	import utils from '../../utils/utils.js'
	export default {
		data() {
			return {
				nowCurrent: 0,
				navList: [],

				videoList: [], //视频列表
				refrenshColunmDataList: [], //缓存的数组
				internalDataList: [],

				currentArray: [{
						id: 'water-fall-1',
						list: []
					},
					{
						id: 'water-fall-2',
						list: []
					}
				],
				pageCurrent: 1,
				canloadmore: false,
				loadstatus: 'loading'
			}
		},
		watch: {
			videoList(nval, oval) {
				console.log(nval.length, '新的列表数据进来了~');
				if (nval.length > 0) {
					this.$nextTick(() => {
						for (var i = this.refrenshColunmDataList.length; i < nval.length; i++) {
							this.internalDataList.push(nval[i])
						}
						console.log(this.internalDataList);
						if (this.internalDataList.length > 0) {
							this.getPushContainer();
						}
					})
				} else {
					this.externalRefrensh()
				}
			},
			internalDataList(nval, oval) {
				this.getPushContainer();
			},
			currentArray: {
				handler() {
					this.$nextTick(() => {
						this.getPushContainer();
					});
				},
				deep: true
			}
		},
		onReachBottom() {
			if (this.canloadmore) {
				this.getData()
			}
		},
		onLoad() {
			this.getNavList()
		},
		methods: {
			godyDetals(itm){
				const info = {}
				info.nowInfo = itm
				info.pageCurrent = this.pageCurrent
				info.type = this.nowCurrent
				info.storgeList = this.refrenshColunmDataList
				utils.setCache('pathInfo',info)
				uni.navigateTo({ 
					url:'./dyvideoDetails?'
				})
			},
			changeRange(id) {
				this.pageCurrent = 1
				this.canloadmore = false
				this.nowCurrent = id
				this.loadstatus = 'loading'
				this.videoList = []
				this.externalRefrensh()
				this.getData()
			},
			getNavList() {
				this.$http.post('category/getCategoryList', {
					ctype: 4,
					parentId: 0
				}, 'application/json').then(res => {
					console.log(res);
					this.navList = res
					this.nowCurrent = res[0].cid
					this.getData()
				})
			},
			getData() {
				this.$http.post('tb/getDouYinData', {
					back: 10,
					catId: this.nowCurrent,
					minId: this.pageCurrent
				}, 'application/json').then(res => {
					uni.stopPullDownRefresh();
					console.log(res);
					if (res.data.length < 10) {
						this.loadstatus = 'normal'
						this.canloadmore = false
					} else {
						this.loadstatus = 'loading'
						this.canloadmore = true
						this.pageCurrent = res.minId
					}
					this.videoList = this.videoList.concat(res.data)
				})
			},

			/**
			 * 获取节点信息
			 */
			getPushContainer() {
				let sortList = [];
				setTimeout(() => {
					const query = uni.createSelectorQuery().in(this);
					query
						.selectAll('.fallitem')
						.boundingClientRect()
						.exec(res => {
							if (res) {
								sortList = res[0];
								sortList.sort((a, b) => {
									return a.height - b.height;
								});
								this.pushShiftData(sortList[0]);
							}
						});
				}, 300)
			},

			pushShiftData(pushObj) {
				//内部数据internalDataList
				if (this.internalDataList.length > 0) {
					this.currentArray.forEach((items, index) => {
						if (items.id == pushObj.id) {
							items.list.push(this.internalDataList[0]);
							let shiftObj = this.internalDataList.shift();
							this.pushLoadData(shiftObj);
						}
					});
				}
			},

			//缓存数组
			pushLoadData(shiftObj) {
				this.refrenshColunmDataList.push(shiftObj)
			},

			externalRefrensh() {
				this.refrenshColunmDataList = [];
				for (let i = 0; i < this.currentArray.length; i++) {
					this.currentArray[i].list = [];
				}
			},

			goback() {
				uni.navigateBack({
					delta: 1
				})
			}
		},

		onPullDownRefresh() {
			this.pageCurrent = 1
			this.canloadmore = false
			this.nowCurrent = 0
			this.loadstatus = 'loading'
			this.videoList = []
			this.externalRefrensh()
			this.getData()
		}
	}
</script>

<style lang="scss">
	.tiktok-wrapper {
		width: 100%;
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
			top: 0;

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
							width: 34rpx;
							height: 39rpx;
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

		.pageContent-container {
			width: 100%;
			margin-top: 200rpx;
			box-sizing: border-box;
			padding: 0 32rpx;

			.warterfall_list {
				width: 100%;

				.list_container {
					width: 100%;
					display: flex;
					justify-content: space-between;

					.water-flow-column {
						width: 338rpx;

						.fallitem {
							width: 100%;

							.video-card {
								width: 100%;
								display: flex;
								border-radius: 8rpx;
								overflow: hidden;
								position: relative;
								margin-bottom: 20rpx;

								.gifpic {
									width: 338rpx;
								}

								.shadowbox {
									position: absolute;
									width: 100%;
									height: 100%;
									left: 0;
									top: 0;
									z-index: 1;

									.playerNum {
										box-sizing: border-box;
										width: 100%;
										padding: 10rpx 16rpx;

										.lefticon {
											height: 40rpx;
											background-color: rgba(0, 0, 0, 0.3);
											border-radius: 20rpx;
											padding: 8rpx 15rpx 8rpx 8rpx;

											.iconbox {
												width: 13rpx;
												height: 10rpx;
											}

											.number-text {
												font-size: 20rpx;
												font-weight: 500;
												margin-left: 15rpx;
												color: #FFFFFF;
											}
										}
									}

									.playerBtn {
										width: 50rpx;
										height: 50rpx;
									}

									.shadow-bottom {
										width: 100%;
										height: 90rpx;
										padding: 0 24rpx;
										box-sizing: border-box;
										background-color: rgba(0, 0, 0, 0.3);
										.goods-name{
											width: 100%;
											font-size: 26rpx;
											font-weight: 400;
											color: #FFFFFF;
											overflow: hidden;
											text-overflow: ellipsis;
											white-space: nowrap;
											margin-top: 10rpx;
										}
										.priceContent{
											width: 100%;
											margin-top: 5rpx;
											.left-price{
												color: #FFFFFF;
												.text{
													font-size: 22rpx;
													font-weight: 400;
												}
												.price{
													font-size: 26rpx;
													font-weight: bold;
												}
											}
											.right-coupon{
												display: flex;
												.coupon-container{
													width: 100rpx;
													height: 30rpx;
													background:url(../../static/images/goods/coupon.png)no-repeat;
													background-size: 100% 100%;
													font-size: 20rpx;
													font-weight: 400;
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
		}
	}
</style>
