<template>
	<view class="cancellation-wrapper wrapperLayer">
		<titleBar :titleText='"注销帐号"' :pageForm='"accointSecurity"'></titleBar>
		<view class="pageContent-container colCen borderBox">
			<view class="phoneInfo">
				请注意，将{{account}}帐号注销后
			</view>
			<view class="tips">
				以下信息将被清空且无法找回
			</view>
			<view class="info-container colCen borderBox">
				<view class="info-items rowCen">
					<view class="circle"></view>
					<view class="info-text">
						帐号、身份信息
					</view>
				</view>
				<view class="info-items rowCen">
					<view class="circle"></view>
					<view class="info-text">
						收藏、浏览记录
					</view>
				</view>
				<view class="info-items rowCen">
					<view class="circle"></view>
					<view class="info-text">
						个人隐私信息
					</view>
				</view>
				<view class="info-items rowCen">
					<view class="circle"></view>
					<view class="info-text">
						帐号内预估可获得和已获得的收益
					</view>
				</view>
			</view>

			<view class="tips">
				请确保所有交易已完结且无纠纷，帐号注销后无法再登陆
			</view>
			<view class="tips" style="color: #d21136; margin-top: 10rpx;">
				帐号注销后，历史交易产生的收益等权益视为自动放弃
			</view>

			<view class="btn-container rowCenBet">
				<view class="cancellationBtn rowCenCen" @click="openModel()">
					<view>
						注销帐号
					</view>
				</view>
				<view class="uncancelBtn rowCenCen" @click="goback()">
					<view>
						暂不注销
					</view>
				</view>
			</view>
		</view>


		<!-- 模态窗 -->
		<u-popup v-model="showModel" mode="center" closeable border-radius="10" width="auto" height="auto">
			<view class="model-wrapper colCen borderBox">
				<view class="titlebar rowCenCen">
					<view class="modelTitle">
						注销验证
					</view>
				</view>
				<view class="subform colCen">
					<view class="acount-Bar rowCen">
						<view class="user defIcon">
							<image src="../../../static/images/mine/tools/userName.png"></image>
						</view>
						<view class="tishitext">{{account}}</view>
					</view>

					<view class="code-Bar rowCenBet">
						<view class="leftinput rowCen">
							<view class="code defIcon">
								<image src="../../../static/images/mine/tools/pass.png"></image>
							</view>
							<view class="codebox"><input type="text" placeholder="验证码" placeholder-class='inputpla'></view>
						</view>
						<view class="rightsendbtn">
							{{btnstates}}
						</view>
					</view>
				</view>
				
				<view class="confirmBtn rowCenCen">
					<view>确认注销</view>
				</view>
			</view>
		</u-popup>
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
				showModel: false,
				account: '185****3903',
				btnstates:'获取验证码'
				
			}
		},
		methods: {
			goback() {
				uni.navigateBack({
					delta: 1
				})
			},
			openModel(type) {
				this.showModel = true;
			},

			confirm() {
				if (this.modelType == 'clean') {
					this.getStorageSize();
					this.modelType = '';
					this.content = '';
					uni.clearStorage();
					this.showModel = false;
				} else if (this.modelType == 'logout') {
					this.showModel = false;
				}
			},
		}
	}
</script>

<style lang="scss">
	.cancellation-wrapper {
		width: 100%;

		.pageContent-container {
			width: 100%;
			padding: 0 32rpx;

			.phoneInfo {
				width: 100%;
				margin-top: 40rpx;
				font-size: 28rpx;
				font-weight: 500;
				color: #333333;
			}

			.tips {
				width: 100%;
				margin-top: 25rpx;
				font-size: 22rpx;
				font-weight: 500;
				color: #999999;
			}

			.info-container {
				width: 100%;
				background-color: #FFFFFF;
				border-radius: 20rpx;
				margin-top: 20rpx;
				padding: 20rpx 40rpx;

				.info-items {
					width: 100%;
					height: 60rpx;

					.circle {
						width: 8rpx;
						height: 8rpx;
						border-radius: 50%;
						background-color: #DCDCDC;
					}

					.info-text {
						font-size: 28rpx;
						font-weight: 500;
						color: #333333;
						margin-left: 15rpx;
					}
				}
			}

			.btn-container {
				width: 100%;
				margin-top: 40rpx;

				.cancellationBtn {
					width: 320rpx;
					height: 80rpx;
					background: #CCCCCC;
					border-radius: 40rpx;
					font-size: 28rpx;
					font-weight: 500;
					color: #FFFFFF;
				}

				.uncancelBtn {
					width: 320rpx;
					height: 80rpx;
					background: linear-gradient(-81deg, #AD62FD, #563CF7);
					border-radius: 40rpx;
					font-size: 28rpx;
					font-weight: 500;
					color: #FFFFFF;
				}
			}
		}

		.model-wrapper {
			width: 500rpx;
			background-color: #FFFFFF;
			border-radius: 10rpx;
			padding: 0 52rpx;

			.modelTitle {
				margin-top: 60rpx;
				font-size: 28rpx;
				font-weight: 500;
				color: #333333;
			}

			.subform {
				width: 100%;
				margin-top: 50rpx;

				.acount-Bar {
					width: 100%;

					.user {
						width: 24rpx;
						height: 26rpx;
						margin-right: 30rpx;
					}
				}

				.code-Bar {
					width: 100%;
					margin-top: 50rpx;

					.leftinput {
						.code {
							width: 24rpx !important;
							height: 28rpx;
							margin-right: 30rpx;
						}

						.codebox {
							input{
								width: 200rpx;
								font-size: 28rpx;
							}
						}
						.inputpla{
							font-size: 24rpx;
							font-weight: 400;
							color: #999999;
						}
					}
					
					.rightsendbtn{
						white-space: nowrap;
						font-size: 24rpx;
						font-weight: 500;
						color: #5E46DC;
					}
				}
			}
			
			.confirmBtn{
				width: 240rpx;
				height: 56rpx;
				background: linear-gradient(-77deg, #9D46F5, #6741F9);
				border-radius: 28rpx;
				font-size: 24rpx;
				font-weight: 500;
				color: #FFFFFF;
				margin-top: 60rpx;
				margin-bottom: 30rpx;
			}
		}
	}
</style>
