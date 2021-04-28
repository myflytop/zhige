<template>
	<view class="aboutUs-wrapper wrapperLayer borderBox">
		<titleBar :titleText='"关于我们"' :pageForm='"aboutUs"'></titleBar>
		<view class="pageContent-container colCen">
			<view class="appInfo-container colCen">
				<view class="applogo defIcon">
					<image :src="logo" mode=""></image>
				</view>
				<view class="appName">
					{{appName}}
				</view>
				<view class="editionbox">
					{{editionNum}}
				</view>
			</view>
			
			<view class="message-content infoContainer colCen">
				<view class="keyvalueBox rowCenBet borderBox" @click="goPage('agreement')">
					<view class="leftKey">
						用户协议
					</view>
					<view class="rightvalue rowCen">
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
				<view class="keyvalueBox rowCenBet borderBox" @click="goPage('policy')">
					<view class="leftKey">
						隐私政策
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
	import titleBar from '../../../components/backTitlebar.vue'
	import utils from '../../../utils/utils.js'
	export default{
		components:{
			titleBar
		},
		data(){
			return{
				appName:'',
				editionNum:'',
				logo:''
			}
		},
		onLoad() {
			utils.getCache('appInfo').then(res=>{
				this.appName = res.appName
				this.logo = res.logo
				// #ifdef APP-PLUS
				this.editionNum = plus.runtime.version;
				// #endif
			})
		},
		methods:{
			goPage(type){
				uni.navigateTo({
					url:'../../login/policyAgreement?type='+type
				})
			}
		}
	}
</script>
<!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
<style lang="scss">
	.aboutUs-wrapper{
		.pageContent-container{
			width: 100%;
			.appInfo-container{
				width: 100%;
				.applogo{
					width: 130rpx;
					height: 130rpx;
					border-radius: 20rpx;
					margin-top: 80rpx;
					overflow: hidden;
				}
				.appName{
					font-size: 32rpx;
					font-weight: 500;
					color: #333333;
					margin-top: 25rpx;
					margin-bottom: 10rpx;
				}
				.editionbox{
					font-size: 24rpx;
					font-weight: 400;
					color: #999999;
				}
			}
			.infoContainer {
				width: 100%;
				margin-top: 80rpx;
				background-color: #FFFFFF;
			
				.keyvalueBox {
					width: 100%;
					height: 100rpx;
					border-bottom: 1rpx solid #F2F2F2;
					padding: 0 30rpx;
			
					.leftKey {
						font-size: 28rpx;
						font-weight: 500;
						color: #333333;
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
	}
</style>
