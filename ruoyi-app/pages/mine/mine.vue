<template>
	<view class="mine-wrapper colCen wrapperLayer borderBox" v-if="userInfo">
		<view class="topheaderCard-container colCen" :style="'background: linear-gradient(0deg,'+ cusConfig.mineTopColor+','+ cusConfig.mineEndColor +');'">
			<view class="topbarbox"></view>
			<view class="headerNavigationbar borderBox rowCenBet">
				<view class="emptybox"></view>
				<view class="pageTitle">
					个人中心
				</view>
				<view class="setTing-nav defIcon" @click="gosetting('setting')">
					<image src="../../static/images/mine/mine/setting.png" mode=""></image>
				</view>
			</view>
			<view class="user-container colCen">
				<view class="avatar-box defIcon">
					<image :src="pageInfo.avatar" mode="aspectFill"></image>
				</view>
				<view class="avatar-text">{{pageInfo.nickName}}</view>
			</view>
		</view>
		<view class="advert-container defIcon" v-if="bannerList.length>0">
			<swiper class="banerContent" :autoplay="true" :interval="3000" :duration="1000" circular>
				<swiper-item v-for="(items,index) in bannerList" :key="index" @tap="goUrl(items)">
					<view class="swiper-items defIcon">
						<image :src="items.pic" mode="aspectFit"></image>
					</view>
				</swiper-item>
			</swiper>
		</view>
		<view class="tools-container borderBox colCen">
			<view class="tools-title rowCenSta">
				<view class="tools-text">
					我的工具
				</view>
			</view>
			<view class="rowCen toolsList">
				<view class="colCen toolsItem" @click="goPath('browsing')">
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/browsing.png" mode=""></image>
					</view>
					<view class="toolTexts">
						浏览足迹
					</view>
				</view>
				<view class="colCen toolsItem" @click="goPath('feedback')">
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/feedback.png" mode=""></image>
					</view>
					<view class="toolTexts">
						意见反馈
					</view>
				</view>
				<view class="colCen toolsItem" @click="goPath('customerSevice')">
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/kefu.png" mode=""></image>
					</view>
					<view class="toolTexts">
						专属客服
					</view>
				</view>
				<view class="colCen toolsItem" @click="goPath('helpCenter')">
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/helpCenter.png" mode=""></image>
					</view>
					<view class="toolTexts">
						帮助中心
					</view>
				</view>
				<view class="colCen toolsItem" @tap='checkUpdata()'>
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/version.png" mode=""></image>
					</view>
					<view class="toolTexts">
						版本更新
					</view>
				</view>
				<view class="colCen toolsItem" @click="goPath('myCollects')">
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/collection.png" mode=""></image>
					</view>
					<view class="toolTexts">
						我的收藏
					</view>
				</view>
				<view class="colCen toolsItem" @click="shareApp()">
					<view class="defIcon toolIcon">
						<image src="../../static/images/mine/mine/share.png" mode=""></image>
					</view>
					<view class="toolTexts">
						分享APP
					</view>
				</view>
			</view>
		</view>


		<u-popup v-model="shareShow" mode="bottom" border-radius="14" height="auto">
			<view class="share-container colCen">
				<view class="share-title rowCenCen">
					<view class="title-text">
						分享到
					</view>
				</view>
				<view class="shareList rowCen">
					<!-- <view class="items-container colCen" @tap='share()'>
						<view class="icon-box defIcon">
							<image src="../../static/images/mine/mine/wxshare.png" mode=""></image>
						</view>
						<view class="modeName">
							微信好友
						</view>
					</view>
					<view class="items-container colCen">
						<view class="icon-box defIcon">
							<image src="../../static/images/mine/mine/sharefriend.png" mode=""></image>
						</view>
						<view class="modeName">
							朋友圈
						</view>
					</view>
					<view class="items-container colCen">
						<view class="icon-box defIcon">
							<image src="../../static/images/mine/mine/shareqq.png" mode=""></image>
						</view>
						<view class="modeName">
							QQ
						</view>
					</view> -->
					<view class="items-container colCen" @tap="shareto()">
						<view class="icon-box defIcon">
							<image src="../../static/images/mine/mine/shareurl.png" mode=""></image>
						</view>
						<view class="modeName">
							复制链接
						</view>
					</view>
				</view>

				<view class="cancelbox rowCenCen" @click="closeModel()">
					<view class="canceltext">
						取消
					</view>
				</view>
			</view>
		</u-popup>

		<u-toast ref="uToast" />
	</view>
</template>

