<!-- 首页 -->
<template>
	<view class="zg-content">
		<view class="zg-heard" :style="{background: 'url('+heardImg+')'}">
			<view class="search zg-search">
				<u-navbar :is-back="false" v-model="keyword" :background="navBackground">
					<u-search :show-action="true" action-text="搜索" :animation="true" @search="doSearch"
						@custom="doSearch"></u-search>
					<view class="navbar-right">
						<view class="message-box right-item">
							<u-icon name="grid" size="46" color="#fff"></u-icon>
						</view>
					</view>
				</u-navbar>
				<view class="zg-hotCats">
					<u-tabs bg-color="#798a840f" active-color="#f8f8f8" :font-size="40" :list="zgTags" :is-scroll="true"
						:current="current" @change="change"></u-tabs>
				</view>
			</view>
			<view class="zg-swip">
				<u-swiper :list="zgSwips" :title="swipsTitle" @change="swipChange"></u-swiper>
			</view>
		</view>
		<view class="zg-menus">
			<view class="item-container">
				<view class="thumb-box" v-for="(item1, index1) in zgCats" :key="index1">
					<image class="item-menu-image" :src="item1.catIcon" mode=""></image>
					<view class="item-menu-name">{{item1.catName}}</view>
				</view>
			</view>
		</view>
		<view class="zg-index-list">
			<view class="np-goods" v-for="(item,index) in zgGoodsList" :key="index">
				<view class="np-one-col-goods" @click="navTo(index)">
					<view class="np-goods-image-box">
						<image :lazy-load="true" class="np-goods-img" :src="item.shopImg" mode="aspectFill"></image>
					</view>
					<view class="np-goods-right-box">
						<view class="goods-title-box">		
							<text>{{item.shopName}}</text>
						</view>
						<view class="np-goods-price-box">
							
							<view>
								<text class="np-price-first" >卷后价：</text>	
								<text class="np-goods-coupon-price" >{{item.shopPrice-item.couponPrice}}</text>	
							</view>
							<view class="np-goods-money-box">
								<view class="np-money-item" v-if="item.couponPrice">
									<text class="np-money-item-left">券<text class="np-money-item-right">{{item.couponPrice}}元</text></text>
									
								</view>
							</view>
							<view class="np-goods-footer">
								<view class="np-goods-sales">
									<text>{{item.shopSales + '人付款'}}</text>
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				keyword: '',
				showTip: true,
				heardImg: '',
				navBackground: {
					'background-color': '#02553c'
				},
				swipsTitle: true,
				zgSwips: [],
				zgGoodsList: [],
				zgCats: [],
				zgTags: [],
				current: 0
			}
		},
		onLoad() {
			this.getTags();
			this.getSwips();
			this.getHotCat();
			this.getTaos();

		},
		created() {
		   
		},

		methods: {
			change(index) {
				this.current = index;
			}, //执行搜索
			doSearch(keyword) {
				keyword = this.$u.trim(keyword);
				uni.navigateTo({
					url: "/pages/tao/list/list?keyword=" + keyword
				});
			},
			swipChange(index) {
				this.heardImg = this.zgSwips[index].image;
			},
			getTaos(){		
				this.$http.get('api/taoke/list').then((res) => {
				this.zgGoodsList=res;
				})
			},
			getHotCat() {
				this.$http.get('api/list/cat/2/23').then((res) => {
					console.log(res, '首页：推荐分类');
					let ts = [];
					res.forEach(function(value, index) {
							ts.push({
								'catName': value.catName,
								'catIcon': value.catIcon,
								'catId': value.catId
							});
						
					})
					this.zgCats = ts;
				})
			},
			getSwips() {
				//22为轮播标签
				this.$http.get('api/list/article/tag/24/10').then((res) => {
					console.log(res, '首页:轮播');
					let ts = [];
					res.forEach(function(value, index) {
						ts.push({
							'title': value.articleTitle,
						     'image':value.articleImg,
							'articleId': value.articleId
						});
					})
                     
					 this.heardImg = ts[0].image;
					this.zgSwips = ts;
				})
			},
			getTags() {
				//2推荐标签
				this.$http.get('api/list/tag/type/2/10').then((res) => {
					console.log(res, '首页:标签');
					let ts = [];
					res.forEach(function(value, index) {
						ts.push({
							'name': value.tagName,
							'tagId': value.tagId
						});
					})
					this.zgTags = ts;
				})
			}
		}
	}
