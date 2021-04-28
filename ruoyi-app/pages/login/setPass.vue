<template>
	<view class="login-wrapper wrapperLayer colCen">
		<titleBar titleText='' :pageForm='"loginPage"' @backIndex="backHome"></titleBar>
		<view class="pageContent borderBox colCen">
			<view class="titleText">
				设置密码
			</view>
<!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
			<view class="input-container colCen">
				<view class="outSidebox rowCenBet" data-type='pass' :class="selectedInput=='pass'?'outSidebox-active':''">
					<input @focus="changeType" @blur="cleanActive" @confirm="setPass" data-type='pass' type="text" password v-model="pass"
					 placeholder="请输入密码" placeholder-class="input-placeHolder" />
				</view>
			</view>
			<view class="txtTips">
				密码由8-16个字符组成。必须包含字母和数字两种类型。
			</view>

			<view class="login-btn rowCenCen" :class="pass?'colorfulbtn':''" @click="setPass()">
				<view class="btn-font">
					完成
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import titleBar from '../../components/backTitlebar.vue'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				pass: '',
				selectedInput: ''
			};
		},
		onLoad() {
		},
		methods: {
			backHome(){
				uni.switchTab({
					url:'../index/index'
				})
			},
			changeType(e) {
				this.selectedInput = e.target.dataset.type
			},
			cleanActive() {
				this.selectedInput = ''
			},
			setPass() {
				var str = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
				if (str.test(this.pass)) {
					this.$http.post('member/updateMember', {
						pwd: this.pass
					}, 'application/json',true).then((res) => {
						uni.switchTab({
							url:'../mine/mine'
						})
					})
				} else {
					uni.showToast({
						title: '密码不符合要求，请输入8~16位的数字与字母的组合',
						icon: 'none',
						position: 'bottom',
						duration: 3000
					});
				}
			}
		}
	};
</script>

<style lang="scss">
	.login-wrapper {
		width: 100%;
		min-height: 100vh;
		background-color: #FFFFFF;

		.pageContent {
			width: 100%;
			padding: 0 60rpx;

			.titleText {
				width: 100%;
				font-size: 42rpx;
				font-weight: bold;
				color: #333333;
				margin: 60rpx 0;
			}

			.input-container {
				width: 100%;
				margin-bottom: 20rpx;

				.outSidebox {
					width: 100%;
					height: 85rpx;
					border-bottom: 2rpx solid #F1F1F1;

					.input-placeHolder {
						font-size: 34rpx;
						font-weight: 500;
						color: #CACACA;
					}

					input {
						font-size: 34rpx;
						font-weight: 500;
						color: #222222;
					}

					.hidepass {
						font-size: 32rpx;
						font-weight: 800;
						color: #CACACA;
					}

					.getcodebox {
						font-size: 28rpx;
						white-space: nowrap;
						font-weight: 400;
						color: #FF2851;
						pointer-events: none;
					}

					.colorTxt {
						pointer-events: auto;
					}
				}

				.outSidebox-active {
					border-bottom: 2rpx solid #FF2851;
				}
			}

			.txtTips {
				font-size: 26rpx;
				font-weight: 400;
				color: #999999;
				line-height: 38rpx;
			}

			.login-btn {
				width: 100%;
				height: 86rpx;
				background: #E2E2E2;
				border-radius: 43rpx;
				margin-top: 80rpx;
				pointer-events: none;

				.btn-font {
					font-size: 30rpx;
					font-weight: 500;
					color: #FFFFFF;
				}
			}

			.colorfulbtn {
				background: #FD002F;
				pointer-events: auto;
			}
		}
	}
</style>
