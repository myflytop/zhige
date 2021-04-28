<template>
	<view class="page-content">
		<scroll-view class="swiper-scroll" :refresher-background='headerColor' @scroll='pagescroll' scroll-y="true"
		 :scroll-top='scrollindex' :scroll-anchoring='true' scroll-with-animation lower-threshold='500' @scrolltolower="getNextPage"
		 :refresher-threshold='75' :refresher-triggered='triggeredstate' :refresher-enabled='canrefresh && canrefush'
		 @refresherrefresh='refresh' @refresherrestore="onRestore" refresher-default-style='none' :bounce='false'
		 @refresherpulling="pulling">
			<view class="indexbody-index-wrapper colCen borderBox">
				<view class="topheaderCard-container colCen borderBox">
					<view class="ellipse" :style="'background:'+ headerColor +';'"></view>
				</view>
				<view class="loading-img rowCenCen" :style="'margin-top:'+(Topheight-77)+'px;'">
					<view class="imgbox defIcon">
						<image src="../static/images/home/loading.gif" mode="aspectFill"></image>
					</view>
				</view>
				<view class="pageBody-container colCen borderBox">
					<view class="column-container">
						<view class="bannerSwiper-container colCenCen borderBox" v-if="topBannerList.length>0">
							<swiper class="swiper-box" :current="swpidx
						" @change="changeColor" :autoplay="true" :interval="3000"
							 :duration="500" :indicator-dots="true" :indicator-active-color="'#fff'" circular>
								<swiper-item v-for="(items,index) in topBannerList" :key='index'>
									<view class="swiper-item defIcon" @click="goUrl(items)">
										<image :src="items.pic" mode="aspectFit"></image>
									</view>
								</swiper-item>
							</swiper>
						</view>

						<view class="centerSwiper-container colCenCen borderBox" v-if="singleLineList.length>0">
							<swiper class="swiper-box" :autoplay="true" :interval="5000" :duration="300" circular>
								<swiper-item v-for="(items,index) in singleLineList" :key='index'>
									<view class="swiper-item defIcon" @click="goUrl(items)">
										<image :src="items.pic" mode="aspectFit"></image>
									</view>
								</swiper-item>
							</swiper>
						</view>

						<view class="cardsList-container rowCenBet borderBox" v-if="doubleLineList.length>0">
							<block v-for="(items,index) in doubleLineList" :key='index'>
								<view class="card-items defIcon" @click="goUrl(items)">
									<image :src="items.pic" mode="aspectFill" lazy-load="true"></image>
								</view>
							</block>
						</view>


						<!-- 金刚区 -->
						<view class="navslider-box" v-if="navbarShowList.length > 0">
							<swiper class="swiper-type swiper-nav" :indicator-dots="navbarList.length > 10 ? true : false" indicator-color="#eaeaea"
							 indicator-active-color="#FE3A33" :duration="500" :style="sliderH">
								<swiper-item v-for="(sliderItem, index) in navbarShowList" :key="index">
									<view class="slider_itemslist rowSta">
										<view class="item colCen" v-for="(item, idx) in sliderItem" :key="idx" @click="gojgqUrl(item,true)">
											<image :src="item.mpic" :lazy-load="true" mode="aspectFit"></image>
											<view class="desc">{{ item.mname }}</view>
										</view>
									</view>
								</swiper-item>
							</swiper>
						</view>
					</view>
				</view>

				<view class="pagebottomBody-container colCen borderBox">
					<view class="bottomSwiper-container colCenCen borderBox" v-if="bottomBannerList.length>0">
						<swiper class="swiper-box" :autoplay="true" :interval="3000" :duration="300" circular>
							<swiper-item v-for="(items,index) in bottomBannerList" :key='index'>
								<view class="swiper-item defIcon" @click="goUrl(items)">
									<image :src="items.pic" mode="widthFix"></image>
								</view>
							</swiper-item>
						</swiper>
					</view>

					<!-- 大家都在买 -->
					<view class="everysBuying-container colCen" v-if="zdmList.length>0">
						<view class="title-text">
							大家都在买
						</view>
						<view class="goodsScroll-container rowCen">
							<scroll-view class="scrollgoods-box" scroll-x scroll-with-animation>
								<view class="scrollList-content">
									<view class="goods-items" v-for="(items,index) in zdmList" :key="index" @tap="goDetails(items)">
										<view class="items-container colCen">
											<view class="image-content defIcon">
												<image :src="items.itempic" mode="aspectFill" :lazy-load="true"></image>
											</view>

											<view class="goodsinfo-content colCen borderBox">
												<view class="goodsName-box">
													{{items.itemshorttitle}}
												</view>
												<view class="coupons-container rowCen">
													<view class="couponbac-content rowCen">
														<view class="textsTip">
															爆款
														</view>
														<view class="coupons-value">
															{{items.couponmoney}}元券
														</view>
													</view>
												</view>
												<view class="price-info-container rowEnd">
													<view class="nowPrice-content rowEnd">
														<view class="rmbicon">
															￥
														</view>
														<view class="nowprice">
															{{items.itemendprice}}
														</view>
													</view>
													<view class="oldPrice-content rowEnd">
														<view class="oldprice">
															￥{{items.itemprice}}
														</view>
													</view>
												</view>
											</view>
										</view>
									</view>
								</view>
							</scroll-view>
						</view>

						<!-- <view class="progress">
						后面处理
					</view> -->
					</view>


					<!-- 实时疯抢榜 -->
					<view class="looting-container colCen borderBox">
						<view class="titlebar-container colCen">
							<view class="iconbar-content defIcon">
								<image src="@/static/images/home/top.png" mode=""></image>
							</view>
							<view class="title-text">
								实时疯抢榜
							</view>
						</view>

						<view class="goodscontents colCen">
							<scroll-view class="scrollgoods-box" scroll-x scroll-with-animation>
								<view class="scrollList-content">
									<view class="goods-items" v-for="(items,index) in phbList" :key='index'>
										<view class="items-container colCen" @tap="goDetails(items)">
											<view class="image-content defIcon">
												<image :src="items.mainPic" mode="aspectFill"></image>
											</view>

											<view class="goodsinfo-content colCen borderBox">
												<view class="goodsName-box">
													{{items.dtitle}}
												</view>
												<view class="coupons-container rowCen">
													<view class="couponbac-content rowCenCen">
														<view class="coupons-value">
															{{items.couponPrice}}元券
														</view>
													</view>
												</view>
												<view class="price-info-container rowEnd">
													<view class="nowPrice-content rowEnd">
														<view class="rmbicon">
															￥
														</view>
														<view class="nowprice">
															{{items.actualPrice}}
														</view>
													</view>
													<view class="oldPrice-content rowEnd">
														<view class="oldprice">
															￥{{items.originalPrice}}
														</view>
													</view>
												</view>
											</view>
										</view>
									</view>
								</view>
							</scroll-view>

							<view class="moreGoods-bar rowCenCen">
								<view class="moreGoodsbtn">
									更多好物~
								</view>
							</view>
						</view>
					</view>


					<!-- 抖好物 -->
					<view class="Tiktok-container colCen">
						<view class="titlebar-container rowCenBet">
							<view class="left-content rowCen">
								<view class="titletext">
									抖好物
								</view>
								<view class="bubble-box rowCenCen">
									<view>精选爆款·抖音好物</view>
								</view>
							</view>

							<view class="right-arrowContent" @tap="goTik()">
								更多
							</view>
						</view>

						<view class="goodsTopList Tiktoklist rowCenBet">
							<scroll-view class="scrollgoods-box" scroll-x scroll-with-animation>
								<view class="scrollList-content">
									<view class="goods-items" v-for="(items,index) in dyList" :key='index'>
										<view class="items-container colCen" @tap="godydetails(items)">
											<view class="image-content defIcon">
												<image :src="items.dynamicImage" mode="aspectFill" :lazy-load="true"></image>
												<view class="playback-volume iconfont rowCenCen">
													<span>&#xe617;</span>{{items.dyVideoLikeCount}}
												</view>
												<view class="suspend defIcon rowCenCen">
													<image src="@/static/images/goods/suspend.png" mode=""></image>
												</view>
											</view>

											<view class="goodsinfo-content colCen borderBox">
												<view class="goodsName-box">
													{{items.itemshorttitle}}
												</view>
												<view class="coupons-container rowCen">
													<view class="couponbac-content rowCenCen">
														<view class="coupons-value">
															{{items.couponmoney}}元券
														</view>
													</view>
												</view>
												<view class="price-info-container rowEnd">
													<view class="nowPrice-content rowEnd">
														<view class="rmbicon">
															￥
														</view>
														<view class="nowprice">
															{{items.itemendprice}}
														</view>
													</view>
													<view class="oldPrice-content rowEnd">
														<view class="oldprice">
															￥{{items.itemprice}}
														</view>
													</view>
												</view>
											</view>
										</view>
									</view>
								</view>
							</scroll-view>
						</view>
					</view>
				</view>

				<view class="goods-bottom-List colCen borderBox">
					<view class="bottomTypebar-container colCen borderBox">
						<view class="typeList rowCenCen borderBox" :style="fixedClass?'top:'+Topheight+'px;':''" :class="fixedClass?'imbibition':''">
							<block v-for="(items,index) in typedataList" :key='index'>
								<view class="type-items-container colCenEnd" @click="switchtype(items,index)" :class="bottomCurrent==index?'type-container-active':''">
									<view class="mainTitle">
										{{items.mainTitle}}
									</view>
									<view class="subtitle">
										{{items.subTitle}}
									</view>
								</view>
							</block>
						</view>
					</view>

					<view class="bottomGoods-list-container rowCenBet borderBox" v-if="bottomGoodsList.length>0">
						<block v-for="(items,index) in bottomGoodsList" :key="index">
							<view class="goods-items-cards colCen borderBox" @tap="goDetails(items)">
								<view class="goodspic-container defIcon">
									<image :src="items.mainPic" mode="aspectFill"></image>
								</view>
								<view class="bottominfo-container colCen">
									<view class="trade-name-container rowSta">
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

									<view class="discounts-container rowCen borderBox">
										<view class="coupon-box rowCenCen">
											<view>
												{{items.couponPrice}}元券
											</view>
										</view>
										<!-- <view class="back-box rowCenCen">
									<view>
										返{{items.commissionRate}}元
									</view>
								</view> -->
									</view>

									<view class="price-saleNums-container rowEndBet">
										<view class="left-price-box rowEnd">
											<span class='greytxt'>券后</span>
											<span class='rmb'>￥</span>
											<span class='pricebox'>{{items.actualPrice}}</span>
										</view>
										<view class="right-price-box">
											已售{{items.monthSales}}
										</view>
									</view>
								</view>
							</view>
						</block>

						<aLoadMore status="loading" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
					</view>
				</view>
			</view>
		</scroll-view>
		<slideTop v-if="scrollTop>1000" @toTop='scrolltoTops'></slideTop>
	</view>
