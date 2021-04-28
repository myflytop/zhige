<template>
	<view class="talentSay-wrapper colCen wrapperLayer borderBox">
		<view class="backTitlebar-wrapper colCen borderBox">
			<view class="fixedBox">
				<view class="topbarbox"></view>
				<view class="headerNavigationbar rowCenBet borderBox">
					<view class="backIcon rowCenSta"></view>
					<view class="pageTitle">
						达人说
					</view>
					<view class="emptybox rowCenEnd">
					</view>
				</view>
			</view>
			<view class="placeBox">
				<view class="topbarbox"></view>
				<view class="placeemptybox">
				</view>
			</view>
		</view>

		<view class="topPage-container colCen borderBox">
			<view class="bacbox"></view>
			<view class="swiper-container rowCen borderBox">
				<carousel :img-list="swiperList" url-key="url" @selected="selectedBanner" />
			</view>


			<view class="weekNews-container colCen borderBox">
				<view class="container-title rowCen borderBox">
					<view>
						本周新作
					</view>
				</view>

				<view class="scroll-content borderBox">
					<scroll-view class="newScroll" scroll-x="true" scroll-with-animation>
						<view class="listcontent">
							<block v-for="(items,index) in newsList" :key='index'>
								<view class="news-items borderBox" @click="goDetails(items.id)">
									<view class="items-container colCen">
										<view class="newsPic defIcon">
											<image :src="items.articleBanner" mode="aspectFill" :lazy-load="true"></image>
										</view>
										<view class="bottom-info-container colCen borderBox">
											<view class="newstitle">
												{{items.name}}
											</view>
											<view class="avatorType-content rowCen">
												<view class="avatar defIcon">
													<image :src="items.headImg" mode="aspectFill" :lazy-load="true"></image>
												</view>
												<view class="type-box">
													{{items.talentName}}
												</view>
											</view>
										</view>
									</view>
								</view>
							</block>
						</view>
					</scroll-view>
				</view>
			</view>
		</view>

		<view class="page-bottom-container colCen borderBox">
			<view class="cateBar-container rowCen borderBox">
				<view class="catelist-box rowCenBet borderBox">
					<block v-for="(items,index) in catelist" :key="index">
						<view class="cate-items-content colCenCen" :class="cateCurrent==index?'cate-items-active':''" @click="selectCate(index)">
							<view class="catename">
								{{items.name}}
							</view>
						</view>
					</block>
				</view>
			</view>

			<view class="datalist-container colCen borderBox">
				<view class="article-list-content colCen borderBox">
					<block v-for="(items,index) in pageDatalist" :key='index'>
						<view class="article-container colCen borderBox" @click="goDetails(items.id)">
							<view class="imageContent defIcon">
								<image :src="items.articleBanner" mode="aspectFill" :lazy-load="true"></image>
								<view class="abscontent rowCenCen">
									<view>
										{{judgeType(items.talentcat)}}/{{items.itemNum}}单品
									</view>
								</view>
							</view>
							<view class="titlebar">
								{{items.shortTitle}}
							</view>
							<view class="subtitle">
								{{items.article}}
							</view>
						</view>
					</block>
				</view>
			</view>
		</view>
	</view>
</template>


<script>
	import carousel from '@/components/vear-carousel/vear-carousel'
	export default {
		components: {
			carousel
		},
		data() {
			return {
				cateCurrent: 0,
				direction: '',
				swiperList: [],

				newsList: [],

				catelist: [{
						name: '精选',
						type: 0,
					},
					{
						name: '好物',
						type: 1,
					},
					{
						name: '时尚',
						type: 2,
					},
					{
						name: '美食',
						type: 3,
					}
				],

				pageDatalist: []
			}
		},
		onLoad() {
			this.initData()
		},
		methods: {
			judgeType(type) {
				switch (type) {
					case 0:
						return '全部'
					case 1:
						return '好物'
					case 2:
						return '潮流'
					case 3:
						return '美食'
					case 4:
						return '生活'
				}
			},
			initData() {
				this.$http.post('talentInfo/getTalentInfo', {
					talentcat: 0
				},'',true).then((res) => {
					console.log(res, '========>页面数据');
					uni.stopPullDownRefresh()
					this.swiperList = res.topdata;
					
					this.$nextTick(()=>{
						this.newsList = res.newdata.slice(0,10);
					})
					
					setTimeout(()=>{
						res.clickdata.forEach((itm)=>{
							this.pageDatalist.push(itm)
						})
					},200)
					// this.pageDatalist = res.clickdata
				})
			},
			selectCate(idx) {
				if (idx != this.cateCurrent) {
					this.cateCurrent = idx
					this.$http.post('talentInfo/getTalentInfo', {
						talentcat: this.cateCurrent + 1
					}).then((res) => {
						console.log(res, '========>页面数据');
						this.pageDatalist = res.clickdata
					})
				}
			},
			goDetails(id) {
				uni.navigateTo({
					url: '../webView/webView?url=/hybrid/html/articleDetails.html?id=' + id
				})
			},
			selectedBanner(e) {
				uni.navigateTo({
					url: '../webView/webView?url=/hybrid/html/articleDetails.html?id=' + e.id
				})
			},
		},
		onPullDownRefresh() {
			this.pageDatalist = []
			this.initData()
		}
	}
