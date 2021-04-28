<template>
	<view class="classify-wrapper wrapperLayer borderBox">
		<view class="backTitlebar-wrapper colCen borderBox">
			<view class="fixedBox" style="background-color: #FE3A33;">
				<view class="topbarbox"></view>
				<view class="headerNavigationbar rowCenBet borderBox">
					<view class="backIcon rowCenSta">
					</view>
					<view class="pageTitle">
						超级分类
					</view>
					<view class="emptybox rowCenEnd" @tap="gosearch()">
						<view class="cleanAll iconfont">&#xe616;</view>
					</view>
				</view>
			</view>
			<view class="placeBox">
				<view class="topbarbox"></view>
				<view class="placeemptybox">
				</view>
			</view>
		</view>

		<view class="pageContent-container rowCenCen" :style="'height:' + (Number(sysInfo.windowHeight)-titleBarHeight) + 'px;'">
			<view class="leftContent-container borderBox">
				<scroll-view scroll-y scroll-with-animation class="classifyList">
					<block v-for="(items,index) in classifyList" :key='index'>
						<view class="classify-items rowCenCen" :class="leftCurrent==index?'classify-items-active':''" @click="leftChange(index)">
							<view class="active-box rowCenCen">
								<view class="nameBox">
									{{items.main_name}}
								</view>
							</view>
						</view>
					</block>
				</scroll-view>
			</view>
			<view class="rightContent-container borderBox">
				<scroll-view scroll-y scroll-with-animation class="rightScroll" @scroll='scroll' :scroll-top="scrollTop">
					<block v-for="(items,index) in dataList" :key='index'>
						<view class="right-items colCen">
							<view class="classTitle-content rowCenCen">
								<view>
									{{items.next_name}}
								</view>
							</view>

							<view class="thirdclassList rowCen">
								<view class="thirdItm-container colCen" v-for="(itm,idx) in items.info" :key="idx" @click="goPath(itm.son_name)">
									<view class="itmcard colCen">
										<view class="imagePic defIcon">
											<image :src="itm.imgurl" mode="aspectFill" :lazy-load="true"></image>
										</view>
										<view class="itmName">
											{{itm.son_name}}
										</view>
									</view>
								</view>
							</view>
						</view>
					</block>
				</scroll-view>
			</view>
		</view>
	</view>
</template>

<script>
	import common from '../../utils/common.js';
	export default {
		data() {
			return {
				cusConfig: {
					mineTopColor: '#7D0DFC',
					mineEndColor: '#D116FD'
				},
				sysInfo: '',
				titleBarHeight: 0,
				leftCurrent: 0,
				scrollTop: 0,
				oldscrollTop: 0,
				classifyList: [],
				dataList: []
			}
		},
		onLoad() {
			this.getequipmentInfo();
			this.initData();
		},
		mounted() {
			uni.createSelectorQuery().select('.placeBox').boundingClientRect(data => {
				console.log("头部高度" + JSON.stringify(data.height));
				this.titleBarHeight = data.height
			}).exec();
		},
		methods: {
			initData() {
				this.$http.post('tb/getSuperClassify').then((res) => {
					console.log(res, '========>页面数据');
					this.classifyList = res;
					this.getdataList(this.leftCurrent)
				})
			},
			getdataList() {
				this.classifyList.forEach((items, index) => {
					if (this.leftCurrent == index) {
						this.dataList = items.data
					}
				})
			},
			scroll(e) {
				this.oldscrollTop = e.detail.scrollTop
			},
			getequipmentInfo() {
				uni.getSystemInfo({
					success: res => {
						console.log(res);
						this.sysInfo = res;
					}
				});
			},
			leftChange(idx) {
				this.scrollTop = this.oldscrollTop
				this.$nextTick(()=> {
					this.scrollTop = 0
				});
				this.leftCurrent = idx;
				this.getdataList()
			},
			
			goPath(type){
				uni.navigateTo({
					url: '../search/searchResult?searchText=' + type + '&storetype=0'
				})
			},
			
			gosearch(){
				uni.navigateTo({
					url: '../search/search'
				})
			}
		}
	}
</script>

<style lang="scss">
	.classify-wrapper {
		width: 750rpx;

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
						color: #FFFFFF;
					}

					.emptybox {
						width: 60rpx;
						height: 32rpx;

						.cleanAll {
							font-size: 32rpx;
							color: #FFFFFF;
						}
					}
				}
			}
		}

		.pageContent-container {
			width: 100%;

			.leftContent-container {
				width: 170rpx;
				height: 100%;
				background-color: #F3F3F3;

				.classifyList {
					width: 100%;
					height: 100%;

					.classify-items {
						width: 100%;
						height: 90rpx;

						.active-box {
							width: 100%;

							.nameBox {
								font-size: 26rpx;
								font-weight: 400;
								color: #333333;
							}
						}
					}

					.classify-items-active {
						background-color: #FFFFFF;

						.active-box {
							width: 100%;
							border-left: 6rpx solid #FE3A33;

							.nameBox {
								color: #FE3A33;
							}
						}
					}
				}
			}

			.rightContent-container {
				width: 580rpx;
				height: 100%;
				background-color: #FFFFFF;

				.rightScroll {
					width: 100%;
					height: 100%;

					.right-items {
						width: 100%;

						.classTitle-content {
							width: 100%;
							height: 80rpx;
							font-size: 30rpx;
							font-weight: 500;
							color: #333333;
						}

						.thirdclassList {
							width: 100%;
							flex-wrap: wrap;

							.thirdItm-container {
								width: 33.33333%;
								margin-bottom: 30rpx;

								.itmcard {
									.imagePic {
										width: 96rpx;
										height: 96rpx;
										margin: 20rpx 0;
									}

									.itmName {
										font-size: 24rpx;
										font-weight: 400;
										color: #333333;
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