</template>

<script>
	import utils from '../utils/utils.js'
	import slideTop from './slideTop.vue'
	export default {
		props: {
			Topheight: {
				type: Number,
				default: 90
			},
			canrefush: {
				type: Boolean
			},
			fixedClass: {
				type: Boolean,
				default: false
			}
		},
		components: {
			slideTop
		},
		data() {
			return {
				pageHeight: '',
				headerColor: '',
				topBannerList: [],
				singleLineList: [],
				doubleLineList: [],
				bottomBannerList: [],
				navbarShowList: [],
				navbarList: [],
				sliderH: '',

				scrollTop: 0,
				scrollindex: 0,


				zdmList: [],
				phbList: [],
				dyList: [],

				typedataList: [{
						mainTitle: '美食',
						subTitle: '吃货专属',
						type: 2
					},
					{
						mainTitle: '精选',
						subTitle: '猜你喜欢',
						type: 3
					},
					{
						mainTitle: '发现',
						subTitle: '推荐好货',
						type: 1
					}
				],
				bottomType: 3,
				bottomCurrent: 1,
				bottomGoodsList: [],
				loadingState: false,
				currentPage: 1,
				loadstatus: 'loading',

				triggeredstate: true,
				swpidx: 0,
				canrefresh: true,
			}
		},
		watch: {
			navbarList(nval, oval) {
				let index = 0;
				while (index < nval.length) {
					this.navbarShowList.push(nval.slice(index, (index += 10)));
				}
				if (this.navbarList.length > 5) {
					this.sliderH = 'height:345rpx;';
				} else {
					this.sliderH = 'height:160rpx;';
				}
			},
			headerColor: {
				handler(nvl, ovl) {
					this.$emit('passColor', nvl)
				},
				immediate: true
			}
		},
		created() {
			this._freshing = false;
			uni.$emit('initpage')
			this.getBannerInfo();
			this.getHomeMenuList();
			this.getrecommendGoods();
			this.getbottomGoodsList(this.bottomType);
		},
		mounted() {
			this.$emit('scrolltoTop')
			this.fixedClass = false;
			setTimeout(() => {
				this.getfixedHeight()
			}, 1500)
		},
		methods: {
			pulling(e) {},
			refresh(e) {
				this.triggeredstate = true
				if (this._freshing) return;
				this._freshing = true;
				this.getBannerInfo();
				this.getrecommendGoods();
				setTimeout(()=>{
					this.triggeredstate = false;
					this._freshing = false;
				},8000)
			},
			onRestore() {
				this.swpidx = 0
				console.log('下拉被终止');
			},
			pagescroll(e) {
				this.$emit('scrollNum', e.detail.scrollTop)
				this.scrollTop = e.detail.scrollTop
				if (!e.detail.scrollTop > 0) {
					setTimeout(() => {
						this.canrefresh = true
					})
				} else {
					// this.canrefresh = false
				}
			},

			scrolltoTops() {
				this.scrollindex = this.scrollTop
				this.$nextTick(() => {
					this.scrollindex = 0
				})
			},

			onAbort() {
				console.log('refushstop');
			},

			getBannerInfo() {
				// banner数据
				this.$http.get('banner/list/1').then((res) => {
					this.topBannerList = res.topBannerList;
					this.headerColor = this.topBannerList[0].colour;
					this.singleLineList = res.singleLineList;
					this.doubleLineList = res.doubleLineList;
					this.bottomBannerList = res.bottomBannerList;
					setTimeout(() => {
						this.triggeredstate = false;
						this._freshing = false;
					}, 300)
				})
			},

			goTik() {
				uni.navigateTo({
					url: '../active/tiktoklist'
				})
			},

			godydetails(itm) {
				const info = {}
				info.nowInfo = itm
				info.pageCurrent = 2
				info.type = 0
				info.storgeList = this.dyList
				utils.setCache('pathInfo', info)
				uni.navigateTo({
					url: '../active/dyvideoDetails'
				})
			},

			getHomeMenuList() {
				// 金刚区
				this.$http.post('homeMenu/getHomeMenuList', {
					type: 1
				}, 'application/json').then((res) => {
					this.navbarList = res;
				})
			},

			getrecommendGoods() {
				this.$http.post('tb/getMQD').then((res) => {
					this.zdmList = res.zdm;
					this.phbList = res.phb;
					this.dyList = res.dygoods;
				})
			},

			getbottomGoodsList(type) {
				this.$http.post('tb/getGoodThing', {
					deviceType: getApp().globalData.platform == 'android' ? (getApp().globalData.systemLevel < 10 ? 'IMEI' : 'OAID') :
						'IDFA',
					deviceValue: getApp().globalData.equipmentNumber,
					pageId: 1,
					pageSize: 10,
					type: type
				}, 'application/json').then((res) => {
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
				if (this.loadingState) {
					this.loadingState = false
					this.$http.post('tb/getGoodThing', {
						deviceType: getApp().globalData.platform == 'android' ? (getApp().globalData.systemLevel < 10 ? 'IMEI' : 'OAID') :
							'IDFA',
						deviceValue: getApp().globalData.equipmentNumber,
						pageId: this.currentPage,
						pageSize: 10,
						type: this.bottomType,
					}, 'application/json').then((res) => {
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
				}
			},

			switchtype(info, idx) {
				if (this.bottomCurrent != idx) {
					this.currentPage = 1;
					this.bottomType = info.type;
					this.getbottomGoodsList(this.bottomType);
					this.$nextTick(() => {
						this.$emit('scrolltoview')
						this.bottomCurrent = idx;
					})
				}
			},

			getfixedHeight(e) {
				uni.createSelectorQuery().in(this).select('.goods-bottom-List').boundingClientRect(data => {
					this.$emit('pushfixed', data.top)
				}).exec();
			},

			changeColor(e) {
				this.swpidx = e.detail.current
				this.topBannerList.forEach((itm, idx) => {
					if (idx == e.detail.current) {
						this.headerColor = itm.colour
					}
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

			gojgqUrl(info) {
				if (info.urlType == '0') {
					uni.navigateTo({
						url: '../webView/webView?url=' + info.murl
					})
				} else if (info.urlType == 1) {
					uni.navigateTo({
						url: info.murl
					})
				} else if (info.urlType == '2') {
					// #ifdef APP-PLUS
					if (plus.os.name == 'Android') {
						console.log(plus.os.name);
						plus.runtime.openURL(info.murl, res => {
							uni.navigateTo({
								url: '../webView/webView?url=' + info.murl
							})
						}, 'com.taobao.taobao');
					} else {
						info.murl = info.murl.split('//')[1]
						plus.runtime.openURL('taobao://' + info.murl, function(res) {
							uni.navigateTo({
								url: '../webView/webView?url=' + info.murl
							})
						}, 'taobao://');
					}
					// #endif
				}
			},

			goDetails(info) {
				info.searchSource = 1
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},
		}
	}
</script>

<style lang="scss">
	.loading-img {
		width: 100%;
		height: 150rpx;

		.imgbox {
			width: 208rpx;
			height: 126rpx;
			// max-height: 72rpx;
		}
	}
	.swiper-scroll{
		width: 100%;
		height: 100vh;
	}

	.indexbody-index-wrapper {
		width: 100%;
		position: relative;

		.topheaderCard-container {
			width: 100%;
			height: 380rpx;
			position: absolute;

			.ellipse {
				width: 130%;
				height: 100%;
				border-radius: 0 0 50% 50%;
			}
		}

		.pageBody-container {
			width: 100%;
			background-color: #FFFFFF;

			.column-container {
				width: 100%;
				z-index: 10;

				.bannerSwiper-container {
					width: 100%;
					height: 280rpx;
					padding: 0 32rpx;
					margin-bottom: 20rpx;

					/deep/.swiper-box {
						width: 100%;
						height: 100%;

						.swiper-item {
							width: 100%;
							height: 100%;
							border-radius: 12rpx;
							overflow: hidden;
						}

						.uni-swiper-dot {
							width: 20rpx;
							height: 6rpx;
							border-radius: 3rpx;
						}
					}
				}


				.centerSwiper-container {
					width: 100%;
					height: 190rpx;
					padding: 0 32rpx;
					margin-bottom: 20rpx;

					.swiper-box {
						width: 100%;
						height: 100%;

						.swiper-item {
							width: 100%;
							height: 100%;
						}
					}
				}

				.cardsList-container {
					width: 100%;
					flex-wrap: wrap;
					padding: 0 32rpx;
					margin-bottom: 20rpx;

					.card-items {
						width: 340rpx;
						height: 135rpx;
						overflow: hidden;
						border-radius: 8rpx;
						margin-bottom: 10rpx;
					}
				}

				/deep/.navslider-box {
					width: 100%;

					.swiper-type {
						width: 100%;

						.slider_itemslist {
							width: 100%;
							flex-wrap: wrap;

							.item {
								width: 150rpx;
								margin-bottom: 30rpx;

								image {
									width: 80rpx;
									height: 80rpx;
									margin-bottom: 10rpx;
								}

								.desc {
									font-size: 28rpx;
									font-weight: 400;
									color: #333333;
								}
							}
						}
					}

					.uni-swiper-dot {
						width: 20rpx;
						height: 6rpx;
						border-radius: none;
					}
				}
			}
		}

		.pagebottomBody-container {
			width: 100%;
			margin-bottom: 20rpx;

			.bottomSwiper-container {
				width: 100%;
				height: 260rpx;
				padding: 0 32rpx;
				background-color: #FFFFFF;

				.swiper-box {
					width: 100%;
					height: 100%;

					.swiper-item {
						width: 100%;
						height: 100%;
					}
				}
			}

			.everysBuying-container {
				width: 100%;
				background-color: #FFFFFF;
				border-radius: 12rpx;
				padding: 0 32rpx;
				margin-bottom: 20rpx;

				.title-text {
					width: 100%;
					font-size: 32rpx;
					font-weight: 500;
					color: #333333;
					margin: 20rpx 0;
				}

				.goodsScroll-container {
					width: 100%;
					height: 340rpx;

					.scrollgoods-box {
						width: 100%;
						height: 100%;

						.scrollList-content {
							white-space: nowrap;

							.goods-items {
								display: inline-block;
								width: 220rpx;
								height: 340rpx;
								border-radius: 8rpx;
								overflow: hidden;

								.items-container {
									width: 100%;
									height: 100%;

									.image-content {
										width: 200rpx;
										height: 200rpx;
										border-radius: 8rpx;
										overflow: hidden;
										margin-top: 10rpx;
									}

									.goodsinfo-content {
										width: 100%;
										height: 120rpx;
										padding: 0 10rpx;

										.goodsName-box {
											width: 100%;
											line-height: 34rpx;
											white-space: nowrap;
											overflow: hidden;
											text-overflow: ellipsis;
											font-size: 24rpx;
											font-weight: 400;
											color: #444444;
											margin-top: 5rpx;
										}

										.coupons-container {
											width: 100%;
											margin-top: 10rpx;

											.couponbac-content {
												width: 160rpx;
												height: 30rpx;
												background: url(../static/images/goods/quanbg.png) no-repeat;
												background-size: 100% 100%;
												border-radius: 5rpx;

												.textsTip {
													font-size: 20rpx;
													font-weight: 400;
													color: #FFFFFF;
													margin-left: 10rpx;
													white-space: nowrap;
												}

												.coupons-value {
													font-size: 20rpx;
													font-weight: 500;
													color: #FF4242;
													white-space: nowrap;
													margin-left: 30rpx;
												}
											}
										}

										.price-info-container {
											width: 100%;

											.nowPrice-content {
												.rmbicon {
													line-height: 34rpx;
													font-size: 20rpx;
													font-weight: 400;
													color: #FF4242;
												}

												.nowprice {
													font-size: 28rpx;
													font-weight: 400;
													color: #FF4242;
												}
											}

											.oldPrice-content {
												margin-left: 10rpx;

												.oldprice {
													line-height: 34rpx;
													text-decoration: line-through;
													font-size: 20rpx;
													font-weight: 400;
													color: #999999;
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

			.looting-container {
				width: 100%;
				height: 600rpx;
				background: linear-gradient(-90deg, #7619EC, #A429F3);
				padding: 0 22rpx;

				.titlebar-container {
					width: 100%;

					.iconbar-content {
						width: 500rpx;
						height: 53rpx;
						margin-top: 20rpx;
						margin-bottom: 10rpx;
					}

					.title-text {
						font-size: 32rpx;
						font-weight: bold;
						font-style: italic;
						color: #FFFFFF;
						margin-bottom: 25rpx;
					}
				}


				.goodscontents {
					width: 100%;
					background: #F7F7F7;

					.scrollgoods-box {
						width: 100%;
						height: 360rpx;
						margin-top: 20rpx;

						.scrollList-content {
							height: 360rpx;
							padding-left: 10rpx;
							white-space: nowrap;

							.goods-items {
								width: 220rpx;
								height: 360rpx;
								margin-right: 10rpx;
								border-radius: 8rpx;
								display: inline-block;
								overflow: hidden;
								background-color: #FFFFFF;

								.items-container {
									width: 100%;
									height: 100%;

									.image-content {
										width: 220rpx;
										height: 220rpx;
										margin-top: 10rpx;
									}

									.goodsinfo-content {
										width: 100%;
										height: 140rpx;
										padding: 0 10rpx;

										.goodsName-box {
											width: 100%;
											line-height: 34rpx;
											white-space: nowrap;
											overflow: hidden;
											text-overflow: ellipsis;
											font-size: 24rpx;
											font-weight: 400;
											color: #444444;
											margin-top: 5rpx;
										}

										.coupons-container {
											width: 100%;
											margin-top: 10rpx;

											.couponbac-content {
												width: 100rpx;
												height: 30rpx;
												background: url(../static/images/goods/couponbac.png)no-repeat;
												background-size: 100% 100%;
												border-radius: 5rpx;

												.coupons-value {
													font-size: 20rpx;
													font-weight: 500;
													color: #FF4242;
													white-space: nowrap;
												}
											}
										}

										.price-info-container {
											width: 100%;

											.nowPrice-content {
												.rmbicon {
													line-height: 34rpx;
													font-size: 20rpx;
													font-weight: 400;
													color: #FF4242;
												}

												.nowprice {
													font-size: 28rpx;
													font-weight: 400;
													color: #FF4242;
												}
											}

											.oldPrice-content {
												margin-left: 10rpx;

												.oldprice {
													line-height: 34rpx;
													text-decoration: line-through;
													font-size: 20rpx;
													font-weight: 400;
													color: #999999;
												}
											}
										}
									}
								}
							}
						}
					}

					.moreGoods-bar {
						width: 100%;
						height: 60rpx;
						font-size: 24rpx;
						font-weight: 400;
						color: #999999;
					}
				}
			}

			.Tiktok-container {
				width: 100%;
				height: 475rpx;
				padding: 0 32rpx;
				background-color: #FFFFFF;

				.titlebar-container {
					width: 100%;
					height: 90rpx;

					.left-content {
						.titletext {
							font-size: 32rpx;
							font-weight: 500;
							color: #333333;
						}

						.bubble-box {
							width: 200rpx;
							height: 25rpx;
							margin-left: 5rpx;
							background: linear-gradient(-90deg, #7619EC, #A429F3);
							border-radius: 12rpx 12rpx 12rpx 0px;
							font-size: 20rpx;
							font-weight: 400;
							color: #FFFFFF;
						}
					}

					.right-arrowContent {
						font-size: 24rpx;
						font-weight: 400;
						color: #999999;
					}
				}

				.goodsTopList {
					width: 100%;
					height: 340rpx;

					.scrollgoods-box {
						width: 100%;
						height: 340rpx;

						.scrollList-content {
							height: 360rpx;
							white-space: nowrap;

							.goods-items {
								width: 220rpx;
								height: 340rpx;
								border-radius: 8rpx;
								margin-right: 10rpx;
								overflow: hidden;
								background-color: #FFFFFF;
								display: inline-block;

								.items-container {
									width: 100%;
									height: 100%;

									.image-content {
										width: 220rpx;
										height: 220rpx;
										position: relative;

										.playback-volume {
											position: absolute;
											z-index: 1;
											top: 14rpx;
											left: 14rpx;
											background: rgba(0, 0, 0, 0.5);
											padding: 5rpx 15rpx;
											border-radius: 15rpx;
											font-size: 20rpx;
											font-weight: 500;
											color: #FFFFFF;

											span {
												font-size: 28rpx;
											}
										}

										.suspend {
											position: absolute;
											top: 90;
											left: 90;
											width: 40rpx;
											height: 40rpx;
										}
									}

									.goodsinfo-content {
										width: 100%;
										height: 120rpx;

										.goodsName-box {
											width: 100%;
											line-height: 34rpx;
											white-space: nowrap;
											overflow: hidden;
											text-overflow: ellipsis;
											font-size: 24rpx;
											font-weight: 400;
											color: #444444;
											margin-top: 5rpx;
										}

										.coupons-container {
											width: 100%;
											margin-top: 10rpx;

											.couponbac-content {
												width: 100rpx;
												height: 30rpx;
												background: url(../static/images/goods/couponbac.png)no-repeat;
												background-size: 100% 100%;

												.coupons-value {
													font-size: 20rpx;
													font-weight: 500;
													color: #FF4242;
													white-space: nowrap;
												}
											}
										}

										.price-info-container {
											width: 100%;

											.nowPrice-content {
												.rmbicon {
													line-height: 34rpx;
													font-size: 20rpx;
													font-weight: 400;
													color: #FF4242;
												}

												.nowprice {
													font-size: 28rpx;
													font-weight: 400;
													color: #FF4242;
												}
											}

											.oldPrice-content {
												margin-left: 10rpx;

												.oldprice {
													line-height: 34rpx;
													text-decoration: line-through;
													font-size: 20rpx;
													font-weight: 400;
													color: #999999;
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

		.goods-bottom-List {
			width: 100%;

			.bottomTypebar-container {
				width: 100%;
				height: 115rpx;

				.typeList {
					width: 100%;
					height: 100%;

					.type-items-container {
						width: 150rpx;
						height: 100%;

						.mainTitle {
							font-size: 24rpx;
							font-weight: 500;
							color: #333333;
							margin-bottom: 5rpx;
						}

						.subtitle {
							width: 90rpx;
							white-space: nowrap;
							line-height: 24rpx;
							height: 30rpx;
							background: transparent;
							text-align: center;
							font-size: 20rpx;
							font-weight: 400;
							color: #999999;
							margin-bottom: 20rpx;
						}
					}

					.type-container-active {
						.mainTitle {
							font-size: 40rpx;
							font-weight: bold;
							color: #21135C;
						}

						.subtitle {
							background: url(../static/images/home/subt.png)no-repeat;
							background-size: 100% 100%;
							color: #FFFFFF;
						}
					}
				}

				.imbibition {
					width: 100%;
					height: 115rpx;
					z-index: 600;
					position: fixed;
					background-color: #FFFFFF;
				}
			}


			.bottomGoods-list-container {
				width: 100%;
				padding: 0 32rpx;
				flex-wrap: wrap;

				.goods-items-cards {
					width: 335rpx;
					height: 490rpx;
					background-color: #FFFFFF;
					padding: 10rpx;
					margin-bottom: 20rpx;

					.goodspic-container {
						width: 310rpx;
						height: 310rpx;
					}

					.bottominfo-container {
						width: 100%;

						.trade-name-container {
							width: 100%;
							margin-top: 10rpx;

							.typeIcon-content {
								width: 60rpx;
								height: 24rpx;
								margin-right: 5rpx;
								margin-top: 8rpx;
							}

							.tradename {
								width: 240rpx;
								white-space: nowrap;
								overflow: hidden;
								text-overflow: ellipsis;
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
							}
						}

						.discounts-container {
							width: 100%;
							margin: 20rpx 0;

							.coupon-box {
								width: 102rpx;
								height: 30rpx;
								background: url(../static/images/goods/couponbac.png)no-repeat;
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

						.price-saleNums-container {
							width: 100%;

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

							.right-price-box {
								font-size: 20rpx;
								font-weight: 400;
								color: #999999;
							}
						}
					}
				}
			}
		}
	}
</style>
