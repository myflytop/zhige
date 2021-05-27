<template>
	<view class="zg-goods-list-Box">
		<view class="zg-goods-list">
			<view class="np-goods" v-for="(item,index) in goodsList" :key="index">
				<view class="np-one-col-goods" @click="navTo(index)">
					<view class="np-goods-image-box">
						<image :lazy-load="true" class="np-goods-img" :src="item.image" mode="aspectFill"></image>
					</view>
					<view class="np-goods-right-box">
						<view class="np-goods-title more-line">
							<text v-for="(item,index) in item.tags" :key="index" class="np-goods-tag"
								:class="item.color ? 'bg-' + item.color : 'bg-red'">{{item.name}}</text>
							<text class="pd-left">{{item.title}}</text>
						</view>
						<view class="np-goods-tip one-line" v-if="showTip && item.tip.length > 0">
							<text v-for="(item,index) in item.tip" :key="index" class="np-goods-tip-margin"
								:class="item.color ? 'text-' + item.color : ''">{{item.name}}</text>
						</view>
						<slot name="sell"></slot>
						<view class="np-goods-price-box">
							<view class="np-goods-coupon-price">
								<text>{{item.coupon_price}}</text>
								<slot name="price"></slot>
								<text class="np-price-first" v-if="item.price_name">{{item.price_name}}</text>
							</view>
							<view class="np-goods-money-box">
								<view class="np-money-item" v-if="item.coupon_quan">
									<text class="np-money-item-left">券</text>
									<text class="np-money-item-right">{{item.coupon_quan}}元</text>
								</view>
								<view class="np-money-item" v-if="item.coupon_tags_name">
									<text class="np-money-item-left">{{item.coupon_tags_name}}</text>
									<text class="np-money-item-right">{{item.coupon_tags_price + '元'}}</text>
								</view>
							</view>
							<view class="np-goods-footer">
								<view class="np-goods-shop">
									<text>{{item.shop_name}}</text>
								</view>
								<view class="np-goods-sales">
									<text>{{item.sales + '人付款'}}</text>
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
		<view class="zg-backTop">
			<u-back-top :scroll-top="scrollTop"></u-back-top>
		</view>
	</view>
</template>

<script>
	export default {
		name: "zg-goods-list",
		data() {
			return {

			};
		}
	}
</script>

<style>

</style>
