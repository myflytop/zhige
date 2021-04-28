<template>
	
	<view class="login-wrapper wrapperLayer colCen">
		<titleBar titleText='' :pageForm='"loginPage"' @backIndex="backHome"></titleBar>
		<view class="pageContent borderBox colCen">
			<view class="titleText">
				欢迎登录
			</view>

			<view class="input-container colCen">
				<view class="outSidebox rowCen" :class="selectedInput=='phone'?'outSidebox-active':''">
					<input type="number" data-type='phone' @focus="changeType" @blur="cleanActive" v-model="phone" placeholder="请输入手机号"
					 placeholder-class="input-placeHolder" />
				</view>
			</view>

			<view class="input-container colCen" v-if="ifPasslogin">
				<view class="outSidebox rowCenBet" data-type='pass' :class="selectedInput=='pass'?'outSidebox-active':''">
					<input @focus="changeType" @blur="cleanActive" data-type='pass' :password="showPass" type="text" v-model="pass"
					 placeholder="请输入密码" placeholder-class="input-placeHolder" />
					<view class="hidepass iconfont" @click="showPassfnc()">
						{{showPass?'&#xe610;':'&#xe60f;'}}
					</view>
				</view>
			</view>

			<view class="input-container colCen" v-else>
				<view class="outSidebox rowCenBet" data-type='pass' :class="selectedInput=='code'?'outSidebox-active':''">
					<input @focus="changeType" @blur="cleanActive" data-type='code' type="number" v-model="code" placeholder="请输入验证码"
					 placeholder-class="input-placeHolder" />
					<view class="getcodebox" :class="canGetCode?'colorTxt':''" @click="getCode()">
						{{canGetCode?'获取验证码':second+'s后重新获取'}}
					</view>
				</view>
			</view>
<!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
			<view class="login-btn rowCenCen" :class="(ifPasslogin?pass:code)&&phone?'colorfulbtn':''" @click="login()">
				<view class="btn-font">
					登录
				</view>
			</view>

			<view class="bottom-fixed colCen">
				<view class="verification-Code" @click="changeWay()">
					{{ifPasslogin?'验证码':'密码'}}登录
				</view>
				<view class="explain-text rowCen">
					<switch type="checkbox" @change="changeread" :checked='isread' style="transform:scale(0.6)"/>
					登陆代表已详细阅读并同意<text @click="goPage('agreement')">《用户协议》</text>和<text @click="goPage('policy')">《隐私政策》</text>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import titleBar from '../../components/backTitlebar.vue'
	import MD5 from '../../utils/md5.js'
	import config from '../../utils/config.js'
	import utils from '../../utils/utils.js'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				ifPasslogin: false,
				pass: '',
				phone: '',
				code: '',
				selectedInput: '',
				isread:false,

				cleanfocus: true,
				showPass: true,
				second: 60,
				canGetCode: true,
				prevent: true
			};
		},
		onLoad() {

		},
		methods: {
			backHome() {
				
				({
					url: '../index/index'
				})
			},
			changeread(e){
				console.log(e);
				this.isread = e.target.value
			},
			login() {
				if(this.isread){
					if (this.ifPasslogin) {
						this.$http.post('member/login', {
							account: this.phone,
							pwd: this.pass
						}, 'application/json', true).then((res) => {
							console.log(res, '========>登录中');
							utils.setCache('userInfo', res)
							getApp().globalData.userInfo = res
							uni.switchTab({
								url: '../index/index'
							});
						})
					} else {
						this.$http.post('member/smsLogin', {
							account: this.phone,
							validateCode: this.code
						}, 'application/json', true).then((res) => {
							console.log(res, '========>登录中');
							utils.setCache('userInfo', res)
							getApp().globalData.userInfo = res
							if (res.isPwd == 'N') {
								uni.redirectTo({
									url: './setPass'
								})
							} else {
								uni.switchTab({
									url: '../index/index'
								})
							}
						})
					}
				}else{
					uni.showToast({
						title:'请先阅读并同意《用户协议》和《隐私协议》',
						icon:"none",
					})
				}
			},

			getCode() {
				if (this.prevent && this.canGetCode) {
					this.prevent = false
					var timerChuo = new Date().getTime()
					this.$http.post('member/getAuthCode', {
						/* 因不可抗力因素，此处代码删减掉了，请自行编写 */
					}, 'application/json', true).then((res) => {
						console.log(res, '========>验证码');
						this.canGetCode = false
						this.prevent = true
						var timer = setInterval(() => {
							this.second--
							if (this.second < 1) {
								this.second = 60
								this.canGetCode = true
								clearInterval(timer)
							}
						}, 1000)
					}).catch(res => {
						this.canGetCode = true
						this.prevent = true
					})
				} else {
					uni.showToast({
						title: '您点的太快了~',
						icon: 'none',
						position: 'bottom',
						duration: 3000
					});
				}
			},

			showPassfnc() {
				this.showPass = !this.showPass
			},


			changeType(e) {
				this.selectedInput = e.target.dataset.type
			},
			cleanActive() {
				this.selectedInput = ''
			},

			changeWay() {
				this.ifPasslogin = !this.ifPasslogin
			},

			goPage(type) {
				uni.navigateTo({
					url: './policyAgreement?type=' + type
				})
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

			.bottom-fixed {
				width: 100%;
				position: fixed;
				bottom: 100rpx;
				bottom: calc(100rpx + constant(safe-area-inset-bottom));
				bottom: env(100rpx + constant(safe-area-inset-bottom));
				left: 0;
				z-index: 1;

				.verification-Code {
					white-space: nowrap;
					font-size: 28rpx;
					font-weight: 500;
					color: #333333;
				}

				.explain-text {
					font-size: 22rpx;
					font-weight: 500;
					color: #999999;
					margin-top: 30rpx;
					white-space: nowrap;
				}
			}
		}
	}
</style>
