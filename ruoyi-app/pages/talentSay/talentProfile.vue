<template>
	<view class="talentProfile-container wrapperLayer">
		<titleBar :titleText='"达人简介"' :pageForm='"talentProfile"'></titleBar>
		<view class="pageContent-container colCen">
			<view class="top-content">
				<view style="overflow: hidden;width: 100%;height: 300rpx;">
					<view class="topbackground-container" :style="'background:url('+pageInfo.headImg+')no-repeat; background-size: 100% 100%;'">
					</view>
				</view>
				<view class="imgbox rowCenCen">
					<image class="avatorContent defIcon" :src="pageInfo.headImg" mode="aspectFill"></image>
				</view>
			</view>
			<view class="info-container colCen borderBox">
				<view class="nickname rowCenCen">
					<view>
						{{pageInfo.talentName}}
					</view>
				</view>
				<view class="autograph">
					{{pageInfo.autograph}}
				</view>

				<view class="volumeFlow-container rowCenCen">
					<view class="content-box colCen">
						<view class="info">
							{{pageInfo.readtimes}}
						</view>
						<view class="tips">
							阅读
						</view>
					</view>
					<view class="centerborder"></view>
					<view class="content-box colCen">
						<view class="info">
							{{pageInfo.followtimes}}
						</view>
						<view class="tips">
							喜欢
						</view>
					</view>
				</view>
			</view>
			
			
			<view class="articleList-container colCen">
				<block v-for="(items,index) in pageInfo.manArticlesVOList" :key="index">
					<view class="article-items-container colCen borderBox" @click="goDetails(items.id)">
						<view class="titlebar">
							{{items.name}}
						</view>
						<view class="banner-container defIcon">
							<image :src="items.articleBanner" mode="aspectFill"></image>
						</view>
						
						<view class="articleHot-info-container rowCenBet">
							<view class="readNum">
								{{items.readTimes}} 阅读
							</view>
							<view class="right-heart rowCenCen">
								<image class="heart" src="../../static/images/goods/follow.png" mode="aspectFill"></image>
								<view class="followNum">
									{{items.followTimes}}
								</view>
							</view>
						</view>
					</view>
				</block>
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
				pageInfo:'',
				talentId:''
			}
		},
		onLoad(options) {
			console.log(options);
			this.talentId = options.talentId
			this.getPageInfo()
		},
		methods:{
			getPageInfo(){
				this.$http.post('talentInfo/getManArticles', {
					talentId: this.talentId,
				}, 'application/json').then((res) => {
					console.log(res, '========>作者信息');
					this.pageInfo = res
				})
			},
			goDetails(id) {
				uni.navigateTo({
					url: '../webView/webView?url=/hybrid/html/articleDetails.html?id=' + id
				})
			},
		}
	}
</script>

<style lang="scss">
	.talentProfile-container {
		width: 100%;

		.pageContent-container {
			width: 100%;

			.top-content {
				position: relative;
				width: 100%;
				height: 370rpx;
				background-color: #FFFFFF;

				.topbackground-container {
					width: 100%;
					height: 300rpx;
					filter: blur(20rpx);
				}

				.imgbox {
					position: absolute;
					width: 100%;
					height: 140rpx;
					bottom: 0rpx;
					z-index: 1;

					.avatorContent {
						width: 140rpx;
						height: 140rpx;
						border-radius: 50%;
					}
				}
			}

			.info-container {
				width: 100%;
				padding: 0 32rpx 32rpx 32rpx;
				background-color: #FFFFFF;
				margin-bottom: 20rpx;

				.nickname {
					font-size: 28rpx;
					font-weight: 400;
					color: #333333;
					margin-top: 20rpx;
					margin-bottom: 30rpx;
				}

				.autograph {
					font-size: 28rpx;
					font-weight: 400;
					color: #666666;
					width: 100%;
					text-align: center;
					overflow: hidden;
					text-overflow: ellipsis;
					white-space: nowrap;
					margin-bottom: 30rpx;
				}

				.volumeFlow-container {
					width: 100%;
					.centerborder{
						width: 2rpx;
						height: 65rpx;
						background-color: #EFF1F7;
					}
					.content-box{
						width: 48%;
						.info{
							font-size: 24rpx;
							font-weight: 500;
							color: #333333;
						}
						.tips{
							font-size: 24rpx;
							font-weight: 500;
							color: #666666;
							margin-top: 10rpx;
						}
					}
				}
			}
			
			.articleList-container{
				width: 100%;
				.article-items-container{
					width: 100%;
					height: 340rpx;
					background-color: #FFFFFF;
					margin-bottom: 20rpx;
					padding: 10rpx 32rpx;
					.titlebar{
						width: 100%;
						margin: 20rpx 0;
						font-size: 28rpx;
						font-weight: 500;
						color: #333333;
						line-height: 34rpx;
						overflow: hidden;
						text-overflow: ellipsis;
						white-space: normal;
					}
					.banner-container{
						width: 100%;
						height: 200rpx;
						border-radius: 12rpx;
						overflow: hidden;
					}
					
					.articleHot-info-container{
						width: 100%;
						margin-top: 10rpx;
						.readNum{
							font-size: 24rpx;
							font-weight: 400;
							color: #666666;
						}
						.right-heart{
							.heart{
								width: 26rpx;
								height: 22rpx;
								margin-right: 10rpx;
							}
							.followNum{
								font-size: 24rpx;
								font-weight: 400;
								color: #666666;
							}
						}
					}
				}
			}
		}
	}
</style>
