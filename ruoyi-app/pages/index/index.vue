<template>
	<view class="index-wrapper wrapperLayer borderBox">
		<view class="fixed-container colCen borderBox" :style="'background:'+ (categoryCurrent>0?'#EE1B14':(scrollTop>30?'#EE1B14;':bannerColor) +';')">
			<view class="topbarbox"></view>
			<view class="headerSearch-container rowCenBet borderBox">
				<view class="leftgoSearchbox rowCen borderBox" @click="goPath('search')">
					<view class="searchicon rowCenCen iconfont">
						<view>&#xe616;</view>
					</view>
					<view class="hotSearchbox rowCenCen">
						<view>输入商品名或粘贴宝贝标题搜索</view>
					</view>
				</view>
				<view class="rightgoMsg rowCenCen iconfont" @click="goPath('officialNotice')">
					<view>&#xe6e9;</view>
				</view>
			</view>

			<view class="categoryNavbar-container rowCenBet">
				<scroll-view class="categoryScroll" scroll-x scroll-with-animation @scroll="rowscroll" :scroll-into-view="nowcurrentid" :scroll-left="scrollleftnum">
					<block v-for="(items,index) in categoryList" :key='index'>
						<view class="category-container">
							<view class="category-items colCenCen" @click="cateChange(index)" :id="categoryCurrent==index?'category-items-active':''" :class="categoryCurrent==index?'category-items-active':''">
								<view class="categoryname">
									{{items.cname}}
								</view>
								<view class="bottom-border"></view>
							</view>
						</view>
					</block>
				</scroll-view>

				<view class="category-icon-box rowCenCen" @click="showCateModel()">
					<view class="iconfont">&#xe618;</view>
				</view>
			</view>
		</view>
		<!-- 弹框 -->
		<view class="categoryModel-wrapper" @touchmove.prevent>
			<view class="shadow" :class="cateModel?'showShadow':''" @click="closeModel()"></view>
			<view class="category-content" :style="'top:'+Topheight+'px'" :class="cateModel?'showcate':''">
				<view class="catelist-box colCen borderBox" v-if="cateModel">
					<view class="titlebar rowCen">
						<view>选择分类</view>
					</view>

					<view class="list-container borderBox rowCen">
						<block v-for="(items,index) in categoryList" :key='index'>
							<view class="cate-items colCen" v-if="index!=0" @click="changeCurrent(index,items.cid)">
								<view class="picbox defIcon">
									<image :src="items.cpic" mode="aspectFill" :lazy-load="true"></image>
								</view>
								<view class="catename">
									{{items.cname}}
								</view>
							</view>
						</block>
					</view>
				</view>
			</view>
		</view>

		<view class="body-container colCen borderBox">
			<swiper class="pageSwiper" :disable-touch='canswiper' duration="200" :current='categoryCurrent' @change='changeCatepage' @transition='swipering' @animationfinish='stopswiper'>
				<swiper-item v-for="(items,index) in categoryList" :key='index' :current-item-id='items.cid'>
					<view v-if='index==0'>
						<indexPage ref='indexPage' :canrefush='canrefush' :fixedClass='fixedClass' @scrolltoTop='scrolltoTop' @scrolltoview='scrolltoview'
						 @pushfixed='getfixed' @scrollNum='getScroll' :Topheight='Topheight' @passColor='getColor'></indexPage>
					</view>
					<view v-else>
						<categoryPage v-if="index==categoryCurrent+1 || index==categoryCurrent-1 || index==categoryCurrent" :parentId='items.cid'
						 :Topheight='Topheight' :canrefush='canrefush' :canload='index==categoryCurrent'>
						</categoryPage>
					</view>
				</swiper-item>
			</swiper>
		</view>
	</view>
</template>

