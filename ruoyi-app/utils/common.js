export default{
	topHeight:function () {
		var height; 
		uni.createSelectorQuery().select('.placeBox').boundingClientRect(data => {
			console.log("头部高度" + JSON.stringify(data.height));
			height = data.height
		}).exec();
		return height
	}
	// const topHeight =  getheaderTopHeight() {
		// uni.createSelectorQuery().select('.placeBox').boundingClientRect(data => {
		// 	console.log("头部高度" + JSON.stringify(data.height));
		// 	// return data.height;
		// }).exec();
	// }
}
