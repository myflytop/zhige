<template>
	<view class="zeroRules-wrapper wrapperLayer">
		<view class="topbarbox"></view>
		<view class="fixed-container colCen" :style="'background:rgba(255,255,255,'+ (scrollTop/100) +');'">
			<view class="topbarbox"></view>
			<view class="headerBar-container rowCenBet">
				<view class="leftimgbox rowCen" @tap="back()">
					<view class="shadow rowCenCen">
						<view class="iconfont" :style="'color:' + ((scrollTop/100)>0.5?'#222222;':'#ffffff;')">&#xe630;</view>
					</view>
				</view>
				<view class="titleBox rowCen" :style="'color:'+ ((scrollTop/100)>0.5?'#222222;':'#ffffff;')">
					活动规则
				</view>
				<view class="rightEmpty">
				</view>
			</view>
		</view>

		<view class="pgaeContent-contained colCen borderBox">
			<view class="contentbox" v-html="pageContent"></view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				pageContent: '',
				scrollTop:''
			}
		},
		onLoad() {
			this.getdata()
		},
		onPageScroll(e) {
			this.scrollTop = e.scrollTop
		},
		methods: {
			back(){
				uni.navigateBack({
					delta:1
				})
			},
			getdata() {
				this.$http.get('agreement/list/3').then((res) => {
					console.log(res, '========>信息');
					this.pageContent = res.content
				})
			}
		}

	}
</script>

<style lang="scss">
	.zeroRules-wrapper {
		width: 100%;
		min-height: 100vh;
		background: #FF2447;

		.fixed-container {
			width: 100%;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 110;

			.headerBar-container {
				width: 100%;
				height: 90rpx;
				padding: 0 32rpx;

				.rightEmpty {
					width: 32rpx;
					height: 32rpx;
				}
			}
		}

		.pgaeContent-contained {
			width: 100%;
			margin-top: 90rpx;
			padding: 34rpx 30rpx;

			.contentbox {
				width: 100%;
				border-radius: 20rpx;
				padding: 20rpx 24rpx;
				background-color: #FFFBF0;
			}
		}
	}
</style>
