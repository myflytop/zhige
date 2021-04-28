<template>
	<view class="setting-wrapper wrapperLayer colCen">
		<titleBar :titleText='"设置"' :pageForm='"setting"'></titleBar>
		<view class="body-container colCen">
			<view class="userSet-content infoContainer colCen">
				<view class="keyvalueBox rowCenBet borderBox" @click="unsupport()" v-if="false">
					<view class="leftKey">
						个人信息
					</view>
					<view class="rightvalue rowCen">
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
				<view class="keyvalueBox rowCenBet borderBox" @click="goUrl('accountSecurity')">
					<view class="leftKey">
						账户与安全
					</view>
					<view class="rightvalue rowCen">
						<view class="rightText">
							未授权
						</view>
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
			</view>

			<view class="message-content infoContainer colCen" style="margin-top: 20rpx;">
				<view class="keyvalueBox rowCenBet borderBox" @click="unsupport()" v-if="false">
					<view class="leftKey">
						消息通知设置
					</view>
					<view class="rightvalue rowCen">
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
				<view class="keyvalueBox rowCenBet borderBox" @click="openModel('clean')">
					<view class="leftKey">
						清除缓存
					</view>
					<view class="rightvalue rowCen">
						<view class="rightText">
							{{storageSize}}
						</view>
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
			</view>

			<view class="about-us infoContainer colCen" style="margin-top: 20rpx;">
				<view class="keyvalueBox rowCenBet borderBox" @click="goUrl('aboutUs')">
					<view class="leftKey">
						关于我们
					</view>
					<view class="rightvalue rowCen">
						<view class="rightText">
							<!-- #ifdef APP-PLUS -->
							{{version}}
							<!-- #endif -->
						</view>
						<view class="arrow-icon defIcon">
							<image src="../../../static/images/goods/arrow.png" mode=""></image>
						</view>
					</view>
				</view>
			</view>

			<view class="logOut rowCenCen" @click="openModel('logout')">
				<view class="outText">
					退出登录
				</view>
			</view>
		</view>

		<!-- 模态窗 -->
		<u-modal v-model="showModel" show-cancel-button :content="content" @confirm="confirm" :async-close="true"></u-modal>
		<u-toast ref="uToast" />
	</view>
</template>
<!-- 淘宝客技术支持 https://www.jiuduoyun.net/ -->
<script>
	import titleBar from '../../../components/backTitlebar.vue'
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				modelType: '',
				showModel: false,
				content: '',
				storageSize: '',
				// #ifdef APP-PLUS
				version: plus.runtime.version
				// #endif
			}
		},
		onLoad() {
			this.getStorageSize()
		},
		methods: {
			getStorageSize() {
				let that = this;
				plus.cache.calculate(function(size) { //size是多少个字节单位是b
				console.log(size);
				    //做下面相应的处理
				    if (size < 1024) {
				        that.storageSize = size + 'B';
				    } else if (size / 1024 >= 1 && size / 1024 / 1024 < 1) {
				        that.storageSize = Math.floor(size / 1024 * 100) / 100 + 'KB';
				    } else if (size / 1024 / 1024 >= 1) {
				        that.storageSize = Math.floor(size / 1024 / 1024 * 100) / 100 + 'M';
				    }
				});
			},

			clearCache() {
				let that = this;
				let os = plus.os.name;
				console.log(os);
				if (os == 'Android') {
					let main = plus.android.runtimeMainActivity();
					let sdRoot = main.getCacheDir();
					let files = plus.android.invoke(sdRoot, "listFiles");
					let len = files.length;
					for (let i = 0; i < len; i++) {
						let filePath = '' + files[i]; // 没有找到合适的方法获取路径，这样写可以转成文件路径  
						plus.io.resolveLocalFileSystemURL(filePath, function(entry) {
							if (entry.isDirectory) {
								entry.removeRecursively(function(entry) { //递归删除其下的所有文件及子目录  
									that.$refs.uToast.show({
										title: '清除缓存成功~',
										type: 'default',
										position: 'bottom'
									})
									that.getStorageSize(); // 重新计算缓存  
								}, function(e) {
									console.log(e.message)
								});
							} else {
								entry.remove();
							}
						}, function(e) {
							console.log('文件路径读取失败')
						});
					}
				} else { // ios  
					plus.cache.clear(function() {
						that.$refs.uToast.show({
							title: '清除缓存成功~',
							type: 'default',
							position: 'bottom'
						})
						that.getStorageSize();
					});
				}
			},
			goUrl(url) {
				uni.navigateTo({
					url: './' + url
				})
			},

			openModel(type) {
				this.modelType = type;
				if (this.modelType == 'clean') {
					this.content = '确定要清楚缓存吗？';
					this.showModel = true;
				} else if (this.modelType == 'logout') {
					this.content = '确定要退出当前账号吗？';
					this.showModel = true;
				}
			},

			confirm() {
				if (this.modelType == 'clean') {
					this.modelType = '';
					this.content = '';
					this.clearCache();
					this.showModel = false;
				} else if (this.modelType == 'logout') {
					this.showModel = false;
					try {
						uni.removeStorageSync('userInfo');
						uni.reLaunch({
							url: '../../login/login'
						})
					} catch (e) {
						// error
					}
				}
			},

			unsupport() {
				this.$refs.uToast.show({
					title: '此版本暂不支持该功能哦~',
					type: 'warning',
					position: 'bottom'
				})
			}
		}
	}
</script>

<style lang="scss">
	.setting-wrapper {
		.body-container {
			width: 100%;
			margin-top: 20rpx;

			.infoContainer {
				width: 100%;
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

			.logOut {
				width: 100%;
				height: 100rpx;
				margin-top: 20rpx;
				background-color: #FFFFFF;

				.outText {
					font-size: 28rpx;
					font-weight: 500;
					color: #333333;
				}
			}
		}
	}
</style>
