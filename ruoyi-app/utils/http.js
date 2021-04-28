import config from './config.js';

var requestheader;
var TOKEN;
var request = {}
var mobileInfo;
var appVersion;
// #ifdef APP-PLUS
mobileInfo = plus.os.name
appVersion = plus.runtime.version;
// #endif

/**** 此文件说明请看注释 


淘宝客技术支持 https://www.jiuduoyun.net/ 
git开源地址 https://gitee.com/s55555/taobao-customer-uniapp-version
禁止二次售卖

*****/
request.post = function(url, data, requestheader, showlaoding, complete) {
	uni.getNetworkType({
	    success: res => {
	        console.log(res.networkType);
			if(res.networkType=='none'){
				uni.navigateTo({
					url:'/pages/index/noNet'
				})
			}
	    }
	})
	requestheader = requestheader || "application/x-www-form-urlencoded";
	console.log("POST-URL：" + url, data);
	if (showlaoding) {
		uni.showLoading({
			title: ''
		})
	}
	try {
		const value = uni.getStorageSync('userInfo');
		if (value.token) {
			TOKEN = value.token
		} else {
			TOKEN = ''
		}
	} catch (e) {
		TOKEN = ''
	}
	var startTime = new Date();
	return new Promise((succ, error) => {
		uni.request({
			url: config.httpUrl + url,
			data: data,
			method: "POST",
			header: {
				"content-type": requestheader,
				"token": TOKEN,
				"mobileInfo":mobileInfo,
				"appVersion":appVersion
			},
			success: function(result) {
				if (typeof succ == "function") {
					// console.log(result.data);
					if (result.data.code == 0 ) {
						succ(result.data.data)
					} else if (result.data.code == 401) {
						console.log('dosomething');
					} else {
						error(result.data.data)
						uni.showToast({
							title: result.data.message,
							icon: 'none',
							position: 'bottom',
							duration: 3000
						});
					}
				}
			},
			fail: function(e) {
				console.log(e);
				if (typeof error == "function") {
					error(e)
				}
			},
			complete: function(c) {
				uni.hideLoading()
				var endTime = new Date();
				// console.log('request time ' + new Date(endTime - startTime).getTime());
				if (typeof complete == "function") {
					complete(c);
				}
			}
		})
	})
}


request.get = function(url, data, showlaoding) {
	requestheader = requestheader || "application/x-www-form-urlencoded";
	if (showlaoding) {
		uni.showLoading({
			title: ''
		})
	}
	try {
		const value = uni.getStorageSync('userInfo');
		if (value.token) {
			TOKEN = value.token
		} else {
			TOKEN = ''
		}
	} catch (e) {
		TOKEN = ''
	}
	return new Promise((succ, error) => {
		uni.request({
			url: config.httpUrl + url,
			data: data,
			method: "GET",
			header: {
				"content-type": requestheader,
				"token": TOKEN,
				"mobileInfo":mobileInfo,
				"appVersion":appVersion
			},
			success: function(result) {
				uni.hideLoading()
				if (typeof succ == "function") {
					succ(result.data.data)
				}
			},
			fail: function(e) {
				uni.hideLoading()
				if (typeof error == "function") {
					error(e)
				}
			},
		})
	})
}

export default request