<script>
	import APPUpdate from "@/utils/appUpdate.js";
	export default {
		data() {
			return {
				shareShow: false,
				cusConfig: {
					mineTopColor: '#f96c65',
					mineEndColor: '#f53833'
				},
				bannerList: [],
				userInfo: '',
				pageInfo: ''
			}
		},
		onLoad() {},
		beforeCreate() {},
		onShow() {
			try {
				const value = uni.getStorageSync('userInfo');
				if (value.memberId) {
					this.userInfo = value
				} else {
					this.userInfo = ''
				}
			} catch (e) {
				this.userInfo = ''
			}
			console.log(this.userInfo);
			if (!this.userInfo.memberId) {
				uni.redirectTo({
					url: '../login/login'
				})
			}
			this.getbanner()
			this.getPageInfo()
		},
		onHide() {
			uni.hideToast()
		},
		methods: {
			getPageInfo() {
				this.$http.get('member/getInfo', {}, true).then((res) => {
					console.log(res, '========>获取用户信息');
					this.pageInfo = res
				})
			},
			getbanner() {
				this.$http.get('banner/list/2').then((res) => {
					console.log(res, '========>轮播图数据');
					this.bannerList = res;
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

			goPath(url) {
				uni.navigateTo({
					url: './tools/' + url
				})
			},
			gosetting() {
				uni.navigateTo({
					url: './setting/setting'
				})
			},
			checkUpdata() {
				// #ifdef APP-PLUS
				this.$http.get("appversion/getInfo", {
					equipmentType: (uni.getSystemInfoSync().platform == "android") ? 1 : 2
				}).then(res => {
					if (res.versionNumber) {
						if (this.cpr_version(res.versionNumber, plus.runtime.version)) {
							APPUpdate()
						} else {
							console.log(123);
							this.$refs.uToast.show({
								title: '当前已是最新版本~',
								type: 'default',
								position: 'bottom'
							})
						}
					}
				});
				// #endif
			},

			cpr_version(a, b) {
				var _a = this.toNum(a),
					_b = this.toNum(b);
				if (_a == _b) return false
				if (_a < _b) return false
				if (_a > _b) return true
			},

			toNum(a) {
				var a = a.toString();
				//也可以这样写 var c=a.split(/\./);
				var c = a.split('.');
				var num_place = ["", "0", "00", "000", "0000"],
					r = num_place.reverse();
				for (var i = 0; i < c.length; i++) {
					var len = c[i].length;
					c[i] = r[len] + c[i];
				}
				var res = c.join('');
				return res;
			},

			shareApp() {
				this.shareShow = true
			},
			closeModel() {
				this.shareShow = false
			},


			shareto(type) {
				this.$http.post('cpssystemConfig/getCategoryList', {
					"type": 14
				}, 'application/json').then(res => {
					console.log(res);
					uni.setClipboardData({
						data: res.cvalue,
						success: (ss) => {
							uni.hideToast()
							console.log('success');
							this.closeModel()
							this.$refs.uToast.show({
								title: '复制成功，快去分享吧~',
								type: 'default',
								position: 'bottom'
							})
						}
					});
					
					uni.setStorage({
						key: 'clipboard',
						data: res.cvalue,
						success: res => {
							console.log('succes');
						}
					})
				})
			}
		}
	}
</script>

<style lang="scss">
	.mine-wrapper {
		.topheaderCard-container {
			width: 100%;
			height: 350rpx;

			.headerNavigationbar {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;

				.emptybox {
					width: 35rpx;
					height: 35rpx;
				}

				.pageTitle {
					font-size: 32rpx;
					font-weight: 500;
					color: #FFFFFF;
				}

				.setTing-nav {
					width: 35rpx;
					height: 35rpx;
				}
			}

			.user-container {
				width: 100%;
				margin-top: 25rpx;

				.avatar-box {
					width: 96rpx;
					height: 96rpx;
					border-radius: 50%;
					overflow: hidden;
				}

				.avatar-text {
					font-size: 24rpx;
					font-weight: 400;
					color: #FFFFFF;
					margin-top: 20rpx;
				}
			}
		}

		.advert-container {
			width: 100%;
			height: 140rpx;
			margin-top: 20rpx;
			overflow: hidden;
			padding: 0 32rpx;

			.banerContent {
				width: 100%;
				height: 180rpx;
				overflow: hidden;

				.swiper-items {
					width: 100%;
					height: 100%;
					border-radius: 70rpx;
				}
			}
		}

		.tools-container {
			width: 100%;
			background-color: #FFFFFF;
			padding: 0 32rpx;
			margin-top: 20rpx;

			.tools-title {
				width: 100%;
				height: 110rpx;

				.tools-text {}
			}

			.toolsList {
				width: 100%;
				flex-wrap: wrap;

				.toolsItem {
					width: 33.33%;
					margin-bottom: 35rpx;

					.toolIcon {
						width: 53rpx;
						height: 53rpx;
					}

					.toolTexts {
						font-size: 24rpx;
						font-weight: 500;
						color: #333333;
						margin-top: 16rpx;
					}
				}
			}
		}


		.share-container {
			width: 100%;

			.share-title {
				width: 100%;
				height: 90rpx;
				flex-wrap: wrap;
				border-bottom: 1rpx solid #EFF1F7;

				.title-text {
					font-size: 28rpx;
					font-weight: 500;
					color: #333333;
				}
			}

			.shareList {
				width: 100%;
				flex-wrap: wrap;
				border-bottom: 1rpx solid #EFF1F7;
				margin-top: 45rpx;

				.items-container {
					width: 25%;
					margin-bottom: 30rpx;

					.icon-box {
						width: 95rpx;
						height: 95rpx;
					}

					.modeName {
						font-size: 24rpx;
						font-weight: 500;
						color: #333333;
						margin-top: 15rpx;
					}
				}
			}

			.cancelbox {
				width: 100%;
				height: 90rpx;

				.canceltext {
					font-size: 28rpx;
					font-weight: 500;
					color: #333333;
				}
			}
		}
	}
</style>
