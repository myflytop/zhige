<template>
	<view class="">
		<u-navbar title-color="#fff" back-icon-color="#ffffff" :is-fixed="isFixed" :is-back="isBack"
			:background="background" :back-icon-name="backIconName">
			<view class="slot-wrap" v-if="useSlot">
				<view class="search-wrap" v-if="search">
					<!-- 如果使用u-search组件，必须要给v-model绑定一个变量 -->
					<u-search v-model="keyword" action-text="搜索" :animation="true" :show-action="true" height="71"
						:action-style="{color: '#fff'}">
					</u-search>
				</view>
			</view>
		</u-navbar>
		<view class="zg-taoType">
			<u-form :model="model">
				<u-form-item prop="payType" label-width="150">
					<u-radio-group v-model="model.taoType" @change="taoTypeChange">
						<u-radio shape="circle" v-for="(item, index) in radioList" :key="index" :name="item.taoType">
							{{ item.name }}
						</u-radio>
					</u-radio-group>
				</u-form-item>
			</u-form>
		</view>
		<view class="zg-taoSort">
			<u-table bgColor="#fff">
				<u-tr class="u-tr">
					<u-th class="u-th">
						<view> 价格<u-icon name="arrow-up-fill"></u-icon>
						</view>
					</u-th>
					<u-th class="u-th">销量</u-th>
					<u-th class="u-th">幅度</u-th>
					<u-th class="u-th">剩余</u-th>
				</u-tr>

			</u-table>
		</view>
		<view class="zg-index-list">
			<view class="np-goods" v-for="(item,index) in zgGoodsList" :key="index">
				<view class="np-one-col-goods" @click="navTo(index)">
					<view class="np-goods-image-box">
						<image :lazy-load="true" class="np-goods-img" :src="item.shopImage" mode="aspectFill"></image>
					</view>
					<view class="np-goods-right-box">
						<view class="np-goods-price-box">
							<view class="np-goods-coupon-price">
								<text>{{item.shopPrice-item.couponPrice}}</text>

								<text class="np-price-first">卷后价</text>
							</view>
							<view class="np-goods-money-box">
								<view class="np-money-item" v-if="item.couponPrice">
									<text class="np-money-item-left">券</text>
									<text class="np-money-item-right">{{item.couponPrice}}元</text>
								</view>
							</view>
							<view class="np-goods-footer">
								<view class="np-goods-shop">
									<text>{{item.shopName}}</text>
								</view>
								<view class="np-goods-sales">
									<text>{{item.shopSales + '人付款'}}</text>
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
		<view class="wrap">
			<u-back-top :scroll-top="scrollTop"></u-back-top>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				scrollTop: 0,
				showTip: true,
				zgGoodsList: [],
				backIconName: 'nav-back',
				useSlot: true,
				background: {
					'background-color': '#02553c'
				},
				isBack: true,
				search: true,
				custom: false,
				isFixed: true,
				keyword: '',

				radioList: [{
						name: '不限',
						checked: false,
						disabled: false,
						taoType: 0
					},
					{
						name: '淘宝',
						checked: true,
						disabled: false,
						taoType: 1
					},
					{
						name: '京东',
						checked: false,
						disabled: false,
						taoType: 2
					},
					{
						name: '拼多多',
						checked: false,
						disabled: false,
						taoType: 3
					}

				],
				model: {
					taoType: "0",
				}

			}
		},
		onPageScroll(e) {
			this.scrollTop = e.scrollTop;
		},
		onLoad(options) {
			this.keyword = options.keyword;
			this.search();
		},
		computed: {
			slotRightCurrent() {
				return this.slotRight ? 0 : 1;
			}
		},
		methods: {
			taoTypeChange(e) {
				console.log(e);
				this.model.taoType = e;
			},
			search(){
				
			}

		}
	}
</script>

<style lang="scss" scoped>
	/deep/.u-action {
		color: #fff;
	}

	.u-th {
		background-color: #fff;
		border: none;
	}

	.zg-taoType {
		padding: 10rpx;
	}




	.wrap {
		padding: 24rpx;
	}

	.navbar-right {
		margin-right: 24rpx;
		display: flex;
	}

	.search-wrap {
		margin: 0 20rpx;
		flex: 1;
	}

	.right-item {
		margin: 0 12rpx;
		position: relative;
		color: #ffffff;
		display: flex;
	}

	.message-box {}

	.slot-wrap {
		display: flex;
		align-items: center;
		flex: 1;
	}

	.map-wrap {
		display: flex;
		align-items: center;
		padding: 4px 6px;
		background-color: rgba(240, 240, 240, 0.35);
		color: #fff;
		font-size: 22rpx;
		border-radius: 100rpx;
		margin-left: 30rpx;
	}

	.map-wrap-text {
		padding: 0 6rpx;
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
		margin-left: 20rpx;
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
		justify-content: flex-end;
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
		margin-left: 10rpx;
		background-color: #1cbbb4;
		color: #FFFFFF;
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
</style>
