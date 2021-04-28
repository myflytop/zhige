<template>
	<view class="subsidy-wrapper wrapperLayer">
		<titleBar :titleText='"补贴提现"' :pageForm='"subsidy"' @gopath='gosubsidy'></titleBar>
		<view class="pageContent-container rowCen borderBox">
			<view class="account-info-container colCen borderBox">
				<view class="zfb-container barcontent rowCenBet borderBox">
					<view class="leftbox rowCen">
						<view class="barname-box rowCen">
							<view class="iconbox defIcon">
								<image src="../../static/images/active/zfb.png" mode=""></image>
							</view>
							<view class="account-num">
								支付宝
							</view>
						</view>
						<view class="Accountname">
							{{zfbinfo?zfbinfo.zfbAccount:''}}
						</view>
					</view>

					<view class="right-content rowCen">
						<view class="changeAccount rowCenCen" @tap='gobinding()' v-if="zfbinfo">
							<view>修改</view>
						</view>
						<view class="nobinding rowCen" v-else @tap='gobinding()'>
							<view class="text">
								未绑定
							</view>
							<view class="icon-box defIcon">
								<image src="../../static/images/goods/arrow.png" mode=""></image>
							</view>
						</view>
					</view>
				</view>

				<view class="zfb-container barcontent rowCenBet borderBox" v-if="zfbinfo">
					<view class="leftbox rowCen">
						<view class="barname-box rowCen">
							<view class="account-num">
								真实姓名
							</view>
						</view>
						<view class="Accountname">
							{{zfbinfo.truename}}
						</view>
					</view>
				</view>

				<view class="zfb-container barcontent rowCenBet borderBox">
					<view class="leftbox rowCen">
						<view class="barname-box rowCen">
							<view class="iconbox defIcon">
								<image src="../../static/images/active/tb.png" mode=""></image>
							</view>
							<view class="account-num tbfont">
								淘宝订单
							</view>
						</view>
						<view class="tborder rowCen">
							<input class="hinput" type="number" v-model="tborder" placeholder="输入订单编号(淘宝订单编号)" placeholder-class="inputplace" />
						</view>
					</view>
				</view>
				
				
				<view class="submitBtn rowCenCen" @tap='submit()'>
					<view>提交</view>
				</view>
				
				<view class="tipsbox">
					*请7天内完成认证，交易成功后预计次月25日返款
				</view>
				
				<view class="explain-text" v-html="explaincontent">
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
				zfbinfo: '',
				explaincontent:'',
				tborder:''
			}
		},
		onShow() {
			this.getExplain()
			this.getzfbinfo()
		},
		methods: {
			submit(){
				this.$http.post('zeroBuyOrder/savaZeroBuyOrder',{
					orderId:this.tborder,
					truename:this.zfbinfo.truename,
					zfbAccount:this.zfbinfo.zfbAccount
				},'application/json').then(res=>{
					console.log(res);
					
				})
			},
			getzfbinfo(){
				this.$http.post('zfbAccount/getZfbInfo').then(res=>{
					console.log(res);
					if(res.id){
						this.zfbinfo = res
					}else{
						this.zfbinfo= false
					}
				}) 
			},
			getExplain(){
				this.$http.get('agreement/list/3').then((res) => {
					console.log(res, '========>信息');
					this.explaincontent = res.content
				})
			},
			gosubsidy(e) {
				uni.navigateTo({
					url: './zerolist'
				})
			},
			gobinding(){
				uni.navigateTo({
					url:'../mine/setting/bindingZFB?fromModify=true'
				})
			}
		}
	}
</script>

<style lang="scss">
	.subsidy-wrapper {
		width: 100%;
		min-height: 100vh;
		background-color: #FFFFFF;

		.pageContent-container {
			width: 100%;

			.account-info-container {
				width: 100%;
				padding: 0 32rpx;

				.barcontent {
					width: 100%;
					height: 100rpx;
					padding: 0 20rpx;
					box-shadow: 0px 1rpx 0px 0px #EFF1F7;

					.leftbox {
						.barname-box{
							width: 220rpx;
							.iconbox {
								width: 40rpx;
								height: 40rpx;
								margin-right: 17rpx;
							}
							.account-num {
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
							}
							.tbfont {
								color: #FF5300;
							}
						}

						.Accountname {
							font-size: 28rpx;
							font-weight: 400;
							color: #333333;
						}

						.tborder {
							
							.hinput {
								width: 400rpx;
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
							}

							.inputplace {
								font-size: 28rpx;
								font-weight: 400;
								color: #999999;
							}
						}
					}

					.right-content {
						.changeAccount {
							width: 100rpx;
							height: 40rpx;
							background: linear-gradient(266deg, #7D0DFC, #D116FD);
							border-radius: 20rpx;
							font-size: 26rpx;
							font-weight: 400;
							color: #FFFFFF;
						}

						.nobinding {
							.text {
								font-size: 26rpx;
								font-weight: 400;
								color: #999999;
								margin-right: 15rpx;
							}

							.icon-box {
								width: 8rpx;
								height: 17rpx;
							}
						}
					}
				}
				
				.submitBtn{
					width: 100%;
					height: 80rpx;
					background: linear-gradient(266deg, #7D0DFC, #D116FD);
					border-radius: 40rpx;
					font-size: 32rpx;
					font-weight: 400;
					color: #FFFFFF;
					margin-top: 60rpx;
				}
				
				.tipsbox{
					text-align: center;
					font-size: 24rpx;
					font-weight: 400;
					color: #666666;
					margin-top: 20rpx;
				}
				
				.explain-text{
					width: 100%;
					margin-top: 60rpx;
				}
			}
		}
	}
</style>
