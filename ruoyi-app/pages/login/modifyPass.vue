<template>
	<view class="modifyPass-container wrapperLayer">
		<titleBar titleText='' :pageForm='"modifyPass"'></titleBar>
		<view class="pageInfoContent-container colCen borderBox">
			<view class="titleText">
				修改密码
			</view>
			
			<view class="input-container colCen">
				<view class="outSidebox rowCen" :class="selectedInput=='phone'?'outSidebox-active':''">
					<input 
						type="number" 
						data-type='phone'
						@focus="changeType"
						@blur="cleanActive"
						v-model="userInfo.account" 
						placeholder="请输入手机号" 
						disabled
						placeholder-class="input-placeHolder"/>
				</view>
			</view>
			
			<view class="input-container colCen">
				<view class="outSidebox rowCenBet" data-type='pass' :class="selectedInput=='code'?'outSidebox-active':''">
					<input 
						@focus="changeType"
						@blur="cleanActive"
						data-type='code'
						type="number" 
						v-model="code" 
						placeholder="请输入验证码" 
						placeholder-class="input-placeHolder"/>
					<view class="getcodebox" :class="canGetCode?'colorTxt':''" @click="getCode()">
						{{canGetCode?'获取验证码':second+'s后重新获取'}}
					</view>
				</view>
			</view>
			
			<view class="input-container colCen">
				<view class="outSidebox rowCenBet" data-type='pass' :class="selectedInput=='pass'?'outSidebox-active':''">
					<input 
						@focus="changeType"
						@blur="cleanActive"
						data-type='pass'
						:password="showPass"
						type="text" 
						v-model="pass" 
						placeholder="请输入新密码" 
						placeholder-class="input-placeHolder"/>
					<view class="hidepass iconfont" @click="showPassfnc()">
						{{showPass?'&#xe610;':'&#xe60f;'}}
					</view>
				</view>
			</view>
			
			<view class="input-container colCen">
				<view class="outSidebox rowCenBet" data-type='pass' :class="selectedInput=='newpass'?'outSidebox-active':''">
					<input 
						@focus="changeType"
						@blur="cleanActive"
						data-type='newpass'
						password
						type="text" 
						v-model="newpass" 
						placeholder="请确认新密码" 
						placeholder-class="input-placeHolder"/>
				</view>
			</view>
			
			<view class="txtTips">
				密码由8-16个字符组成。必须包含字母和数字两种类型。
			</view>
			
			<view class="login-btn rowCenCen" :class="true?'colorfulbtn':''" @click="modify()">
				<view class="btn-font">
					确认修改
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
		data(){
			return{
				userInfo:'',
				pass:'',
				phone:'',
				code:'',
				selectedInput:'',
				newpass:'',
				
				cleanfocus:true,
				showPass:true,
				second:60,
				canGetCode:true,
				prevent:true
			}
		},
		onLoad() {
			try {
				const value = uni.getStorageSync('userInfo');
				if (value.memberId) {
					this.userInfo = value
				} else {
					this.userInfo = ''
				}
			} catch (e) {
				this.userInfo = ''
			}
			
			console.log(this.userInfo);
		},
		methods:{
			getCode(){
				if(this.prevent && this.canGetCode){
					this.prevent = false
					var timerChuo = new Date().getTime()
					this.$http.post('member/getAuthCode',{
						csessionid:timerChuo,
						scene:'findpw',
						telephone:this.userInfo.account,
						token:MD5(config.salt + timerChuo)
					},'application/json',true).then((res) => {
						console.log(res, '========>验证码');
						this.prevent = true
						this.canGetCode = false
						var timer = setInterval(()=>{
							this.second --
							if(this.second<1){
								this.second = 60
								this.canGetCode = true
								clearInterval(timer)
							}
						},1000)
					}).catch(res=>{
						this.prevent = true
						this.canGetCode = true
					})
				}else{
					uni.showToast({
						title: '您点的太快了~',
						icon: 'none',
						position: 'bottom',
						duration: 3000
					});
				}
			},
			
			showPassfnc(){
				this.showPass = !this.showPass
			},
			
			
			changeType(e){
				this.selectedInput = e.target.dataset.type
			},
			cleanActive(){
				this.selectedInput = ''
			},
			
			changeWay(){
				this.ifPasslogin = !this.ifPasslogin
			},
			
			modify() {
				var str = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
				if (str.test(this.pass)) {
					if(this.pass == this.newpass){
						this.$http.post('member/updataPassWordByMobile', {
							pwd: this.pass,
							account:this.userInfo.account,
							validateCode:this.code
						}, 'application/json').then((res) => {
							uni.navigateBack({
								delta:1
							})
						})
					}else{
						uni.showToast({
							title: '两次密码输入不一致！',
							icon: 'none',
							position: 'bottom',
							duration: 3000
						});
					}
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
	}
</script>

<style lang="scss">
	.modifyPass-container{
		width: 100%;
		min-height: 100vh;
		background-color: #FFFFFF;
		.pageInfoContent-container{
			width: 100%;
			padding: 0 60rpx;
			.titleText{
				width: 100%;
				font-size: 42rpx;
				font-weight: bold;
				color: #333333;
				margin: 60rpx 0;
			}
			
			.input-container{
				width: 100%;
				margin-bottom: 20rpx;
				.outSidebox{
					width: 100%;
					height: 85rpx;
					border-bottom: 2rpx solid #F1F1F1;
					.input-placeHolder{
						font-size: 34rpx;
						font-weight: 500;
						color: #CACACA;
					}
					input{
						font-size: 34rpx;
						font-weight: 500;
						color: #222222;
					}
					.hidepass{
						font-size: 32rpx;
						font-weight: 800;
						color: #CACACA;
					}
					.getcodebox{
						font-size: 28rpx;
						white-space: nowrap;
						font-weight: 400;
						color: #FF2851;
						pointer-events: none;
					}
					.colorTxt{
						pointer-events: auto;
					}
				}
				.outSidebox-active{
					border-bottom: 2rpx solid #FF2851;
				}
			}
			.login-btn{
				width: 100%;
				height: 86rpx;
				background: #E2E2E2;
				border-radius: 43rpx;
				margin-top: 80rpx;
				pointer-events: none;
				.btn-font{
					font-size: 30rpx;
					font-weight: 500;
					color: #FFFFFF;
				}
			}
			.txtTips {
				font-size: 26rpx;
				font-weight: 400;
				color: #999999;
				line-height: 38rpx;
			}
			.colorfulbtn{
				background: #FD002F;
				pointer-events: auto;
			}
		}
	}
</style>
