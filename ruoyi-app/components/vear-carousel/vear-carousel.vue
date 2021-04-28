<template>
	<swiper class="image-container" previous-margin="45rpx" next-margin="45rpx" circular autoplay @change="swiperChange">
		<swiper-item :class="currentIndex == index ? 'swiper-item' : 'swiper-item-side'" v-for="(item, index) in imgList"
		 :key="item[urlKey]">
			<view class="contentbox" :class="currentIndex == index ? 'item-img' : 'item-img-side'">
				<view class="imagebox defIcon" @click="clickImg(item)">
					<image :src="item.articleBanner" :lazy-load="true" mode="aspectFill"></image>
				</view>
				<view class="bottom-title">
					<view>
						{{item.shortTitle}}
					</view>
				</view>

				<view class="absbox">
					<view class="memberbox">
						{{item.itemNum}}
					</view>
					<view class="danpin">
						单品
					</view>
					<view class="smallpic">
						<image :src="item.image" mode="aspectFill" :lazy-load="true"></image>
					</view>
				</view>
			</view>
		</swiper-item>
	</swiper>
</template>
<script>
	export default {
		props: {
			imgList: {
				type: Array,
				default () {
					return []
				}
			},
			urlKey: {
				type: String,
				default () {
					return ''
				}
			},
		},
		data() {
			return {
				currentIndex: 0,
				dontFirstAnimation: true
			}
		},
		methods: {
			swiperChange(e) {
				this.dontFirstAnimation = false
				this.currentIndex = e.detail.current
			},
			clickImg(item) {
				console.log(123);
				this.$emit('selected', item, this.currentIndex)
			}
		}
	}
</script>
<style scoped>
	.image-container {
		width: 750rpx;
		height: 400rpx;
	}

	.contentbox {
		display: flex;
		flex-direction: column;
		align-items: center;
		border-radius: 14rpx;
		overflow: hidden;
		box-shadow: rgba(0, 0, 0, 0.1) 0rpx 10rpx 20rpx -2px;
		animation: to-big .3s;
		position: relative;
	}

	.absbox {
		width: 124rpx;
		height: 230rpx;
		position: absolute;
		right: 32rpx;
		bottom: 32rpx;
		background: rgba(250, 250, 250, .9);
		border-top-left-radius: 6px;
		border-top-right-radius: 30px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.memberbox{
		color: #809def;
		font-weight: 700;
		font-size: 40rpx;
		margin-top: 30rpx;
	}
	
	.danpin{
		color: #809def;
		font-weight: 500;
		font-size: 32rpx;
	}
	
	.smallpic{
		width: 100rpx;
		height: 100rpx;
		border-radius: 16rpx;
		overflow: hidden;
		margin-top: 20rpx;
		image{
			width: 100%;
			height: 100%;
		}
	}

	.item-img {
		width: 630rpx;
		height: 360rpx;
	}

	.imagebox {
		width: 100%;
		height: 250rpx;
	}

	.bottom-title {
		width: 100%;
		height: 110rpx;
		display: flex;
		align-items: center;
		padding: 0 32rpx;
		color: #333333;
	}

	.swiper-item {
		width: 630rpx;
		height: 360rpx;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.item-img-side {
		width: 630rpx;
		height: 320rpx;
		display: flex;
		flex-direction: column;
		align-items: center;
		border-radius: 14rpx;
		animation: to-mini .3s;
	}

	.swiper-item-side {
		width: 630rpx;
		height: 360rpx;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	@keyframes to-mini {
		from {
			height: 360rpx;
		}

		to {
			height: 320rpx;
		}
	}

	@keyframes to-big {
		from {
			height: 320rpx;
		}

		to {
			height: 360rpx;
		}
	}
</style>
