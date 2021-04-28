<template>
	<view class="officialNotice wrapperLayer">
		<titleBar :titleText='"官方通知"' :pageForm='"officialNotice"'></titleBar>
		<view class="pageContent-container colCen">
			<block v-for="(items,index) in noticeList" :key="index">
				<view class="notice-items-container rowSta">
					<view class="leftsettingbox defIcon">
						<image src="../../static/images/home/setting.png" mode="aspectFill"></image>
					</view>
					<view class="rightcontentbox colCen">
						<view class="titlebar">
							{{items.title}}
						</view>
						<view class="time">
							{{items.createTime}}
						</view>
						
						<view class="content-box">
							<view class="box" v-html="items.content">
								
							</view>
						</view>
					</view>
				</view>
			</block>
			
			<aLoadMore :status="loadstatus" mode="loading3" :showTitle='true' color="#999999" ></aLoadMore>
		</view>
	</view>
</template>

<script>
	import indexPage from '../../components/indexPage.vue';
	import titleBar from '../../components/backTitlebar.vue';
	export default {
		components: {
			titleBar,
			indexPage
		},
		data(){
			return{
				noticeList:[],
				pageCurrent:'',
				canloadmore:false,
				loadstatus: 'loading',
			}
		},
		onLoad() {
			this.initData()
		},
		onReachBottom(){
			if(this.canloadmore){
				this.getNextPage()
			}
		},
		methods:{
			initData(){
				this.$http.post('message/getMessageList', {
					limit: 20,
					offset: this.pageCurrent
				}, 'application/json').then((res) => {
					console.log(res);
					if(res.length<20){
						this.canloadmore = false
						this.loadstatus = 'nomal'
					}else{
						this.canloadmore = true
						this.loadstatus = 'loading'
					}
					this.noticeList = res
				})
			},
			getNextPage(){
				this.$http.post('message/getMessageList', {
					limit: 20,
					offset: this.pageCurrent
				}, 'application/json').then((res) => {
					console.log(res);
					if(res.length<20){
						this.canloadmore = false
						this.loadstatus = 'nomal'
					}else{
						this.canloadmore = true
						this.loadstatus = 'loading'
					}
					this.noticeList = this.noticeList.concat(res)
				})
			}
		}
	}
</script>

<style lang="scss">
	.officialNotice{
		width: 100%;
		.pageContent-container{
			width: 100%;
			margin-top: 20rpx;
			background-color: #FFFFFF;
			padding: 40rpx 32rpx;
			.notice-items-container{
				width: 100%;
				margin-bottom: 20rpx;
				.leftsettingbox{
					width: 60rpx;
					height: 60rpx;
				}
				.rightcontentbox{
					width: 605rpx;
					margin-left: 20rpx;
					.titlebar{
						width: 100%;
						font-size: 28rpx;
						font-weight: 500;
						color: #444444;
						line-height: 34rpx;
					}
					.time{
						width: 100%;
						font-size: 28rpx;
						font-weight: 400;
						color: #999999;
						line-height: 34rpx;
						margin-top: 5rpx;
					}
					
					.content-box{
						width: 100%;
						display: flex;
						align-items: center;
						justify-content: center;
						box-sizing: border-box;
						border-bottom: 1rpx solid #E6E7ED;
						/deep/.box{
							width: 100%;
							padding: 18rpx 20rpx;
							box-sizing: border-box;
							background: #F0F1F7;
							border-radius: 10rpx;
							margin: 30rpx;
							display: flex;
							flex-direction: column;
							justify-content: center;
							align-items: center;
							p{
								width: 100%;
								word-wrap: break-word;
								word-break: break-all;
							}
						}
					}
				}
			}
		}
	}
	
	p{
		display: inline;
	}
</style>
