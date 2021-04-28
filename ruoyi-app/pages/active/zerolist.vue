<template>
	<view class="zerolist-wrapper wrapperLayer borderBox" :style="'background:'+ (datalist.length>0?'':'')">
		<titleBar titleText='订单详情' :pageForm='"zerolist"'></titleBar>
		<view class="pageContent-container colCen borderBox">
			<view class="top-content-container colCen borderBox">
				<view class="bac-card colCen">
					<view class="card-title">
						预估有效订单
					</view>
					<view class="card-info rowCenBet">
						<view class="ordernum colCen">
							<view class="number">
								{{pageInfo.sumOrder}}
							</view>
							<view class="texttips">
								有效订单（笔）
							</view>
						</view>
						<view class="totalprice ordernum colCen">
							<view class="number">
								{{pageInfo.sumMoney}}
							</view>
							<view class="texttips">
								总金额（元）
							</view>
						</view>
					</view>
				</view>

				<view class="states-bar rowCenCen">
					<view class="valid rowCenCen" :class="current==0?'nav-active':''" @tap="getlist(0)">
						有效订单
					</view>
					<view class="valid rowCenCen" :class="current==1?'nav-active':''" @tap="getlist(1)">
						无效订单
					</view>
				</view>
			</view>

			<view class="bottom-container colCen">
				<view class="list-container colCen borderBox" v-if="true">
					<block v-for="(items,index) in datalist" :key='index'>
						<view class="order-card colCen borderBox">
							<view class="dfk defIcon">
								<image v-if="items.status==0" src="../../static/images/active/gz.png" mode="aspectFill"></image>
								<image v-else src="../../static/images/active/gz.png" mode="aspectFill"></image>
							</view>
							<view class="cardTitle-bar rowCen borderBox">
								<view class="order-ident">
									订单编号：{{items.orderId}}
								</view>
								<view class="copyBtn rowCenCen" @tap='copy(items.orderId)'>
									<view>
										复制
									</view>
								</view>
							</view>

							<view class="goods-info rowCen">
								<view class="goods-pic defIcon">
									<image :src="items.itemImg" mode="aspectFill"></image>
								</view>

								<view class="goods-info-content colCen">
									<view class="goods-name">
										{{items.dtitle}}
									</view>
									<view class="creat-time">
										{{items.createTime}}
									</view>
								</view>
							</view>

							<view class="fankuan rowCenBet">
								<view class="textbox">
									付款金额：{{items.orderAmount}}
								</view>
								<view class="textbox">
									预估返款：{{items.orderAmount}}
								</view>
							</view>
						</view>
					</block>
				</view>
				<view class="emptyList colCen" v-else>
					<view class="empty-icon defIcon">
						<image src="../../static/images/active/empty.png" mode="aspectFill"></image>
					</view>
					<view class="text">
						暂无订单，快去逛逛吧~
					</view>
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
				current: 0,
				pageInfo: '',
				datalist: ''
			}
		},
		onLoad() {
			this.getlist()
		},
		methods: {
			getlist(state) {
				this.current = state || 0;
				this.datalist = []
				this.$http.post('zeroBuyOrder/getZeroOrderList', {
					isEffective: this.current,
					limit: 100,
					offset: 0
				}, 'application/json').then(res => {
					uni.stopPullDownRefresh()
					this.pageInfo = res
					this.datalist = res.orderList;
				})
			},
			copy(id) {
				uni.setClipboardData({
					data: id,
					success: res => {
						uni.showToast({
							title: '订单编号已复制',
							duration: 2000
						})
					}
				});
			}
		},
		onPullDownRefresh() {
			this.getlist()
		}
	}
</script>

<style lang="scss">
	.zerolist-wrapper {
		width: 100%;
		min-height: 100vh;

		.pageContent-container {
			width: 100%;

			.top-content-container {
				width: 100%;
				background-color: #FFFFFF;
				border-top: 1rpx solid #F3F4F9;
				padding: 0 32rpx;

				.bac-card {
					width: 100%;
					height: 200rpx;
					background: url(../../static/images/active/cardbac.png)no-repeat;
					background-size: 100% 100%;
					margin: 20rpx 0;
					padding: 0rpx 30rpx;

					.card-title {
						width: 100%;
						font-size: 24rpx;
						font-weight: 400;
						color: #FFFFFF;
						margin-top: 40rpx;
					}

					.card-info {
						width: 100%;

						.ordernum {
							margin-top: 30rpx;

							.number {
								font-size: 24rpx;
								font-weight: bold;
								color: #FFFFFF;
							}

							.texttips {
								font-size: 24rpx;
								font-weight: 400;
								color: #FFFFFF;
								margin-top: 10rpx;
							}
						}
					}
				}

				.states-bar {
					width: 100%;
					height: 70rpx;
					margin-top: 35rpx;
					box-shadow: 0px 1rpx 0px 0px #EFF1F7;

					.valid {
						width: 300rpx;
						font-size: 28rpx;
						font-weight: 400;
						color: #333333;
					}

					.nav-active {
						color: #FF3638;
					}
				}
			}

			.bottom-container {
				width: 100%;

				.emptyList {
					width: 100%;

					.empty-icon {
						width: 232rpx;
						height: 224rpx;
						margin: 40rpx 0;
					}

					.text {
						font-size: 22rpx;
						font-family: PingFang SC;
						font-weight: 400;
						color: #666666;
					}
				}

				.list-container {
					width: 100%;
					padding: 0 32rpx;
					margin-top: 20rpx;

					.order-card {
						width: 100%;
						height: 260rpx;
						background-color: #FFFFFF;
						margin-bottom: 20rpx;
						position: relative;

						.dfk {
							position: absolute;
							width: 60rpx;
							height: 60rpx;
							right: 13rpx;
							top: 13rpx;
						}

						.cardTitle-bar {
							width: 100%;
							margin-top: 20rpx;
							padding: 0 20rpx;

							.order-ident {
								font-size: 24rpx;
								font-weight: 400;
								color: #999999;
							}

							.copyBtn {
								width: 90rpx;
								height: 40rpx;
								background: #EFF1F7;
								border-radius: 18rpx;
								font-size: 24rpx;
								font-weight: 400;
								color: #999999;
								margin-left: 20rpx;
							}
						}

						.goods-info {
							width: 100%;
							padding: 0 20rpx 20rpx 20rpx;
							margin-top: 15rpx;
							border-bottom: 1rpx solid #EDEDED;

							.goods-pic {
								width: 113rpx;
								height: 113rpx;
							}

							.goods-info-content {
								margin-left: 20rpx;
								width: 470rpx;

								.goods-name {
									width: 100%;
									white-space: nowrap;
									overflow: hidden;
									text-overflow: ellipsis;
									font-size: 26rpx;
									font-weight: 400;
									color: #333333;
								}

								.creat-time {
									width: 100%;
									font-size: 20rpx;
									margin-top: 20rpx;
									font-weight: 400;
									color: #999999;
								}
							}
						}

						.fankuan {
							width: 100%;
							height: 60rpx;
							padding: 0 20rpx;

							.textbox {
								font-size: 20rpx;
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
