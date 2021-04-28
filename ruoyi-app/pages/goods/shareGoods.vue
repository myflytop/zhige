<template>
	<view class="shareGoods-wrapper wrapperLayer borderBox">
		<titleBar :titleText='"商品分享"' :pageForm='"shareGoods"'></titleBar>
		<view class="pageContent-container colCen borderBox">
			<view class="sharePic-container colCen">
				<view class="box-title borderBox">
					分享图片（只可选择一张图片）
				</view>
				<view class="goods-container rowCen">
					<scroll-view scroll-x class="picScroll rowCen">
						<block v-for="(items,index) in optionsInfo.searchSource==3?optionsInfo.imageList:optionsInfo.showImgs">
							<view class="picItems">
								<view class="pic-Container defIcon">
									<image :src="items.url" mode=""></image>
									<image @tap="chooseImg(items.url,index)" class="hook" :src="'../../static/images/goods/'+(index==imgCurrent?'check.png':'nocheck.png')"
									 mode="aspectFill"></image>
								</view>
							</view>
						</block>
					</scroll-view>
				</view>
			</view>

			<view class="sharePic-container colCen">
				<view class="box-title borderBox">
					分享文案
				</view>
				<view class="copyWriting">
					<view class="textbox">
						{{optionsInfo.shopName}} {{optionsInfo.dtitle}}</br>
						【原价】{{optionsInfo.originalPrice}}元</br>
						【券后】{{optionsInfo.actualPrice}}元</br>
						{{pageType==1?'【复制此信息打开手机淘宝即可查看并下单】':'【复制下方链接】'}}</br>
						{{pageType==1?tbText:copyCode}}</br>
						{{optionsInfo.desc=='' || optionsInfo.desc==undefined?'':'【必买理由】' + optionsInfo.desc}}
					</view>
				</view>
			</view>

			<view class="bottom-btnContainer rowCenBet">
				<view class="btnbox copybtn rowCenCen" @tap="copy()">
					<view>复制文案</view>
				</view>
				<view class="btnbox sharebtn rowCenCen" @tap="drawCanvas()">
					<view>制作海报分享</view>
				</view>
			</view>
		</view>

		<u-toast ref="uToast" />
		<u-popup v-model="posterShow" mode="bottom" border-radius="22">
			<view class="model-container colCen">
				<view class="canvasbox" @tap="closeMode()">
					<canvas @click.stop='()=>{return false}' canvas-id="sharePoster" :style="{ width: canvasInfo.canvasW + 'px', height: canvasInfo.canvasH + 'px' }"></canvas>
				</view>
				<view class="share-mode colCen">
					<view class="mode-title rowCenCen">
						<view class="border-grey"></view>
						<view class="title-text">
							分享方式
						</view>
						<view class="border-grey"></view>
					</view>
					<view class="modeList-container rowCenCen">
						<view class="mode-items colCenCen" @tap="saveimg()">
							<view class="iconbox defIcon">
								<image src="@/static/images/app/saveimg.png" mode="aspectFill"></image>
							</view>
							<view class="icontext">
								保存图片
							</view>
						</view>
					</view>
				</view>
			</view>
		</u-popup>
		<canvas canvas-id="qrcode" class="canvass" style="width: 260rpx;height: 260rpx;opacity: 0;" />
	</view>
</template>

