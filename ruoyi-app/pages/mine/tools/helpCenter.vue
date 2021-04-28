<template>
	<view class="helpCenter-wrapper colCen">
		<titleBar :titleText='"帮助中心"' :pageForm='"helpCenter"'></titleBar>
		<view class="pageContent-container rowCen">
			<view class="leftClassify-container colCen">
				<view class="scrollContainer colCen">
					<view class="scrollList colSta">
						<view class="scroll-items rowCenCen" :class="leftCurrent==index?'scroll-items-active':''" v-for="(items,index) in classifyList"
						 :key="index" @click="changeClassify(index,items.id)">
							<view class="textBox">
								{{items.title}}
							</view>
						</view>
					</view>
				</view>
			</view>
			<view class="rightQuestion-container colCen">
				<view class="scrollContainer colCen">
					<scroll-view class="rightWrap borderBox" scroll-y>
						<view class="rightItem rowCen borderBox" v-for="(items,index) in quesrionList" :key="index" @click="goExplain(items.id)">
							<view class="questionName">
								{{items.title}}
							</view>
						</view>
					</scroll-view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import titleBar from '../../../components/backTitlebar.vue'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				leftCurrent: 0,
				classifyList: [],
				quesrionList: []
			}
		},
		onLoad() {
			this.getData()
		},
		methods: {
			getData(){
				this.$http.post('helpContent/getHelpList',{
					parentId:0
				},'application/json').then((res) => {
					console.log(res, '========>获取问题列表');
					this.classifyList = res
					this.changeClassify(0,this.classifyList[0].id)
				})
			},
			changeClassify(index,id) {
				this.leftCurrent = index
				this.$http.post('helpContent/getHelpList',{
					parentId:id
				},'application/json').then((res) => {
					console.log(res, '========>获取问题列表');
					this.quesrionList = res
				})
			},
			goExplain(id){
				uni.navigateTo({
					url:"./problemExplain?id=" + id
				})
			}
		}
	}
</script>

<style lang="scss">
	.helpCenter-wrapper {
		width: 100%;

		.pageContent-container {
			width: 100%;
			background-color: #FFFFFF;
			margin-top: 20rpx;
			height: calc(100vh - 110rpx - var(--status-bar-height));

			.leftClassify-container {
				width: 250rpx;
				height: 100%;

				.scrollContainer {
					width: 100%;
					height: 100%;
					background: #E6E8ED;

					.scrollList {
						width: 100%;
						height: 100%;

						.scroll-items {
							width: 100%;
							height: 100rpx;

							.textBox {
								font-size: 28rpx;
								font-weight: 500;
								color: #666666;
							}
						}

						.scroll-items-active {
							background: #FFFFFF;

							.textBox {
								color: #333333;
							}
						}
					}
				}
			}

			.rightQuestion-container {
				width: 500rpx;
				height: 100%;

				.scrollContainer {
					width: 100%;
					height: 100%;

					.rightWrap {
						width: 100%;
						height: 100%;
						padding: 0 32rpx;
						.rightItem{
							width: 100%;
							height: 100rpx;
							border-bottom: 1rpx solid #EFF1F7;
							.questionName{
								white-space: nowrap;
								overflow: hidden;
								text-overflow: ellipsis;
								font-size: 28rpx;
								font-weight: 400;
								color: #333333;
							}
						}
					}
				}
			}
		}
	}
</style>
