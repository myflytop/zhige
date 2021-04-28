var common = {};
/**** 此文件说明请看注释 


淘宝客技术支持 https://www.jiuduoyun.net/ 
git开源地址 https://gitee.com/s55555/taobao-customer-uniapp-version
禁止二次售卖

*****/
common.getCache = function(key) {
	return new Promise((succ, error) => {
		uni.getStorage({
			key: key,
			success: res => {
				succ(res.data)
			},
			fail: res => {
				console.log(res);
				error(res)
			}
		})
	})
}

common.getCacheSync = function(key) {
	try {
		const value = uni.getStorageSync(key);
		if (value) {
			return value
		}
	} catch (e) {
		return e
	}
}

common.setCache = function(key, data) {
	return new Promise((succ, error) => {
		uni.setStorage({
			key: key,
			data: data,
			success: res => {
				succ(res.data)
			},
			fail: res => {
				console.log(res);
				error(res)
			}
		})
	})
}




export default common