</script>

<style lang="scss">
	.talentSay-wrapper {
		width: 100%;

		.backTitlebar-wrapper {
			.placeBox {
				.placeemptybox {
					height: 90rpx;
				}
			}

			.fixedBox {
				width: 100%;
				background-color: #FFFFFF;
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
						color: #333333;
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


		.topPage-container {
			width: 100%;
			margin-bottom: 20rpx;
			background-color: #FFFFFF;
			position: relative;

			.bacbox {
				position: absolute;
				top: 0;
				width: 100%;
				height: 200rpx;
				background: #FB3A6D;
			}

			.swiper-container {
				width: 100%;
				height: 400rpx;
				display: flex;
				align-items: center;
			}

			.weekNews-container {
				width: 100%;

				.container-title {
					width: 100%;
					height: 80rpx;
					font-size: 28rpx;
					font-weight: 500;
					color: #333333;
					padding: 0 32rpx;
				}

				.scroll-content {
					width: 100%;
					padding: 0 32rpx;
					margin-bottom: 20rpx;

					.newScroll {
						width: 100%;
						height: 260rpx;

						.listcontent {
							white-space: nowrap;
							height: 100%;

							.news-items {
								display: inline-block;
								margin-right: 20rpx;

								.items-container {
									width: 335rpx;
									height: 260rpx;
									overflow: hidden;
									border-radius: 10rpx;

									.newsPic {
										width: 100%;
										height: 140rpx;
									}

									.bottom-info-container {
										width: 100%;
										height: 120rpx;
										padding: 0 20rpx;
										background-color: #F0F1F7;

										.newstitle {
											width: 100%;
											font-size: 24rpx;
											font-weight: 400;
											color: #333333;
											overflow: hidden;
											text-overflow: ellipsis;
											white-space: nowrap;
											margin-top: 10rpx;
										}

										.avatorType-content {
											width: 100%;
											margin-top: 10rpx;

											.avatar {
												width: 60rpx;
												height: 60rpx;
												border-radius: 50%;
												overflow: hidden;
											}

											.type-box {
												font-size: 24rpx;
												font-weight: 400;
												color: #999999;
												margin-left: 10rpx;
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

		.page-bottom-container {
			width: 100%;

			.cateBar-container {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;
				margin-bottom: 20rpx;
				background-color: #FFFFFF;
				position: sticky;
				top: 90rpx;

				.catelist-box {
					width: 100%;
					height: 100%;

					.cate-items-content {
						width: 120rpx;
						height: 60rpx;
						font-size: 28rpx;
						font-weight: 400;
						color: #333333;
					}

					.cate-items-active {
						background-color: #8faaff;
						font-size: 28rpx;
						font-weight: 400;
						color: #FFFFFF;
						border-radius: 8rpx;
					}
				}
			}

			.datalist-container {
				width: 100%;

				.article-list-content {
					width: 100%;
					padding: 0 32rpx;

					.article-container {
						width: 100%;
						height: 380rpx;
						padding: 20rpx;
						margin-bottom: 20rpx;
						background-color: #FFFFFF;

						.imageContent {
							width: 100%;
							height: 210rpx;
							position: relative;
							image{
								border-radius: 12rpx;
							}

							.abscontent {
								position: absolute;
								left: 15rpx;
								bottom: -15rpx;
								z-index: 1;
								width: 160rpx;
								height: 40rx;
								background: linear-gradient(-90deg, #7619EC, #A429F3);
								border-radius: 5rpx;
								font-weight: 400;
								color: #FFFFFF;
								font-size: 24rpx;
							}
						}

						.titlebar {
							width: 100%;
							margin-top: 20rpx;
							font-size: 28rpx;
							font-weight: 400;
							color: #333333;
						}

						.subtitle {
							width: 100%;
							font-size: 24rpx;
							color: #999999;
							text-overflow: -o-ellipsis-lastline;
							overflow: hidden;
							text-overflow: ellipsis;
							display: -webkit-box;
							-webkit-line-clamp: 2;
							line-clamp: 2;
							-webkit-box-orient: vertical;
							line-height: 34rpx;
						}
					}
				}
			}
		}
	}
</style>
