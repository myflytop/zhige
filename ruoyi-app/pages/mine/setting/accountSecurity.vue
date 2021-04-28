<template>
	<view class="accountSecurity-wrapper wrapperLayer borderBox">
		<titleBar :titleText='"账户与安全"' :pageForm='"accointSecurity"'></titleBar>
		<view class="pageContent-container colCen">
			<view class="empower-content colCen">
				<view class="keyvalueBox rowCenBet borderBox" v-if="false">
					<view class="leftKey">
						淘宝授权
					</view>
					<view class="rightvalue rowCen">
						<view class="rightText">
							淘宝授权
						</view>
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
				<view class="keyvalueBox rowCenBet borderBox" @click="bindingZFB()">
					<view class="leftKey">
						支付宝绑定
					</view>
					<view class="rightvalue rowCen">
						<view class="rightText">
							待绑定
						</view>
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
			</view>
			<view class="empower-content colCen" @click="modifyPass()">
				<view class="keyvalueBox rowCenBet borderBox">
					<view class="leftKey">
						修改密码
					</view>
					<view class="rightvalue rowCen">
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
			</view>
			<view class="empower-content colCen">
				<view class="keyvalueBox rowCenBet borderBox" @click="cancellation()">
					<view class="leftKey">
						注销账户<span>（账户注销后无法恢复，请谨慎操作）</span>
					</view>
					<view class="rightvalue rowCen">
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import titleBar from '../../../components/backTitlebar.vue';
	export default {
		components: {
			titleBar
		},
		data() {
			return {

			}
		},
		methods: {
			modifyPass(){
				uni.navigateTo({
					url:'../../login/modifyPass'
				})
			},
			cancellation() {
				uni.navigateTo({
					url: './cancellation'
				})
			},
			bindingZFB() {
				uni.navigateTo({
					url:'./bindingZFB'
				})
			}
		}
	}
</script>

<style lang="scss">
	.pageContent-container {
		width: 100%;
		display: flex;

		.empower-content {
			width: 100%;
			background-color: #FFFFFF;
			margin-top: 20rpx;

			.keyvalueBox {
				width: 100%;
				height: 100rpx;
				border-bottom: 1rpx solid #F2F2F2;
				padding: 0 30rpx;

				.leftKey {
					font-size: 28rpx;
					font-weight: 500;
					color: #333333;

					span {
						font-size: 26rpx;
						font-weight: 500;
						color: #999999;
					}
				}

				.rightvalue {
					.rightText {
						font-size: 24rpx;
						font-weight: 400;
						color: #999999;
						margin-right: 15rpx;
					}

					.arrow-icon {
						width: 10rpx;
						height: 18rpx;
					}
				}
			}
		}
	}
</style>
