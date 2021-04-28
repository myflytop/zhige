<template>
	<view class="bindingZFB-wrapper wrapperLayer borderBox">
		<titleBar :titleText='pageTitle' :pageForm='"bindingZFB"'></titleBar>
		<view class="pageContent-container colCen">
			<view class="zfbicon defIcon">
				<image src="../../../static/images/mine/tools/bindingzfb.png" mode=""></image>
			</view>
			<view class="form-container colCen borderBox">
				<view class="usernam-container colCen">
					<view class="boxtitle">
						姓名
					</view>
					<view class="inputbox rowCen">
						<input class="nostyle-input" type="text" v-model="username" placeholder="请输入姓名" placeholder-class="placeholderstyle" />
					</view>
				</view>
				<view class="usernam-container colCen">
					<view class="boxtitle">
						支付宝
					</view>
					<view class="inputbox rowCen">
						<input class="nostyle-input" type="text" v-model="zfbnum" placeholder="请输入支付宝帐号" placeholder-class="placeholderstyle" />
					</view>
				</view>
				<view class="confirmBtn colCen" @click="openModel()">
					<view class="btn-container rowCenCen">
						<view>确定</view>
					</view>
				</view>
			</view>
		</view>

		<!-- 模态窗 -->
		<u-modal v-model="showModel" show-cancel-button :content="content" @confirm="confirm" :async-close="true">
		</u-modal>
		<u-toast ref="uToast" />
	</view>
</template>

<script>
	import titleBar from '../../../components/backTitlebar.vue';
	import utils from '../../../utils/utils.js'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				pageTitle: '支付宝绑定',
				username: '',
				zfbnum: '',
				zfbinfo: '',
				zfbid: '',
				showModel: false,
				content: '确认信息无误并提交?'
			}
		},
		onLoad(options) {
			this.getzfnInfo()

			if (utils.getCacheSync('zfbinfo')) {
				this.pageTitle = '支付宝修改'
			} else {
				this.zfbinfo = ''
				this.pageTitle = '支付宝绑定'
			}
		},
		methods: {
			getzfnInfo(){
				this.$http.post('zfbAccount/getZfbInfo').then(res=>{
					console.log(res);
					if(res.id){
						this.zfbinfo = res
						this.username = this.zfbinfo.truename
						this.zfbnum = this.zfbinfo.zfbAccount
						this.pageTitle = '支付宝修改'
					}else{
						this.zfbinfo= ''
						this.pageTitle = '支付宝绑定'
					}
				}) 
			},
			openModel() {
				if (this.username != '' && this.zfbnum != '') {
					this.showModel = true;
				} else {
					this.$refs.uToast.show({
						title: '输入的信息有误',
						type: 'error',
					})
				}
			},
			confirm() {
				this.$http.post('zfbAccount/updateZfbInfo', {
					truename: this.username,
					zfbAccount: this.zfbnum
				}, 'application/json').then(res => {
					this.showModel = false;
					this.$refs.uToast.show({
						title: '绑定成功',
						type: 'success',
						back: true
					})
				})
			},
		}
	}
</script>

<style lang="scss">
	.bindingZFB-wrapper {
		min-height: 100vh;
		background-color: #FFFFFF;

		.pageContent-container {
			width: 100%;

			.zfbicon {
				width: 125rpx;
				height: 125rpx;
				margin-top: 40rpx;
			}

			.form-container {
				width: 100%;
				padding: 0 32rpx;
				margin-top: 70rpx;

				.usernam-container {
					width: 100%;
					margin-top: 30rpx;

					.boxtitle {
						width: 100%;
						font-size: 28rpx;
						font-weight: 500;
						color: #333333;
					}

					.inputbox {
						width: 100%;
						height: 80rpx;
						margin-top: 20rpx;
						font-size: 28rpx;
						font-weight: 400;
						color: #333333;
						border-bottom: 1rpx solid #EFF1F7;
					}
				}

				.confirmBtn {
					width: 100%;

					.btn-container {
						width: 100%;
						height: 80rpx;
						border-radius: 40rpx;
						background: linear-gradient(266deg, #7619EC, #A429F3);
						font-size: 28rpx;
						font-weight: 500;
						color: #FFFFFF;
						margin-top: 70rpx;
					}
				}
			}
		}
	}
</style>