<script>
	import titleBar from '../../components/backTitlebar.vue'
	import uQRCode from '../../utils/qrcode.js'
	let qrcode
	export default {
		components: {
			titleBar
		},
		data() {
			return {
				optionsInfo: '',
				memberId: '',
				imgCurrent: 0,
				textContent: '我就开始了放假哦撒娇佛萨加咖啡拉萨解放',

				posterShow: false,
				canvasInfo: {
					canvasW: 750,
					canvasH: ''
				},
				CVS: null,
				pageType: '',
				Jumpurl: '',

				tbText: '',
				codeSrc: '',
				copyCode: '',
				bannerPic: '',
				sharePostUrl: '',
				
				shakeprof:true
			}
		},
		onLoad(options) {
			try {
				const value = uni.getStorageSync('userInfo');
				if (value) {
					this.memberId = value.memberId
				} else {
					this.memberId = ''
				}
			} catch (e) {
				this.memberId = ''
			}
			console.log(JSON.parse(options.info));
			this.optionsInfo = JSON.parse(options.info);
			this.pageType = this.optionsInfo.searchSource
			this.bannerPic = this.pageType == 3 ? this.optionsInfo.imageList[0].url : this.optionsInfo.showImgs[0].url
			this.getJumpUrl()
		},
		methods: {
			closeMode(e) {
				this.posterShow = false
			},
			copy() {
				var txtdata = '0' + this.optionsInfo.shopName +
					this.optionsInfo.dtitle +
					'\n【原价】' +
					this.optionsInfo.originalPrice +
					'元\n【券后】' +
					this.optionsInfo.actualPrice +
					(this.pageType == 1 ? ('\n【复制此信息打开手机淘宝即可查看并下单】') : ('【复制下方链接】')) +
					'\n' + (this.pageType == 1 ? this.tbText : this.copyCode) +
					'\n' +
					(this.optionsInfo.desc === '' ? this.optionsInfo.desc : ('【必买理由】' + this.optionsInfo.desc))
				uni.setClipboardData({
					data: txtdata,
					success: res => {
						console.log(res)
						uni.setStorage({
							key: 'clipboard',
							data: txtdata,
							success: res => {
								console.log('succes');
							}
						})
					}
				});
			},

			chooseImg(url, idx) {
				this.imgCurrent = idx
				this.bannerPic = url
			},

			async drawCanvas() {
				if(this.shakeprof){
					this.shakeprof = false
					this.CVS = uni.createCanvasContext('sharePoster', this);
					
					this.canvasInfo.canvasW = 750
					this.canvasInfo.canvasH = 0
					
					
					const C_W = uni.upx2px(this.canvasInfo.canvasW * 0.7),
						C_pad = uni.upx2px(32),
						C_code = uni.upx2px(260);
					
					let textW = 0;
					
					let goodsPic = await this.getImageInfo(this.bannerPic); //广告图
					
					let qrcode = await this.getImageInfo(this.codeSrc);
					let gds = [goodsPic.width, goodsPic.height];
					let qinfo = [260, 260];
					let imgW = C_W - C_pad * 2;
					if (gds[0] != imgW) {
						gds[1] = Math.floor((imgW / gds[0]) * gds[1]);
						gds[0] = imgW; //图片填充屏幕
					}
					if (qinfo[0] != C_code) {
						qinfo[1] = Math.floor((C_code / qinfo[0]) * qinfo[1]);
						qinfo[0] = C_code;
					}
					this.canvasInfo.canvasW = C_W;
					this.canvasInfo.canvasH = gds[1] + qinfo[1] + 120;
					// this.canvasInfo.canvasH = gds[1] + ;
					this.CVS.setFillStyle('white'); //canvas背景颜色
					console.log(C_W);
					this.CVS.fillRect(0, 0, C_W, this.canvasInfo.canvasH); //canvas画布大小
					
					// //添加图片展示
					this.CVS.drawImage(goodsPic.path, C_pad, C_pad, gds[0], gds[1]);
					
					// //设置文本
					this.CVS.setFontSize(uni.upx2px(36)); //设置标题字体大小
					this.CVS.setFillStyle('#222222'); //设置标题文本颜色
					let _strLastIndex = 0; //每次开始截取的字符串的索引
					let txtHeight = gds[1] + C_pad * 2 + 10; //绘制字体距离canvas顶部的初始高度
					for (let i = 0; i < this.optionsInfo.dtitle.length; i++) {
						textW += this.CVS.measureText(this.optionsInfo.dtitle[i]).width;
						if (textW > gds[0]) {
							this.CVS.fillText(this.optionsInfo.dtitle.substring(_strLastIndex, i) + '...', C_pad, txtHeight);
							i = this.optionsInfo.dtitle.length
							textW = 0;
							_strLastIndex = i;
						} else if (i == this.optionsInfo.dtitle.length - 1) {
							this.CVS.fillText(this.optionsInfo.dtitle.substring(_strLastIndex, i + 1), C_pad, txtHeight);
							textW = 0;
						}
					}
					
					// //设置价格
					textW = C_pad;
					txtHeight += uni.upx2px(80);
					if (this.optionsInfo.actualPrice != '') {
						//判断是否有销售价格
						this.CVS.setFillStyle('#FF4242');
						this.CVS.setFontSize(uni.upx2px(36));
						this.CVS.fillText('券后价 ￥' + this.optionsInfo.actualPrice, textW, txtHeight); //商品价格
						// _strlineW += _this.ctx.measureText('券后价 ￥' + _this.PriceTxt).width + uni.upx2px(10);
					}
					
					// //添加二维码 
					txtHeight += uni.upx2px(30);
					this.CVS.drawImage(this.codeSrc, (C_W - qinfo[0]) / 2, txtHeight, qinfo[0], qinfo[1]);
					
					// //延迟后渲染至canvas上
					this.posterShow = true
					setTimeout(() => {
						this.CVS.draw(false, res => {
							console.log(res);
							uni.canvasToTempFilePath({
								canvasId: 'sharePoster',
								success: ress => {
									console.log(ress);
									this.sharePostUrl = ress.tempFilePath
									this.shakeprof = true
								}
							});
						});
					}, 300);
				}
			},

			async getImageInfo(imgSrc) {
				return new Promise((resolve, errs) => {
					uni.getImageInfo({
						src: imgSrc,
						success: image => {
							resolve(image);
						},
						fail: err => {
							errs(err);
							uni.hideLoading()
						}
					});
				});
			},

			async makeQRcode() {
				// 同步等待
				qrcode = new uQRCode({
					context: this, // 上下文环境
					canvasId: 'qrcode', // canvas-id
					usingComponents: false, // 是否是自定义组件
					loadingText: '', // loading文字
					text: this.Jumpurl, // 生成内容
					size: 130, // 二维码大小
					cbResult: res => { // 生成二维码的回调
						this.codeSrc = res
					},
				});
			},


			getJumpUrl() {
				if (this.pageType == 1) {
					this.$http.post('tb/getPrivilegeLink', {
						goodsId: this.optionsInfo.goodsId,
					}, 'application/json', true).then(res => {
						this.Jumpurl = res.kuaiZhanUrl
						this.tbText = res.tpwd
						var long = res.longTpwd
						if (res.kuaiZhanUrl) {
							this.makeQRcode()
						} else {
							uni.request({
								url: '', //仅为示例，并非真实接口地址。
								/**
								 * 此接口设计安全问题,分享接口请自行编写
								 */
								data: {
									goodsId: this.optionsInfo.goodsId,
									mainPic: this.bannerPic,
									dtitle: this.optionsInfo.dtitle,
									actualPrice: this.optionsInfo.actualPrice,
									originalPrice: this.optionsInfo.originalPrice,
									couponInfo: this.optionsInfo.originalPrice - this.optionsInfo.actualPrice,
									memberId: this.memberId,
									couponEndTime: this.optionsInfo.couponEndTime,
									tpwd: this.tbText,
									longTpwd:long,
									appkey:'huaxiang'
								},
								header: {
									"content-type": 'application/json',
									"token": '',
								},
								method: "POST",
								success: (res) => {
									this.Jumpurl = res.data.data
									console.log(res.data);
									this.makeQRcode()
								}
							});
						}
					})
				} else if (this.pageType == 2) {
					this.$http.post('pddgoods/generate', {
						goodsIdList: this.optionsInfo.goodsId,
						memberId: this.memberId
					}, 'application/json', true).then(res => {
						console.log(res);
						this.Jumpurl = res.mobileShortUrl
						this.copyCode = res.shortUrl
						this.makeQRcode()
					})
				} else if (this.pageType == 3) {
					this.$http.post('jd/getUnionurl', {
						goodsId: this.optionsInfo.goodsId,
					}, 'application/json', true).then(res => {
						console.log(res);
						this.Jumpurl = res.link
						this.copyCode = res.link
						this.makeQRcode()
					})
				}
			},
			prevent() {
				return false
			},
			saveimg() {
				uni.saveImageToPhotosAlbum({
					filePath: this.sharePostUrl,
					success: res => {
						this.$refs.uToast.show({
							title: '保存成功，快去分享吧~',
							type: 'success',
							position: 'bottom'
						})
						this.closeMode()
					},
					fail(err) {
						console.log(err);
					},
				});
			}
		}
	}
