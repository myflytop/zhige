<template>
	<view class="classify-wrapper wrapperLayer borderBox">
		<titleBar titleText='买买卡' :pageForm='"buycard"'></titleBar>
		<view class="pageContent-container rowEndBet">
			<view class="leftContent-container borderBox">
				<scroll-view scroll-y scroll-with-animation class="classifyList">
					<block v-for="(items,index) in classifyList" :key='index'>
						<view class="classify-items rowCenCen" :class="leftCurrent==index?'classify-items-active':''" @click="leftChange(index,items.id)">
							<view class="active-box rowCenCen">
								<view class="nameBox">
									{{items.cname}}
								</view>
							</view>
						</view>
					</block>
				</scroll-view>
			</view>
			<view class="rightContent-container borderBox">
				<view class="banner-container rowCen">
					<swiper class="swiper-container" :autoplay="true" :interval="3000" :duration="1000" circular>
						<swiper-item v-for="(items,index) in topBannerList" :key='index'>
							<view class="swiper-box defIcon">
								<image :src="items.pic" mode=""></image>
							</view>
						</swiper-item>
					</swiper>
				</view>
				<scroll-view scroll-y scroll-with-animation class="rightScroll" @scroll='scroll' :scroll-top="scrollTop">
					<view class="rightList rowCen">
						<block v-for="(items,index) in dataList" :key='index'>
							<view class="itmcard colCen" @tap="gowebview(items.hurl)">
								<view class="imagePic defIcon">
									<image :src="items.cpic" mode="aspectFill"></image>
								</view>
								<view class="itmName">
									{{items.cname}}
								</view>
							</view>
						</block>
					</view>
				</scroll-view>
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
	import titleBar from '../../components/backTitlebar.vue'
	import common from '../../utils/common.js';
	export default {
		components: {
			titleBar
		},
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
				dataList:'',
				topBannerList: []
			}
		},
		onLoad() {
			this.getequipmentInfo();
			this.getBannerInfo()
			this.initData();
		},
		mounted() {},
		methods: {
			getBannerInfo() {
				// banner数据
				this.$http.get('banner/list/8').then((res) => {
					console.log(res, '========>轮播图数据');
					this.topBannerList = res;
				})
			},
			initData() {
				this.$http.post('buyBuyCard/getList', {
					parentId: 0
				}, 'application/json').then((res) => {
					console.log(res, '========>左侧数据');
					this.classifyList = res;
					this.getdataList(this.classifyList[0].id)
				})
			},
			getdataList(id) {
				this.dataList = []
				this.$http.post('buyBuyCard/getList', {
					parentId: id
				}, 'application/json').then((res) => {
					console.log(res, '========>右侧数据');
					this.dataList = res;
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
			leftChange(idx, id) {
				this.scrollTop = this.oldscrollTop
				this.$nextTick(() => {
					this.scrollTop = 0
				});
				this.leftCurrent = idx;
				this.getdataList(id)
			},
			gowebview(url){
				uni.navigateTo({
					url: '../webView/webView?url=' + url
				})
			}
		}
	}
</script>

<style lang="scss">
	.classify-wrapper {
		width: 750rpx;

		.pageContent-container {
			width: 100%;
			height: calc(100vh - 90rpx);

			.leftContent-container {
				width: 170rpx;
				height: 100%;
				background-color: #E6E8ED;

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

				.banner-container {
					width: 100%;
					height: 180rpx;

					.swiper-container {
						width: 100%;
						height: 160rpx;

						.swiper-box {
							padding: 0 20rpx;
							width: 100%;
							height: 100%;
						}
					}
				}

				.rightScroll {
					width: 100%;
					height: 100%;

					.rightList {
						width: 100%;
						flex-wrap: wrap;
						padding: 0 22rpx;

						.itmcard {
							width: 33.33333%;
							margin-bottom: 30rpx;

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
</style>