<script>
	import indexPage from '../../components/indexPage.vue';
	import categoryPage from '../../components/categoryPage.vue';
	export default {
		components: {
			indexPage,
			categoryPage
		},
		data() {
			return {
				shareShow: false,
				bannerColor: '',
				cateModel: false,
				Topheight: 0,
				categoryCurrent: 0,
				current: 1,
				scrollTop: 0,
				fixedClass: false,
				canrefush:true,
				categoryList: [],
				canswiper:false,
				scrollleftnum:0,
				rowLeft:0,
				nowcurrentid:''
			}
		},
		onLoad() {
			this.getCategoryList();
		},
		onShow() {
			if(this.categoryList){
				this.getCategoryList();
			}
		},
		onReady() {
			this.getTopheight()
		},
		watch: {},
		methods: {
			rowscroll(e){
				console.log(e);
				this.rowLeft = e.scrollLeft
			},
			currentscroll(left){
				this.nowcurrentid = ''
				this.scrollleftnum = this.rowLeft
				this.$nextTick(()=>{
					this.nowcurrentid = 'category-items-active'
				})
			},
			getCategoryList() {
				this.$http.post('tb/getTopClass', {
					ctype: 1,
					parentId: 0
				}, 'application/json').then((res) => {
					console.log(res, '========>首页顶部商品分类栏');
					var obj = {}
					obj.cname = '推荐';
					obj.cid = 0;
					obj.ctype = 0;
					this.categoryList = res;
					this.categoryList.unshift(obj);
				})
			},

			// 页面样式处理
			getColor(color) {
				this.bannerColor = color;
			},

			getfixed(e) {
				this.fixedHeight = e
			},

			changeCurrent(idx, cid) {
				this.categoryCurrent = idx
				this.canrefush = true
				this.closeModel()
			},

			scrolltoview() {
				this.scrollindex = this.scrollTop
				this.$nextTick(() => {
					this.scrollindex = this.fixedHeight - (this.Topheight)
				});
			},

			scrolltoTop() {
				this.scrollindex = 0
			},

			scrollmorePage() {
				if (this.categoryCurrent == 0) {
					this.$refs.indexPage[0].getNextPage()
				}
			},
			
			swipering(){
				this.canrefush = false
			},
			
			stopswiper(){
				this.canrefush = true
			},

			// 路由跳转
			goPath(url) {
				if (url == 'search') {
					uni.navigateTo({
						url: '../search/search'
					})
				} else if (url == 'officialNotice') {
					uni.navigateTo({
						url: './officialNotice'
					})
				}
			},

			gobanurl(info) {
				console.log(info);
				if (info.urlType == '0') {
					uni.navigateTo({
						url: '../webView/webView?url=' + info.url
					})
				} else if (info.urlType == 1) {
					console.log(info.murl);
					uni.navigateTo({
						url: info.murl
					})
				}
			},

			showCateModel() {
				this.cateModel = !this.cateModel
			},
			closeModel() {
				this.cateModel = false
			},
			changeCatepage(e) {
				// 滑动切换
				console.log(e);
				this.bannerColor = '#EE1B14'
				this.categoryCurrent = e.detail.current
				this.currentscroll()
			},
			cateChange(idx) {
				// 分类点击
				this.closeModel()
				this.categoryCurrent = idx
			},
			getTopheight() {
				// 获取顶部高度
				uni.createSelectorQuery().in(this).select('.fixed-container').boundingClientRect(data => {
					console.log("得到布局位置信息" + JSON.stringify(data));
					this.Topheight = data.height
				}).exec();
			},

			goDetail(info) {
				console.log(info);
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			},

			getScroll(e) {
				this.scrollTop = e
			},

			gotik(e) {
				uni.navigateTo({
					url: '../active/tiktoklist'
				})
			}
		}
	}
</script>

<style lang="scss">
	.index-wrapper {
		height: 100vh;
		overflow: hidden;

		.body-container {
			width: 100%;

			.pageSwiper {
				width: 100%;
				overflow: hidden;
				height: 100vh;

				.swiper-scroll {
					width: 100%;
					overflow: hidden;
					height: 100vh;
				}
			}
		}

		.fixed-container {
			width: 100%;
			position: fixed;
			top: 0;
			left: 0;
			padding: 0 32rpx;
			z-index: 600;
			background-color: #EE1B14;
			// transition: all 0.5s;

			.headerSearch-container {
				width: 100%;
				height: 100rpx;
				z-index: 100;

				.leftgoSearchbox {
					width: 615rpx;
					height: 70rpx;
					background-color: #FFFFFF;
					border: 1rpx solid #EDEDED;
					border-radius: 35rpx;

					.searchicon {
						width: 28rpx;
						height: 28rpx;
						margin-left: 20rpx;
						font-size: 30rpx;
						font-weight: 400;
						color: #999999;
					}

					.hotSearchbox {
						font-size: 28rpx;
						font-weight: 400;
						color: #999999;
						margin-left: 18rpx;
					}
				}

				.rightgoMsg {
					width: 40rpx;
					height: 40rpx;
					font-size: 50rpx;
					color: #FFFFFF;
				}
			}

			.categoryNavbar-container {
				width: 100%;
				height: 80rpx;

				.categoryScroll {
					width: 640rpx;
					height: 60rpx;
					white-space: nowrap;
					display: flex;

					.category-container {
						display: inline-block;

						.category-items {
							margin-right: 30rpx;

							.categoryname {
								font-size: 28rpx;
								font-weight: 400;
								color: #FFFFFF;
							}

							.bottom-border {
								display: none;
								background-color: #FFFFFF;
								width: 65rpx;
								height: 4rpx;
								border-radius: 1rpx;
								margin-top: 5rpx;
							}
						}

						.category-items-active {
							.categoryname {
								font-size: 32rpx;
								font-weight: 400;
								color: #FFFFFF;
							}

							.bottom-border {
								display: block;
							}
						}
					}
				}

				.category-icon-box {
					width: 32rpx;
					height: 32rpx;
					color: #FFFFFF;
					font-size: 32rpx;
					margin-bottom: 10rpx;
				}
			}
		}

		.categoryModel-wrapper {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 100;

			.shadow {
				display: none;
			}

			.showShadow {
				width: 100%;
				height: 100vh;
				display: block;
				background: rgba(0, 0, 0, 0.3);
			}

			.category-content {
				width: 100%;
				background-color: #FFFFFF;
				border-bottom-left-radius: 24rpx;
				border-bottom-right-radius: 24rpx;
				z-index: 600;
				position: absolute;
				max-height: 0vh;

				.catelist-box {
					width: 100%;

					.titlebar {
						width: 100%;
						height: 60rpx;
						font-size: 24rpx;
						font-weight: 500;
						color: #333333;
						padding: 0 32rpx;
					}

					.list-container {
						width: 100%;
						margin-top: 30rpx;
						padding: 0 5rpx;
						flex-wrap: wrap;

						.cate-items {
							width: 185rpx;
							margin-bottom: 40rpx;

							.picbox {
								width: 95rpx;
								height: 95rpx;
							}

							.catename {
								font-size: 24rpx;
								font-weight: 400;
								color: #333333;
								margin-top: 20rpx;
							}
						}
					}
				}
			}

			.showcate {
				transition: all 0.5s;
				max-height: 100vh;
			}
		}
	}
</style>