</script>

<style lang="scss">
	.shareGoods-wrapper {
		width: 100%;

		.pageContent-container {
			width: 100%;

			.sharePic-container {
				width: 100%;

				.box-title {
					width: 100%;
					padding: 20rpx 32rpx;
				}

				.goods-container {
					width: 100%;
					height: 265rpx;
					background-color: #FFFFFF;

					.picScroll {
						width: 100%;
						white-space: nowrap;
						padding: 0 32rpx;

						.picItems {
							display: inline-flex;
							margin-right: 20rpx;

							.pic-Container {
								width: 200rpx;
								height: 200rpx;
								border-radius: 8rpx;
								overflow: hidden;
								position: relative;

								.hook {
									width: 32rpx;
									height: 32rpx;
									z-index: 10;
									top: 5rpx;
									right: 5rpx;
									position: absolute;
								}
							}
						}
					}
				}

				.copyWriting {
					width: 100%;
					padding: 0 32rpx;

					.textbox {
						background: #FFFFFF;
						border-radius: 10rpx;
						font-size: 26rpx;
						font-weight: 500;
						color: #333333;
						line-height: 44rpx;
						padding: 20rpx 25rpx;
					}
				}
			}

			.bottom-btnContainer {
				width: 100%;
				padding: 0 85rpx;
				margin-top: 30rpx;

				.btnbox {
					width: 200rpx;
					height: 60rpx;
					border-radius: 30rpx;
					font-size: 24rpx;
					font-weight: 500;
				}

				.copybtn {
					color: #FF4242;
					background: #FDDFDF;
				}

				.sharebtn {
					color: #FFFFFF;
					background: #FC0000;
				}
			}
		}

		.model-container {
			width: 100%;
			background-color: transparent;

			.canvasbox {
				width: 100%;
				display: flex;
				justify-content: center;
			}

			.share-mode {
				width: 100%;
				margin-top: 80rpx;
				background-color: #FFFFFF;
				border-top-left-radius: 12rpx;
				border-top-right-radius: 12rpx;

				.mode-title {
					height: 60rpx;
					font-size: 24rpx;
					font-weight: 500;
					color: #999999;

					.title-text {
						margin: 0 50rpx;
					}

					.border-grey {
						width: 70rpx;
						height: 1rpx;
						background-color: #EFF1F7;
					}
				}

				.modeList-container {
					width: 100%;

					.mode-items {
						width: 25%;
						height: 160rpx;

						.iconbox {
							width: 80rpx;
							height: 80rpx;
							border-radius: 50%;
							overflow: hidden;
							z-index: 10;
						}

						.icontext {
							font-size: 28rpx;
							font-weight: 400;
							color: #333333;
							margin-top: 20rpx;
						}
					}
				}
			}
		}
	}

	.canvass {
		position: fixed;
		bottom: 0;
		pointer-events: none;
	}

	/deep/.u-drawer {
		.u-drawer-bottom {
			background-color: transparent !important;
		}
	}
</style>