</script>

<style>
	/deep/.u-action {
		color: #fff;
	}

	.zg-search {
		padding: 10rpx;
	}

	.zg-swip {
		padding-top: 5rpx;
		padding-left: 10rpx;
		padding-right: 10rpx;
	}

	.item-container {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}

	.thumb-box {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		padding: 5rpx;
		margin-top: 20rpx;
	}

	.item-menu-image {
		width: 120rpx;
		height: 120rpx;
	}

	.np-goods {
		padding: 5rpx 10rpx;
	}

	.np-one-col-goods {
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-radius: 20rpx;
		background: #FFFFFF;
	}

	.np-goods-image-box {
		padding: 10rpx;
		width: 300rpx;
		height: 300rpx;
		overflow: hidden;
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.np-goods-img {
		width: 280rpx;
		height: 280rpx;
		border-radius: 10rpx;
		background-color: #ccc;
	}

	.np-goods-right-box {
		width: 430rpx;
		padding: 15rpx;
		height: 300rpx;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		position: relative;
	}

	.np-goods-title {
		width: 400rpx;
		font-size: 30rpx;
		line-height: 40rpx;
		margin-bottom: 20rpx;
		position: relative;
	}

	.np-goods-tag {
		font-size: 22rpx;
		font-weight: 600;
		padding: 0 8rpx;
		height: 30rpx;
		line-height: 30rpx;
		border-radius: 6rpx;
		margin-right: 5rpx;
		vertical-align: middle;
		position: relative;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		box-sizing: border-box;
		margin-top: -6.09rpx;
	}

	.np-goods-tip {
		width: 400rpx;
		font-size: 24rpx;
		color: #a8700d;
	}

	.np-goods-tip-margin {
		margin-right: 10rpx;
	}

	.np-goods-price-box {
		position: absolute;
		bottom: 15rpx;
	}

	.np-goods-coupon-price {
		font-size: 40rpx;
		font-weight: bold;
		color: #e54d42;
	}

	.np-goods-coupon-price::before {
		content: "¥";
		font-size: 70%;
		margin-right: 4upx;
	}

	.np-goods-sales {
		font-size: 22rpx;
		color: #AAAAAA;
		font-weight: normal;
	}

	.np-goods-money-box {
		display: flex;
		flex-direction: row;
		align-items: center;
	}

	.np-money-item {
		font-size: 18rpx;
		height: 28rpx;
		line-height: 28rpx;
		border-radius: 6rpx;
		border: 1rpx #ff5000 solid;
		color: #ff5000;
		margin-right: 5rpx;
	}

	.np-money-item-left {
		text-align: center;
		padding: 0 6rpx;
		background-color: #fff1eb;
		border-right: 1rpx #ff5000 dotted;
	}

	.np-money-item-right {
		text-align: center;
		padding: 0 6rpx;
	}

	.np-goods-footer {
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
		margin-top: 10rpx;
	}

	.np-goods-shop {
		max-width: 250rpx;
		font-size: 22rpx;
		color: #AAAAAA;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		transition: all linear 0.2s;
	}

	.pd-left {
		padding-left: 5rpx;
	}

	.one-line {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		transition: all linear 0.2s;
	}

	/*多行文本溢出省略号*/
	.more-line {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		transition: all linear 0.2s;
	}

	.np-price-first {
	
		background-color: #1cbbb4;
		color: #FFFFFF;
		font-size: 28rpx;
		font-weight: 600;
	}
</style>
