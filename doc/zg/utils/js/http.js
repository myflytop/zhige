

var requestheader;
var request = {};
var httpUrl='http://127.0.0.1/';

function getHttpUrl(url){
	if(url.indexOf("http")==-1)
	{
		return httpUrl+url;
	}
	else{
		return url;
	}
	
}

/**发起post请求
 * @param {Object} url 请求路径
 * @param {Object} data 请求数据 
 * @param {Object} requestheader 请求头
 * @param {boolean} showlaoding 展示动画
 * @param {Object} complete  完成请求
 */
request.post = function(url, data, requestheader, showlaoding, complete) {
	uni.getNetworkType({
	    success: res => {
	        console.log(res.networkType);
			if(res.networkType=='none'){
				//网络错误
				uni.navigateTo({
					url:'/pages/error/noNet/noNet.vue'
				})
			}
	    }
	});
	requestheader = requestheader || "application/x-www-form-urlencoded";
	console.log("POST-URL：" + url, data);
	if (showlaoding) {
		uni.showLoading({
			title: ''
		})
	}

	var startTime = new Date();
	return new Promise((succ, error) => {
		uni.request({
			url: getHttpUrl(url),
			data: data,
			method: "POST",
			header: {
				"content-type": requestheader
			},
			success: function(result) {
				if (typeof succ == "function") {
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
				if (typeof complete == "function") {
					complete(c);
				}
			}
		})
	})
}

//发起get请求
/**
 * @param {Object} url 请求缀
 * @param {Object} data 参数
 * @param {Object} showlaoding 请求动画
 */
request.get = function(url, data, showlaoding) {
	requestheader = requestheader || "application/x-www-form-urlencoded";
	if (showlaoding) {
		uni.showLoading({
			title: ''
		})
	}
	return new Promise((succ, error) => {
		uni.request({
			url: getHttpUrl(url),
			data: data,
			method: "GET",
			header: {
				"content-type": requestheader
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
