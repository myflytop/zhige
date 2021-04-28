<template>
	<view class="container">
		<titleBar :titleText='"意见反馈"' :pageForm='"feedback"'></titleBar>
		<view style="padding: 0 32rpx;">
			<view class="feedbackConWrap">
				<textarea class="feedbackCon" placeholder="请在此输入您的宝贵意见，APP使用体验、优化建议都可以告诉我" placeholder-style="color:#999999" v-model="describe" />
			</view>
			<view class="zishu">您还能输入{{300-describe.length}}个字</view>
		</view>
		<view class="rowCenCen" @click="feedback">
			<view class="tijiao">提交</view>
		</view>
		<!-- 弹框 mask-close-able：点击遮罩是否可以关闭弹出层，必须授权否则不能反馈-->
		<!-- <u-popup v-model="showTishi" mode="center" :mask-close-able="false" border-radius="10">
			<view class="tishiWrap colCen">
				<image src="/static/images/home/return.png" class="return" @click="goBack"></image>
				<view class="tishiTitle">提示</view>
				<view class="tishiCon">西瓜猪需要您授予手机存储（用于生成分享图片，保存图片、视频）权限，以便正常使用相关功能。</view>
				<view class="tishiBtn">去授权</view>
			</view>
		</u-popup> -->
	</view>
</template>

<script>
	import titleBar from '../../../components/backTitlebar.vue';
	export default {
		components:{
			titleBar
		},
		data() {
			return {
				showModel:'',
				describe: '',
				canClick:true
			};
		},
		onLoad(e) {
		},
		methods:{
			goBack(){
				uni.navigateBack();
			},
			onUploaded(lists) {
				this.filesArr = lists;
				console.log(this.filesArr)
				if(this.filesArr.length==0){
					if(!this.describe) return this.$jsutl.toast('请填写评价内容');
					// this.$jsutl.request({
					// 	url: 'orderEvaluate/addEvaluate',
					// 	data: {
					// 		describe: this.describe,
					// 		pic: '',
					// 	},
					// 	success: (res) => {
					// 		console.log(res)
					// 		if(res.data.code === 20000) {
					// 			this.$jsutl.toast(res.data.msg);
					// 			console.log(this.orderId+'------' + this.isZp)
					// 			setTimeout(()=>{
									uni.navigateBack({
										
									})
					// 			},1000)
					// 		}else{
					// 			this.$jsutl.toast(res.data.msg)
					// 		}
					// 	}
					// });
				}
			},
			onRemove(index, lists) {
				console.log('图片已被移除');
			},
			
			//删除图片
			// deleteItem(index) {
			// 	this.$refs.uUpload.remove(index);
			// },
			// onListChange(lists) {
			// 	console.log('onListChange', lists);
			// 	this.lists = lists;
			// },
			feedback(){
				if(this.canClick){
					if(this.describe){
						this.canClick = false
						this.$http.post('feedback/saveFeedBack',{
							content:this.describe
						},'application/json',true).then(res=>{
							console.log(res);
							uni.showToast({
								title: '反馈成功，感谢您宝贵的意见建议！',
								icon: 'none',
								position: 'bottom',
								duration: 2000,
							});
							setTimeout(()=>{
								uni.navigateBack({
									delta:1
								})
							},2000)
						}).catch(res=>{
							this.canClick = true
						})
					}else{
						uni.showToast({
							title: '您还没有输入内容哦~',
							icon: 'none',
							position: 'bottom',
							duration: 3000
						});
					}
				}
			},
			onSuccess(data, index, lists) {
				this.canClick = true;
				console.log('onSuccess', data, index, lists);
				this.pic = [],
				lists.forEach(item=>{
					this.pic.push(item.response.data);
				})
				console.log(this.pic)
				if(!this.describe) return this.$jsutl.toast('请填写评价内容');
				// this.$jsutl.request({
				// 	url: 'orderEvaluate/addEvaluate',
				// 	data: {
				// 		describe: this.describe,
				// 		pic: this.pic.join(','),
				// 	},
				// 	success: (res) => {
				// 		console.log(res)
				// 		if(res.data.code === 20000) {
				// 			this.$jsutl.toast(res.data.msg);
				// 			console.log(this.orderId+'------' + this.isZp)
							// setTimeout(()=>{
							// 	uni.navigateBack({
									
							// 	})
							// },1000)
				// 		}else{
				// 			this.$jsutl.toast(res.data.msg)
				// 		}
				// 	}
				// });
			},
		}
	}
</script>

<style>
	page{background: #EFF1F7;}
</style>
<style lang="scss" scoped>
	.container{
		.feedbackConWrap{background-color: #FFFFFF;border-radius: 20rpx;margin-top: 20rpx;
			.feedbackCon{width: 100%;height: 300rpx;padding: 20rpx 16rpx;font-size: 28rpx;}
		}
		.zishu{margin-top:24rpx;font-size: 28rpx;text-align: right;}
		.uploadWrap{background-color: #FFFFFF;border-radius: 20rpx;margin-top: 48rpx;padding: 20rpx 16rpx;
			.uploadTitle{font-size: 28rpx;margin-bottom: 30rpx;}
		}
		.tijiao{width: 686rpx;height: 90rpx;line-height: 90rpx;text-align: center;color: #FFFFFF;font-size: 32rpx;margin-top: 106rpx;
				background: linear-gradient(-77deg, #6141FE, #9F47FA);border-radius: 45rpx;}
		.tishiWrap{background-color: #FFFFFF;padding: 50rpx 40rpx 46rpx;width: 520rpx;
			.return{width: 17rpx;height: 32rpx;position: absolute;top: 50rpx;left: 40rpx;}
			.tishiTitle{font-size: 30rpx;}
			.tishiCon{font-size: 28rpx;margin: 30rpx 0 50rpx;}
			.tishiBtn{width: 200rpx;height: 60rpx;line-height: 52rpx;background: #FFFFFF;border: 2rpx solid #6A45DE;border-radius: 10rpx;font-size: 28rpx;text-align: center;color: #6A45DE;}
		}
	}
</style>
