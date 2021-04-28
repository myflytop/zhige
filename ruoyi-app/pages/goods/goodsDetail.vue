<template>
	<view class="container">
		<view class="flexbox borderBox colCen" :style="'background:rgba(255,255,255,'+ scrollTop/100 +');'">
			<view class="topbarbox"></view>
			<view class="leftimgbox rowCen" @tap="back()">
				<view class="shadow rowCenCen" :style="'background:rgba(0,0,0,'+ (0.6-scrollTop/100) +');'">
					<view class="iconfont" :style="'color:' + ((scrollTop/100)>0.5?'#222222;':'#ffffff;')">&#xe630;</view>
				</view>
			</view>
		</view>
		<view class="hdWrap">
			<view class="topSwiper-container rowCen borderBox">
				<swiper class="swiper-container" :duration="500" :current='currentIndex' @change="swiperChange">
					<swiper-item v-for="(items,index) in (pageType==3 && optionsInfo.imageList?optionsInfo.imageList:pageInfo.showImgs)"
					 :key="index">
						<view class="swiper-item defIcon">
							<image v-if="index==0 && pageType!=3 && optionsInfo.mainPic" :src="optionsInfo.mainPic" mode="aspectFill"></image>
							<image v-else :src="items.url" mode="aspectFill"></image>
						</view>
					</swiper-item>
				</swiper>
				<view class="pagetopBar-container colCen">
					<view class="topbarbox"></view>
				</view>
				<view class="currentbox rowCenCen" v-if="optionsInfo.imageList || pageInfo.showImgs">
					<view>{{currentIndex+1}}/{{pageType==3?optionsInfo.imageList.length:pageInfo.showImgs.length}}</view>
				</view>
			</view>
		</view>
		<view class="sectionWrap">
			<view class="trade-name-container">
				<image v-if="pageType ==1 && pageInfo.shopType==0" src="../../static/images/goods/tbtips.png" mode="heightFix"></image>
				<image v-if="pageType ==1 && pageInfo.shopType==1" src="../../static/images/goods/tmtips.png" mode="heightFix"></image>
				<image v-if="pageType ==2" src="@/static/images/goods/pddtips.png" mode="heightFix"></image>
				<image v-if="pageType ==3" src="@/static/images/goods/jdtips.png" mode="heightFix"></image>

				<text class="tradename">
					{{optionsInfo.dtitle?optionsInfo.dtitle:pageInfo.dtitle}}
				</text>
			</view>
			<view class="secDesc juli">{{optionsInfo.monthSales?optionsInfo.monthSales:pageInfo.monthSales}}人已购买</view>
			<view class="rowCenBet priceInfo">
				<view style="font-size: 24rpx;color: #FF4242;">
					¥
					<text style="font-size: 40rpx;">{{optionsInfo.actualPrice?optionsInfo.actualPrice:pageInfo.actualPrice}}</text>
					<text class="secDesc" style="margin-left: 5rpx;">
						券后
						<text style="text-decoration: line-through;margin-left: 20rpx;">¥{{optionsInfo.originalPrice?optionsInfo.originalPrice:pageInfo.originalPrice}}</text>
					</text>
				</view>
				<!-- <view class="rowCen scBtns">
					<view class="scBtn scBtn1">补0.5元</view>
					<view class="scBtn scBtn2">返4.3元</view>
				</view> -->
			</view>
			<!-- <view class="shenjiWrap">
				<view class="shenjiNew">现在升级成为运营总监，立即赚1.61元</view>
				<view class="shenjiBtn rowCenCen">
					<image class="shenjiImg" src="/static/images/goods/member.png"></image>
					<text class="sehnjiText">立即升级</text>
				</view>
			</view> -->
			<view class="quanWrap" v-if="optionsInfo.couponPrice>0 || pageInfo.couponPrice>0">
				<image src="../../static/images/goods/qbg.png" mode='aspectFit' class="quanBg"></image>
				<view class="quanCon rowCenEnd">
					<view class="quanPrice rowCenCen">
						<text style="font-size: 32rpx;">{{optionsInfo.couponPrice?optionsInfo.couponPrice:pageInfo.couponPrice}}</text>
						元
					</view>
					<view class="colCen quanSc">
						<view class="quanName">优惠券使用期限</view>
						<view class="quanDate">{{pageType==3?optionsInfo.useStartTime :pageInfo.couponStartTime}}~{{pageType==3?optionsInfo.useEndTime:pageInfo.couponEndTime}}</view>
					</view>
					<view class="quanBtn rowCenCen" @tap="getCouponUrl()">立即领券</view>
				</view>
			</view>
			<view class="gaoyongWrap" v-if="pageInfo.desc">
				<view class="gaoyongTitle">好物推荐</view>
				<view class="gaoyongCon gaoyongVal" v-html="pageInfo.desc">
				</view>
			</view>
		</view>
		<view class="qijianWrap" v-if="pageType!=3 && pageInfo.id!=-1">
			<view class="rowCenBet qianjianHd">
				<view class="qijianLeft rowCen">
					<image class="qjLfImg" v-if="pageInfo.shopLogo" :src="pageInfo.shopLogo"></image>
					<view class="qijianInfo">
						<view class="qijianName">{{pageInfo.shopName}}</view>
						<image class="tianmaoLogo" v-if="optionsInfo.shopType==1" src="../../static/images/goods/tmshop.png"></image>
						<view class="qijianGuang">进店逛逛</view>
					</view>
				</view>
				<!-- <view class="qijianRight rowCen">
					<view class="qijianBtn">店铺全部优惠</view>
					<image class="qjRgImg" src="/static/images/goods/next.png"></image>
				</view> -->
			</view>
			<view class="rowCenBet qianjianFt">
				<view class="pingjia rowCen">
					<view class="pingjiaKey">宝贝描述:{{pageInfo.descScore}}</view>
					<image class="pingjiaImg" src="/static/images/goods/gao.png"></image>
				</view>
				<view class="pingjia rowCen">
					<view class="pingjiaKey">卖家服务:{{pageInfo.serviceScore}}</view>
					<image class="pingjiaImg" src="/static/images/goods/di.png"></image>
				</view>
				<view class="pingjia rowCen">
					<view class="pingjiaKey">物流服务:{{pageInfo.shipScore}}</view>
					<image class="pingjiaImg" src="/static/images/goods/gao.png"></image>
				</view>
			</view>
		</view>
		<!-- 相关推荐 -->
		<view class="recommendWrap" v-if="pageType==1 && recommendList.length>0">
			<view class="recommendTitle">相关推荐</view>
			<scroll-view scroll-x>
				<view class="recommendList rowCen">
					<view class="recommendItem" v-for="(items,index) in recommendList" :key="index" @tap="goDetails(items)">
						<image class="recommendImg" :src="items.itempic"></image>
						<view class="recommendName u-line-2">{{items.itemshorttitle}}</view>
						<view class="couponbac-box colCenCen">
							<view>{{items.couponmoney}}元券</view>
						</view>
						<view class="recommendPrice rowEnd">
							<view class="rmbicon">
								&yen;
							</view>
							<view class="price">
								{{items.itemendprice}}
							</view>
							<s>
								&yen;{{items.itemendprice}}
							</s>
						</view>
					</view>
				</view>
			</scroll-view>
		</view>
		<view class="goodDetail">
			<!-- 此处应该是富文本 -->
			<view class="detailsTitle-container rowCenCen">
				<view class="border"></view>
				<view class="detTxt">
					商品详情
				</view>
				<view class="border"></view>
			</view>
			<view class="detailImgList colCen">
				<block v-for="(items,index) in (pageType==3?JdDetails:(pageInfo.detailPics?pageInfo.detailPics:pageInfo.imgs))"
				 :key="index">
					<image class="detailpic" :src="items" mode="widthFix"></image>
				</block>
			</view>
			<!-- <view class="elseSituation" v-else v-html="detailText">
				
			</view> -->
		</view>


		<view class="bottombox">
		</view>
		<view class="footerWrap rowSta">
			<view class="footBar-container rowCenBet borderBox">
				<view class="left-content icon-content rowCenCen">
					<view class="iconContent backHomeIcon colCen" @tap='goindex()'>
						<view class="iconbox defIcon">
							<image src="../../static/images/goods/hom.png" mode="aspectFill"></image>
						</view>
						<view class="text">
							首页
						</view>
					</view>
					<view class="iconContent collectIcon colCen" v-if="pageType==1" @tap="collectGoods()">
						<view class="iconbox defIcon">
							<image v-if="isCollect" src="../../static/images/goods/collect.png" mode="aspectFill"></image>
							<image v-else src="../../static/images/goods/nocollect.png" mode="aspectFill"></image>
						</view>
						<view class="text">
							{{isCollect?'已收藏':'收藏'}}
						</view>
					</view>
				</view>

				<view class="right-container rowCen borderBox">
					<view class="leftsharebox btnbox colCenCen" @tap="goPath()">
						<!-- <view class="priceText">
							￥123
						</view> -->
						<view class="texttips">
							分享
						</view>
					</view>
					<view class="rightbackbox btnbox colCenCen" @tap="getCouponUrl()">
						<!-- <view class="priceText">
							￥123
						</view> -->
						<view class="texttips">
							领券购买
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import utils from '../../utils/utils.js'
	export default {
		data() {
			return {
				memberId: '',
				scrollTop: 0,

				currentIndex: '',
				optionsInfo: {
					goodsId: ''
				},
				pageType: '',
				pageInfo: {},
				JdDetails: [],
				detailText: '',
				isCollect: false,

				recommendList: [],
				shakeprof: true
			};
		},
		onPageScroll(e) {
			this.scrollTop = e.scrollTop
		},
		onLoad(options) {
			if (options.id) {
				this.optionsInfo.goodsId = options.id
				this.pageType = 1
			} else {
				this.optionsInfo = JSON.parse(options.info);
				console.log(this.optionsInfo);
				this.pageType = Number(JSON.parse(options.info).searchSource)
			}

			try {
				const value = uni.getStorageSync('userInfo');
				if (value) {
					this.memberId = value.memberId
				} else {
					this.memberId = ''
				}
			} catch (e) {
				this.memberId = ''
			}

			this.getPageInfo()
			if (this.pageType == 1) {
				this.pageInfo.showImgs = []
				var a = {}
				a.url = this.optionsInfo.mainPic
				this.pageInfo.showImgs.push(a)
				this.getCollectInfo()
				this.getrecommend()
			} else if (this.pageType == 2) {
				this.pageInfo.showImgs = []
				var a = {}
				a.url = this.optionsInfo.mainPic
				this.pageInfo.showImgs.push(a)
			}
		},
		methods: {
			getPageInfo(e) {
				if (this.pageType == 3) {
					this.$http.post('jd/getWareStyle/' + this.optionsInfo.goodsId).then(res => {
						console.log(res);
						this.JdDetails = this.JdDetails.concat(res.imgArray)
						this.$forceUpdate()
					})
				} else if (this.pageType == 1) {
					this.$http.post('tb/getGoodsDetails', {
						goodsId: this.optionsInfo.goodsId,
						memberId: this.memberId
					}, 'application/json').then(res => {
						console.log(res);
						this.pageInfo = res
						this.pageInfo.showImgs = []
						this.pageInfo.imgs.map(items => {
							var a = {}
							a.url = items
							this.pageInfo.showImgs.push(a)
						})

						this.optionsInfo = res
						console.log(this.pageInfo);
					})
				} else if (this.pageType == 2) {
					this.$http.post('pddgoods/getGoodsDetails', {
						goodsId: this.optionsInfo.goodsId,
					}, 'application/json').then(res => {
						console.log(res);
						this.pageInfo = res
						this.pageInfo.showImgs = []
						this.pageInfo.imgs.map(items => {
							var a = {}
							a.url = items
							this.pageInfo.showImgs.push(a)
						})
						console.log(this.pageInfo);
					})
				}
			},
			
			goDetails(info) {
				info.searchSource = 1
				uni.navigateTo({
					url: './goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},

			getCollectInfo() {
				this.$http.post('collectProducts/tbGoodsIsCollect', {
					productId: this.optionsInfo.goodsId,
					type: 1
				}, 'application/json').then(res => {
					console.log(res);
					this.shakeprof = true
					if (res.isCollect == 'Y') {
						this.isCollect = true
					} else {
						this.isCollect = false
					}
				})
			},

			getrecommend() {
				this.$http.post('tb/getSimilerGoods', {
					goodsId: this.optionsInfo.goodsId,
				}, 'application/json').then(res => {
					console.log(res);
					this.recommendList = res.slice(0, 6)
				})
			},

			swiperChange(e) {
				this.currentIndex = e.detail.current
			},
			back() {
				uni.navigateBack({
					delta: 1
				})
			},

			goBack() {
				uni.navigateBack({
					delta: 1
				});
			},
			//商品详情
			toDetail(goodsId) {
				uni.navigateTo({
					url: '/pages/goods/goodsDetail?id=' + goodsId
				})
			},
			collectGoods() {
				if (this.shakeprof) {
					this.shakeprof = false
					if (this.isCollect) {
						this.$http.post('collectProducts/cancelCollect', {
							ids: [this.optionsInfo.goodsId],
						}, 'application/json').then(res => {
							this.shakeprof = true
							this.isCollect = !this.isCollect
						})
					} else {
						this.$http.post('collectProducts/saveCollect', {
							productId: this.optionsInfo.goodsId,
							type: 1
						}, 'application/json').then(res => {
							this.shakeprof = true
							this.isCollect = !this.isCollect
						})
					}
				}
			},
			getCouponUrl() {
				console.log(this.pageType);
				if (this.pageType == 1) {
					this.getTbsrc()
				} else if (this.pageType == 2) {
					this.getPddsrc()
				} else if (this.pageType == 3) {
					this.getJDsrc()
				}
			},

			getTbsrc() {
				this.$http.post('tb/getPrivilegeLink', {
					goodsId: this.optionsInfo.goodsId,
				}, 'application/json', true).then(res => {
					console.log(res);
					var tburl = res.shortUrl
					// #ifdef APP-PLUS
					if (plus.os.name == 'Android') {
						console.log(plus.os.name);
						plus.runtime.openURL(tburl, res => {
							uni.showModal({
								content: "本机未检测到淘宝客户端，是否打开浏览器访问？",
								success: res => {
									if (res.confirm) {
										plus.runtime.openURL(tburl)
									}
								}
							})
						}, 'com.taobao.taobao');
					} else {
						var http = tburl
						tburl = tburl.split('//')[1]
						plus.runtime.openURL('taobao://' + tburl, function(res) {
							uni.showModal({
								content: "本机未检测到淘宝客户端，是否打开浏览器访问？",
								success: res => {
									if (res.confirm) {
										uni.navigateTo({
											url: '../webView/webView?url=' + encodeURIComponent(http)
										})
									}
								}
							})
						}, 'taobao://');
					}
					// #endif
				})
			},

			getPddsrc() {
				this.$http.post('pddgoods/generate', {
					goodsIdList: this.optionsInfo.goodsId,
					memberId: this.memberId
				}, 'application/json', true).then(res => {
					console.log(res);
					const pddurl = res.schemaUrl
					const h5pddurl = res.weAppWebViewShortUrl
					// #ifdef APP-PLUS
					if (plus.os.name == 'Android') {
						plus.runtime.openURL(pddurl, res => {
							console.log(res);
							uni.showModal({
								content: "本机未检测到拼多多客户端，是否打开浏览器访问？",
								success: res => {
									if (res.confirm) {
										plus.runtime.openURL(h5pddurl)
									}
								}
							})
						}, 'com.xunmeng.pinduoduo');
					} else {
						plus.runtime.launchApplication({
							action: "pinduoduo://com.xunmeng.pinduoduo/" + pddurl.replace(/https:\/\/.*\//, "")
						}, res => {
							uni.showModal({
								content: "本机未检测到拼多多客户端，是否打开浏览器访问？",
								success: res => {
									if (res.confirm) {
										plus.runtime.openURL(h5pddurl)
									}
								}
							})
						})
					}
					// #endif
				})
			},

			getJDsrc() {
				this.$http.post('jd/getUnionurl', {
					goodsId: this.optionsInfo.goodsId,
				}, 'application/json', true).then(res => {
					console.log(res);
					var url = res.link
					if (res.link.substr(0, 5) === 'https') {
						let data = {
							category: 'jump',
							des: 'getCoupon',
							url: res.link.substr(8)
						}
						// var jdurl = `openApp.jdMobile://virtual?params=${JSON.stringify(data)}`;
					} else if (res.link.substr(0, 4) === 'http') {
						let data = {
							category: 'jump',
							des: 'getCoupon',
							url: res.link.substr(7)
						}
						// var jdurl = `openApp.jdMobile://virtual?params=${JSON.stringify(data)}`;
					}
					// #ifdef APP-PLUS
					plus.runtime.openURL('openApp.jdMobile://virtual?params=' + encodeURIComponent('{"des":"m","url":"' + res.link +
						'","category":"jump"}'), res => {
						console.log(res);
						uni.showModal({
							content: "本机未检测到京东客户端，是否打开浏览器访问？",
							success: res => {
								if (res.confirm) {
									plus.runtime.openURL(url)
								}
							}
						})
					}, 'com.jingdong.app.mall');
					// #endif
				})
			},

			goPath() {
				if (this.pageType == 3) {
					uni.navigateTo({
						url: './shareGoods?info=' + encodeURIComponent(JSON.stringify(this.optionsInfo))
					})
				} else {
					uni.navigateTo({
						url: './shareGoods?info=' + encodeURIComponent(JSON.stringify(this.pageInfo))
					})
				}
			},

			goindex() {
				uni.switchTab({
					url: '../index/index'
				})
			}
		}
	};
</script>

<style>
	page {
		background-color: #F1F0F5;
	}
</style>
<style lang="scss" scoped>
	.container {
		.flexbox {
			position: fixed;
			z-index: 100;
			width: 100%;
			padding: 0 32rpx;

			.leftimgbox {
				width: 100%;
				height: 90rpx;

				.shadow {
					width: 50rpx;
					height: 50rpx;
					font-size: 28rpx;
					border-radius: 50%;
				}
			}
		}

		.hdWrap {
			height: 750rpx;
			position: relative;

			.topSwiper-container {
				width: 100%;
				height: 750rpx;
				position: relative;

				.swiper-container {
					width: 100%;
					height: 100%;

					.swiper-item {
						width: 100%;
						height: 100%;
					}
				}

				.currentbox {
					position: absolute;
					width: 60rpx;
					height: 30rpx;
					border-radius: 15rpx;
					bottom: 10rpx;
					right: 30rpx;
					background: rgba(0, 0, 0, 0.3);
					font-size: 24rpx;
					font-weight: 400;
					color: #FFFFFF;
				}

				.pagetopBar-container {
					width: 100%;
					position: absolute;
					top: 0;
					left: 0;
				}
			}

			// .hdZujian {
			// 	position: absolute;
			// 	width: 100%;
			// 	top: 0;

			// 	.topbarbox {
			// 		display: flex;
			// 		width: 100%;
			// 		height: var(--status-bar-height);
			// 		background-color: transparent;
			// 	}
			// }
		}

		.sectionWrap {
			padding: 40rpx 32rpx 30rpx;
			background-color: #FFFFFF;

			.scTitleWrap {
				.scTitle {
					width: 46rpx;
					height: 46rpx;

					.scTitleImg {
						width: 46rpx;
						height: 46rpx;
					}
				}

				.scTitleText {
					font-size: 32rpx;
					margin-left: 10rpx;
				}
			}

			.trade-name-container {
				overflow: hidden;
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;

				image {
					width: 60rpx;
					height: 24rpx;
					margin-right: 10rpx;
					margin-top: 8rpx;
				}

				.tradename {
					font-size: 30rpx;
					font-weight: 400;
					color: #333333;
				}
			}

			.priceInfo {
				margin-bottom: 30rpx;
			}

			.secDesc {
				color: #999999;
				font-size: 24rpx;
			}

			.juli {
				margin: 20rpx 0 25rpx;
			}

			.scBtns {
				.scBtn {
					border-radius: 10rpx;
					font-size: 20rpx;
					color: #FFFFFF;
					padding: 5rpx 15rpx;
				}

				.scBtn1 {
					background: linear-gradient(-90deg, #FC3653, #F87721);
				}

				.scBtn2 {
					background: linear-gradient(-90deg, #7619EC, #A429F3);
					margin-left: 10rpx;
				}
			}

			.shenjiWrap {
				position: relative;
				font-size: 24rpx;
				margin: 39rpx 0 20rpx;

				.shenjiNew {
					width: 686rpx;
					height: 70rpx;
					line-height: 70rpx;
					background: #FFF2CF;
					border-radius: 5rpx;
					color: #593A0F;
					padding-left: 10rpx;
				}

				.shenjiBtn {
					position: absolute;
					top: 16rpx;
					right: 20rpx;
					background: rgba($color: #000000, $alpha: 0.6);
					border-radius: 20rpx;
					width: 150rpx;
					height: 40rpx;

					.shenjiImg {
						width: 27rpx;
						height: 24rpx;
					}

					.sehnjiText {
						margin-left: 6rpx;
						color: #FFFFFF;
					}
				}
			}

			.quanWrap {
				position: relative;
				color: #FFFFFF;

				.quanBg {
					width: 686rpx;
					height: 140rpx;
				}

				.quanCon {
					position: absolute;
					top: 0;
					width: 686rpx;
					height: 140rpx;

					.quanPrice {
						font-size: 34rpx;
					}

					.quanSc {
						width: 340rpx;

						.quanName {
							font-size: 28rpx;
						}

						.quanDate {
							width: 280rpx;
							height: 40rpx;
							line-height: 40rpx;
							text-align: center;
							background: rgba($color: #FDF6F6, $alpha: 0.2);
							border-radius: 20rpx;
							font-size: 20rpx;
							margin-top: 6rpx;
							white-space: nowrap;
						}
					}

					.quanBtn {
						font-size: 28rpx;
						width: 210rpx;
						height: 90rpx;
						text-align: center;
						border-left: 2rpx dotted #FFFFFF;
					}
				}
			}

			.gaoyongWrap {
				width: 686rpx;
				background-color: #FFEDED;
				border-radius: 16rpx;
				color: #FFFFFF;
				margin-top: 30rpx;
				padding-bottom: 24rpx;

				.gaoyongTitle {
					border-radius: 16rpx 0 20rpx;
					background-color: #FF4242;
					width: 150rpx;
					height: 50rpx;
					line-height: 50rpx;
					text-align: center;
					font-size: 28rpx;
				}

				.gaoyongCon {
					margin: 14rpx 18rpx 20rpx;
					font-size: 24rpx;
					line-height: 38rpx;
					color: #FF4242;
				}
			}
		}

		.qijianWrap {
			margin: 20rpx 0 30rpx;
			background-color: #FFFFFF;
			padding: 30rpx 32rpx;

			.qianjianHd {
				.qijianLeft {
					.qjLfImg {
						width: 120rpx;
						height: 120rpx;
					}

					.qijianInfo {
						height: 120rpx;
						display: flex;
						flex-direction: column;
						align-items: flex-start;
						justify-content: space-around;
						margin-left: 20rpx;

						.qijianName {
							font-size: 28rpx;
							color: #000000;
						}

						.tianmaoLogo {
							width: 150rpx;
							height: 20rpx;
						}

						.qijianGuang {
							font-size: 24rpx;
							color: #FF4242
						}
					}
				}

				.qijianRight {
					.qijianBtn {
						width: 180rpx;
						height: 46rpx;
						line-height: 46rpx;
						text-align: center;
						background: linear-gradient(-90deg, #FC3653, #F87721);
						border-radius: 20rpx;
						color: #FFFFFF;
						font-size: 24rpx;
					}

					.qjRgImg {
						width: 12rpx;
						height: 22rpx;
						margin-left: 20rpx;
					}
				}
			}

			.qianjianFt {
				margin-top: 20rpx;

				.pingjiaKey {
					color: #999999;
					font-size: 24rpx;
				}

				.pingjiaImg {
					width: 28rpx;
					height: 28rpx;
					margin-left: 6rpx;
				}
			}
		}

		// 相关推荐
		.recommendWrap {
			margin-bottom: 30rpx;
			background-color: #FFFFFF;
			padding: 40rpx 32rpx;

			.recommendTitle {
				font-size: 32rpx;
				margin-left: 8rpx;
			}

			.recommendList {
				margin-top: 20rpx;

				.recommendItem {
					width: 220rpx;
					height: 100%;
					margin-right: 20rpx;

					.recommendImg {
						width: 220rpx;
						height: 220rpx;
						border-radius: 8rpx;
					}

					.recommendName {
						font-size: 28rpx;
						box-sizing: border-box;
						width: 100%;
						color: #444444;
						white-space: nowrap;
						overflow: hidden;
						text-overflow: ellipsis;
					}

					.couponbac-box {
						width: 100rpx;
						height: 30rpx;
						background-image: linear-gradient(9deg,
							#f8261d 0%,
							#fe4e04 100%),
							linear-gradient(#ffe3e3,
							#ffe3e3);
						background-blend-mode: normal,
							normal;
						border-radius: 5rpx;
						font-size: 20rpx;
						color: #FFFFFF;
						font-weight: normal;
						font-stretch: normal;
						margin: 6rpx 0;
					}

					.recommendPrice {
						color: #fe3738;
						font-size: 30rpx;
						line-height: 34rpx;
						width: 100%;

						.rmbicon {
							font-size: 20rpx;
							line-height: 24rpx;
						}

						s {
							font-size: 22rpx;
							line-height: 26rpx;
							color: #999999;
							margin-left: 10rpx;
						}
					}
				}
			}
		}

		.goodDetail {
			width: 100%;

			.detailsTitle-container {
				width: 100%;
				height: 90rpx;
				background-color: #FFFFFF;

				.detTxt {
					font-size: 30rpx;
					color: #333333;
					margin: 0 60rpx;
				}

				.border {
					height: 2rpx;
					width: 80rpx;
					background-color: #666666;
				}
			}

			.detailImgList {
				width: 100%;

				.detailpic {
					width: 100%;
				}
			}
		}

		.bottombox {
			width: 100%;
			height: 110rpx;
			margin-top: 20rpx;
			height: calc(110rpx + constant(safe-area-inset-bottom));
			height: env(110rpx + constant(safe-area-inset-bottom));
		}

		// 文章推荐
		.selectedWrap {
			margin-bottom: 110rpx;

			.selectedTitle {
				margin-top: 50rpx;
				font-size: 32rpx;
				color: #333333;
				text-align: center;
			}

			.selectedList {
				padding: 10rpx 32rpx 30rpx;
				flex-wrap: wrap;

				.selectedItem {
					width: 48.5%;
					background-color: #FFFFFF;
					padding: 10rpx;
					margin-top: 20rpx;

					.goodsLeft {
						margin-top: 2rpx;

						.goodsLogo {
							width: 313rpx;
							height: 310rpx;
						}
					}

					.goodsRight {
						.goodsTitle {
							overflow: hidden;
							text-overflow: ellipsis;
							display: -webkit-box;
							-webkit-line-clamp: 2;
							-webkit-box-orient: vertical;

							.tianmao {
								width: 50rpx;
								height: 24rpx;
								margin-right: 6rpx;
							}

							.goodsName {
								width: 82%;
								font-size: 24rpx;
							}
						}

						.goodsPrice {
							color: #999999;
							font-size: 24rpx;
							margin-top: 6rpx;

							.unit {
								color: #EB4559;
								margin-left: 8rpx;
							}

							.price {
								color: #EB4559;
								font-size: 36rpx;
								font-weight: bold;
							}
						}

						.quanList {
							margin-top: 20rpx;

							.quan1 {
								position: relative;

								.quan1Img {
									width: 106rpx;
									height: 34rpx;
								}

								.quan1Text {
									position: absolute;
									top: 0;
									width: 100%;
									text-align: center;
									color: #FF4242;
									font-size: 24rpx;
								}
							}

							.quan2 {
								width: 100rpx;
								height: 34rpx;
								line-height: 30rpx;
								text-align: center;
								background: linear-gradient(-90deg, #7619EC, #A429F3);
								color: #FFFFFF;
								font-size: 24rpx;
								border-radius: 6rpx;
								margin-left: 10rpx;
							}
						}

						.yishou {
							color: #999999;
							font-size: 24rpx;
							margin-top: 10rpx;
						}
					}
				}

				.selectedItem:nth-of-type(2n) {
					margin-left: 20.5rpx;
				}
			}
		}

		.footerWrap {
			position: fixed;
			bottom: 0;
			left: 0;
			width: 100%;
			background-color: #FFFFFF;
			height: 110rpx;
			height: calc(110rpx + constant(safe-area-inset-bottom));
			height: env(110rpx + constant(safe-area-inset-bottom));

			.footBar-container {
				width: 100%;
				height: 100rpx;
				padding: 0 32rpx;

				.left-content {
					width: 190rpx;

					.iconContent {
						.iconbox {
							width: 38rpx;
							height: 38rpx;
							margin-bottom: 5rpx;
						}

						.text {
							font-size: 20rpx;
							font-weight: 400;
							color: #666666;
						}
					}

					.collectIcon {
						margin-left: 60rpx;
					}
				}

				.right-container {
					width: 490rpx;
					height: 80rpx;
					border-radius: 40rpx;
					overflow: hidden;

					.btnbox {
						width: 50%;
						height: 100%;

						.priceText {
							font-size: 28rpx;
							line-height: 1;
							font-weight: 500;
							color: #FFFFFF;
						}

						.texttips {
							font-size: 24rpx;
							font-weight: 400;
							color: #FFFFFF;
						}
					}

					.leftsharebox {
						background: linear-gradient(-90deg, #FC3653, #F87721);
					}

					.rightbackbox {
						background: linear-gradient(-90deg, #7619EC, #A429F3);
					}
				}
			}
		}
	}
</style>
