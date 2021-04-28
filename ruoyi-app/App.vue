<script>
	import utils from './utils/utils.js'
	// #ifdef APP-PLUS
	import idfa from './utils/idfa.js'
	import APPUpdate from "@/utils/appUpdate.js";
	import getClipboard from '@/utils/getClipboard.js'
	// #endif
	export default {
		onLaunch: function() {
			// #ifdef APP-PLUS
			APPUpdate();
			// #endif
			console.log('App Launch')
			console.log('bug多？换一加。I’m the iron man!!!!!!!!')
			console.log('九朵云淘宝客。https://www.jiuduoyun.net/')
			this.getAppInfo()
			uni.getSystemInfo({
				success: e => {
					console.log(this.globalData);
					// #ifdef APP-PLUS
					if (e.platform == 'android') {
						this.globalData.platform = 'android'
						this.globalData.systemLevel = e.system
						if (e.system < 10) {
							plus.device.getInfo({
								success: e => {
									console.log(e);
									//这里获取到imei 剩下的逻辑也写在这里面
									var a = e.imei.indexOf(",")
									if (a < 0) {
										this.globalData.equipmentNumber = e.imei
									} else {
										this.globalData.equipmentNumber = e.imei.substring(0, a);
									}
									//里面写接下来的逻辑
									console.log('imei=' + imei); //这里是能获取imei的
								}
							})
						} else {
							plus.device.getOAID({
								success: e => {
									console.log('getOAID success: ' + e.oaid);
									this.globalData.equipmentNumber = e.oaid;
								}
							});
						}
					} else {
						this.globalData.platform = 'ios';
						this.globalData.systemLevel = e.system;
						this.globalData.equipmentNumber = idfa.value()
					};
					// #endif
				}
			})
		},
		globalData: {
			platform: '',
			systemLevel: '',
			equipmentNumber: '',
			userInfo: {},
			canlisten:false,
			appinfo:{}
		},
		onShow: function() {
			console.log('App Show')
			// #ifdef APP-PLUS
				if(this.globalData.canlisten){
					getClipboard()
				}
			// #endif
		},
		onHide: function() {
			console.log('App Hide')
		},
		methods: {
			getAppInfo: function() {
				this.$http.post('cpssystemConfig/getAPPInfo').then(res => {
					console.log(res);
					this.globalData.appinfo = res
					utils.setCache('appInfo', res)
				})
			},
		},
	}
</script>

<style>
	/*每个页面公共css */
	/* #ifndef APP-NVUE */
	@import url('./static/css/main.css');
	@import url('./colorui/main.css');
	@import url('./colorui/icon.css');

	page {
		color: #333333;
		font-size: 30rpx;
		font-family: PingFangSC-Regular, PingFang SC;
		font-weight: 500;
		background-color: #F0F1F7;
	}

	/* #endif */
</style>
