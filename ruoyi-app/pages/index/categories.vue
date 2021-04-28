<template>
	<view class="officialNotice wrapperLayer">
		<titleBar :titleText='pageTitle' :pageForm='"officialNotice"'></titleBar>
		<view class="sortbar-container rowCenBet borderBox">
			<block v-for="(items,index) in sortList" :key="index">
				<view class="sortItems-container rowCenCen" :class="sortCurrent==index?'sortItems-container-active':''" @click="selectSort(index)">
					<view class="sortname">
						{{items.sortname}}
					</view>
					
					<view class="defIcon directionbox" v-if="index==3">
						<image v-if="sortCurrent!=3 " src="https://cmsstatic.ffquan.cn//wap_new/search/images/sort.svg" mode=""></image>
						<block v-else>
							<image v-if="priceUp" src="https://cmsstatic.ffquan.cn//wap_new/search/images/asce.svg" mode=""></image>
							<image v-else src="https://cmsstatic.ffquan.cn//wap_new/search/images/desc.svg" mode=""></image>
						</block>
					</view>
				</view>
			</block>
		</view>
		<view class="bottomGoodslist-container colCen borderBox">
			<view class="colCen borderBox goodsList-container">
				<view class="listbox colCen borderBox">
					<block v-for="(items,index) in goodsList" :key="index">
						<view class="goods-items-container rowCen borderBox" @tap="godetails(items)">
							<view class="left-imagecontent defIcon">
								<image :src="items.mainPic" mode="aspectFill"></image>
							</view>
		
							<view class="right-goodsinfo-container colCen borderBox">
								<view class="goodsnameinfo-content rowCen">
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
										{{items.storename}}
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
					<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999"></aLoadMore>
				</view>
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
	import titleBar from '../../components/backTitlebar.vue';
	export default {
		components: {
			titleBar
		},
		data(){
			return{
				cid:'',
				priceUp: false,
				sortCurrent:0,
				pageTitle:'',
				sortType:0,
				sortList: [{
						sortname: '人气',
						type: 'mood'
					},
					{
						sortname: '最新',
						type: 'newest'
					},
					{
						sortname: '销量',
						type: 'salesvolume'
					},
					{
						sortname: '价格',
						type: 'price'
					}
				],
				goodsList: [],
				
				canloadmore:false,
				loadstatus:'loading',
				currentPage:1
			}
		},
		onLoad(options) {
			if(options){
				this.cid = options.cid
				this.pageTitle = options.title
			}
			this.getGoodsList()
		},
		onReachBottom() {
			if(this.canloadmore){
				this.getGoodsList()
			}
		},
		methods:{
			getGoodsList() {
				this.$http.post('tb/getGoodsList', {
					subcid: this.cid,
					pageId: this.currentPage,
					pageSize: 10,
					sort: this.sortType,
				}, 'application/json').then((res) => {
					console.log(res, '========>获取底部分类');
					uni.stopPullDownRefresh()
					if (res.goodsList.length < 10) {
						this.loadstatus = 'nomarl'
						this.canloadmore = false
					} else {
						this.loadstatus = 'loading'
						this.canloadmore = true
						this.currentPage++
					}
					this.goodsList = this.goodsList.concat(res.goodsList);
				})
			},
			
			selectSort(idx) {
				this.sortCurrent = idx
				this.currentPage = 1
				this.goodsList = []
				if (idx != 3) {
					if (idx != this.sortType) {
						this.sortType = idx;
					}
				} else {
					this.priceUp = !this.priceUp;
					if (this.priceUp) {
						console.log('true');
						this.sortType = 6
					} else {
						this.sortType = 5
					}
				}
				this.$nextTick(() => {
					this.getGoodsList();
				})
			},
			
			// scrollmorePage() {
			// 	this.$http.post('tb/getGoodsList', {
			// 		cids: this.parentId,
			// 		pageId: this.currentPage,
			// 		pageSize: 10,
			// 		sort: this.sortType,
			// 	}, 'application/json').then((res) => {
			// 		console.log(res, '========>获取底部分类');
			// 		if (res.goodsList.length < 10) {
			// 			this.loadstatus = 'nomarl'
			// 			this.canloadmore = false
			// 		} else {
			// 			this.loadstatus = 'loading'
			// 			this.canloadmore = true
			// 			this.currentPage++
			// 		}
			// 		if (this.currentPage > 1) {
			// 			this.goodsList = this.goodsList.concat(res.goodsList)
			// 		} else {
			// 			this.goodsList = res.goodsList;
			// 		}
			// 	})
			// },
			
			godetails(info){
				console.log(info);
				uni.navigateTo({
					url: '../goods/goodsDetail?info=' + encodeURIComponent(JSON.stringify(info))
				})
			}
		},
		onPullDownRefresh() {
			this.currentPage = 1
			this.goodsList = []
			this.getGoodsList()
		}
	}
</script>

<style lang='scss'>
	.officialNotice{
		width: 100%;
		.sortbar-container {
			z-index: 10;
			position: fixed;
			left: 0;
			width: 100%;
			height: 100rpx;
			background-color: #FFFFFF;
			padding: 0 50rpx;
			border-top: 1rpx solid #F0F1F7;
				
			.sortItems-container {
				width: 90rpx;
				
				.sortname {
					font-size: 24rpx;
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
		}
		.bottomGoodslist-container {
			width: 100%;
			background-color: #FFFFFF;
			margin-top: 120rpx;
		
			.goodsList-container {
				width: 100%;
		
				.listbox {
					width: 100%;
		
					.goods-items-container {
						width: 100%;
						height: 240rpx;
						padding: 0 32rpx;
						border-top: 1rpx solid #F0F1F7;
		
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
									margin-top: 4rpx;
								}
								
								.tradename{
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
							
							.saleNum-content{
								width: 100%;
								font-size: 20rpx;
								font-weight: 400;
								line-height: 34rpx;
								color: #999999;
								margin-top: 10rpx;
							}
							
							.shopEnter-bar{
								width: 100%;
								.storename{
									font-size: 20rpx;
									font-weight: 400;
									color: #999999;
								}
								.enterbtn{
									.enterStore{
										font-size: 20rpx;
										font-weight: 400;
										color: #333333;
										margin:0 5rpx;
									}
									.arrow{
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
</style>
