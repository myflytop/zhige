// #ifdef APP-PLUS
import request from './http.js'
/**** 此文件说明请看注释 


淘宝客技术支持 https://www.jiuduoyun.net/ 
git开源地址 https://gitee.com/s55555/taobao-customer-uniapp-version
禁止二次售卖

*****/

function getclick(callback) {
	try {
		const value = uni.getStorageSync('clipboard');
		if (value) {
			console.log(value)
			var nowClipData = value
		}
	} catch (e) {
		var nowClipData = ''
	}
	uni.getClipboardData({
		success: data => {
			console.log(data);
			if (nowClipData != data.data) {
				if (data.data != '') {
					request.post("tb/parseContent", {
						content: data.data
					}, 'application/json').then(res => {
						callback(res)
					});
				}
			} else {
				uni.setStorage({
					key: 'clipboard',
					data: data.data,
					success: res => {
						console.log('succes');
					}
				})
			}
		}
	});
}

// 是否更新弹窗
function updatePopup(data) {
	console.log(data);
	// 弹窗遮罩层
	let maskLayers = new plus.nativeObj.View("maskLayers", { //先创建遮罩层
		top: '0px',
		left: '0px',
		height: '100%',
		width: '100%',
		backgroundColor: 'rgba(0,0,0,0.5)'
	});

	// 以下为计算菜单的nview绘制布局，为固定算法，使用者无需关心
	const screenWidth = plus.screen.resolutionWidth;
	const screenHeight = plus.screen.resolutionHeight;
	//弹窗容器宽度
	// 弹窗容器的Padding
	const popupViewWidth = uni.upx2px(550);
	const viewContentPadding = uni.upx2px(20);
	// 弹窗容器的宽度
	const viewContentWidth = parseInt(popupViewWidth - viewContentPadding * 2);
	// 显示弹窗
	maskLayers.show();

	if (data.goodsId) {
		let sLeft = 0;
		let popupViewHeight = popupViewWidth + uni.upx2px(390);
		sLeft = (data.price.length + 1) * uni.upx2px(30);
		// 弹窗内容
		var clipViews = new plus.nativeObj.View("clipViews", { //创建底部图标菜单
			tag: "rect",
			top: (screenHeight - popupViewHeight) / 2 + "px",
			left: (screenWidth - popupViewWidth) / 2 + "px",
			height: popupViewHeight + "px",
			width: popupViewWidth + "px",
		});

		clipViews.drawRect({
			color: "#FFFFFF",
			radius: "8px"
		}, {
			top: "0px",
			height: popupViewHeight - uni.upx2px(100) + "px",
		});


		var popupViewContentList = [{
				src: data.image,
				id: "picimage",
				tag: "img",
				position: {
					top: viewContentPadding + "px",
					left: viewContentPadding + "px",
					width: popupViewWidth - viewContentPadding * 2 + "px",
					height: popupViewWidth - viewContentPadding * 2 + "px",
				}
			},
			{
				tag: 'font',
				id: 'title',
				text: data.title,
				textStyles: {
					size: uni.upx2px(28) + "px",
					color: "#333",
					align: "left",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(20) + "px",
					left: viewContentPadding + "px",
					width: viewContentWidth + "px",
					height: "30px",
				}
			},
			{
				src: './static/images/app/coubac.png',
				id: "couimg",
				tag: "img",
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(80) + "px",
					left: viewContentPadding + "px",
					width: uni.upx2px(110) + "px",
					height: uni.upx2px(36) + "px",
				}
			},
			{
				tag: 'font',
				id: 'coupontxt',
				text: data.amount + "元券",
				textStyles: {
					size: uni.upx2px(22) + "px",
					color: "#fff",
					align: "left",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(80) + "px",
					left: viewContentPadding + uni.upx2px(24) + "px",
					width: viewContentWidth + "px",
					height: uni.upx2px(36) + "px",
				}
			},
			{
				tag: 'font',
				id: 'actualPricetxt',
				text: "￥" + data.amount,
				textStyles: {
					size: uni.upx2px(36) + "px",
					color: "#FF4242",
					align: "left",
					weight: "bold",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(130) + "px",
					left: viewContentPadding + "px",
					width: viewContentWidth + "px",
					height: uni.upx2px(32) + "px",
				}
			},
			{
				tag: 'font',
				id: 'price',
				text: "￥" + data.price,
				textStyles: {
					size: uni.upx2px(24) + "px",
					color: "#999999",
					align: "left",
					weight: "normal",
					decoration: "line-through",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(130) + "px",
					left: viewContentPadding + sLeft + "px",
					width: viewContentWidth + "px",
					height: uni.upx2px(36) + "px",
				}
			},
			{
				tag: 'font',
				id: 'copytxt',
				text: "复制口令",
				textStyles: {
					size: uni.upx2px(30) + "px",
					color: "#fff",
					align: "center",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(210) + "px",
					left: viewContentPadding + 'px',
					width: (popupViewWidth - uni.upx2px(55)) / 2 + 'px',
					height: uni.upx2px(76) + "px"
				}
			},
			{
				tag: 'font',
				id: 'gopathbtn',
				text: "领取优惠",
				textStyles: {
					size: uni.upx2px(30) + "px",
					color: "#fff",
					align: "center",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: popupViewWidth - viewContentPadding + uni.upx2px(210) + "px",
					left: popupViewWidth / 2 + uni.upx2px(15) + 'px',
					width: (popupViewWidth - uni.upx2px(55)) / 2 + 'px',
					height: uni.upx2px(76) + "px"
				}
			},
			{
				src: './static/images/app/close.png',
				id: "closeicon",
				tag: "img",
				position: {
					top: popupViewHeight - uni.upx2px(50) + "px",
					left: (popupViewWidth - uni.upx2px(50)) / 2 + "px",
					width: uni.upx2px(50) + "px",
					height: uni.upx2px(50) + "px",
				}
			},
		];

		clipViews.drawRect({
			radius: uni.upx2px(38) + "px",
			color: "#FC842D",
		}, {
			top: popupViewWidth - viewContentPadding + uni.upx2px(210) + "px",
			left: viewContentPadding + 'px',
			width: (popupViewWidth - uni.upx2px(55)) / 2 + 'px',
			height: uni.upx2px(76) + "px"
		});

		clipViews.drawRect({
			radius: uni.upx2px(38) + "px",
			color: "#ED2353",
		}, {
			top: popupViewWidth - viewContentPadding + uni.upx2px(210) + "px",
			left: popupViewWidth / 2 + uni.upx2px(15) + 'px',
			width: (popupViewWidth - uni.upx2px(55)) / 2 + 'px',
			height: uni.upx2px(76) + "px"
		});

		clipViews.draw(popupViewContentList);

		clipViews.addEventListener("click", function(e) {
			console.log(e);
			let bottom = popupViewHeight - uni.upx2px(50);
			let bottomLeft = (popupViewWidth - uni.upx2px(50)) / 2;

			if (e.clientY + 10 > popupViewHeight - uni.upx2px(50) && e.clientX + 10 > bottomLeft && e.clientX - 10 <
				bottomLeft + uni.upx2px(50)) {
				console.log('点了叉叉');
				maskLayers.hide();
				clipViews.hide();
			}

			let btntop = popupViewWidth - viewContentPadding + uni.upx2px(210)
			let btnbtm = popupViewWidth - viewContentPadding + uni.upx2px(290)
			console.log(btnbtm);

			if (e.clientY > btntop && e.clientY < btnbtm) {
				let copyLeft = uni.upx2px(20)
				let copyright = popupViewWidth / 2 - uni.upx2px(15)
				let goLeft = popupViewWidth / 2 + uni.upx2px(15)
				let goright = popupViewWidth - uni.upx2px(20)
				if (e.clientX > copyLeft && e.clientX < copyright) {
					console.log('点击了复制');
					uni.setClipboardData({
						data: data.tpwd,
						success: function() {
							console.log('success');
							uni.setStorage({
								key: 'clipboard',
								data: data.tpwd,
								success: res => {
									console.log('succes');
									maskLayers.hide();
									clipViews.hide();
								}
							})
						}
					});
				}
				if (e.clientX > goLeft && e.clientX < goright) {
					console.log('点击了领取优惠');
					uni.navigateTo({
						url: '/pages/goods/goodsDetail?id=' + data.goodsId
					})
					maskLayers.hide();
					clipViews.hide();
				}
			}
		})
		clipViews.show();
	} else {
		console.log('没有搜索到');
		console.log(screenWidth);
		let popupViewHeight = uni.upx2px(640);
		// 弹窗内容
		var nogoodsIdwrap = new plus.nativeObj.View("nogoodsIdwrap", { //创建底部图标菜单
			tag: "rect",
			top: (screenHeight - popupViewHeight) / 2 + "px",
			left: (screenWidth - popupViewWidth) / 2 + "px",
			height: popupViewHeight + "px",
			width: popupViewWidth + "px",
		});

		var nogoodsContentList = [{
				tag: 'font',
				id: 'titletips',
				text: '智能搜索优惠券',
				textStyles: {
					size: uni.upx2px(30) + "px",
					color: "#333333",
					align: "center",
					weight: "bold",
					whiteSpace: "nowrap",
					overflow: 'ellipsis'
				},
				position: {
					top: uni.upx2px(50) + "px",
					left: "0px",
					width: viewContentWidth + "px",
					height: uni.upx2px(30) + "px",
				}
			},
			{
				tag: 'font',
				id: 'originalContentTxt',
				text: data.originalContent,
				textStyles: {
					size: uni.upx2px(24) + "px",
					color: "#333333",
					align: "left",
					weight: "nowrap",
					whiteSpace: "normal",
					overflow: 'ellipsis',
					lineSpacing: '100%',
					verticalAlign: 'middle'
				},
				position: {
					top: uni.upx2px(130) + "px",
					left: uni.upx2px(50) + "px",
					width: popupViewWidth - uni.upx2px(50) * 2,
					height: uni.upx2px(130) + "px",
				}
			},
			{
				tag: 'font',
				id: 'searchbtnTxt',
				text: '搜索淘宝/天猫',
				textStyles: {
					size: uni.upx2px(30) + "px",
					color: "#ffffff",
					align: "center",
					weight: "normal",
					overflow: 'ellipsis',
					lineSpacing: '100%',
					verticalAlign: 'middle'
				},
				position: {
					top: uni.upx2px(310) + "px",
					left: uni.upx2px(50) + "px",
					width: popupViewWidth - uni.upx2px(50) * 2,
					height: uni.upx2px(76) + "px",
				}
			},
			{
				tag: 'font',
				id: 'bottomtxt',
				text: '搜索其他平台',
				textStyles: {
					size: uni.upx2px(24) + "px",
					color: "#333333",
					align: "center",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis',
					verticalAlign: 'middle'
				},
				position: {
					top: uni.upx2px(430) + "px",
					left: uni.upx2px(0) + "px",
					width: popupViewWidth,
					height: uni.upx2px(24) + "px",
				}
			},
			{
				tag: 'font',
				id: 'jdtxt',
				text: '京东',
				textStyles: {
					size: uni.upx2px(24) + "px",
					color: "#333333",
					align: "center",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis',
					verticalAlign: 'middle'
				},
				position: {
					top: uni.upx2px(580) + "px",
					left: uni.upx2px(165) + "px",
					width: uni.upx2px(74) + "px",
					height: uni.upx2px(24) + "px",
				}
			},
			{
				tag: 'font',
				id: 'pddtxt',
				text: '拼多多',
				textStyles: {
					size: uni.upx2px(24) + "px",
					color: "#333333",
					align: "center",
					weight: "normal",
					whiteSpace: "nowrap",
					overflow: 'ellipsis',
					verticalAlign: 'middle'
				},
				position: {
					top: uni.upx2px(580) + "px",
					left: uni.upx2px(275) + "px",
					width: uni.upx2px(74) + "px",
					height: uni.upx2px(24) + "px",
				}
			},
			{
				src: './static/images/app/jd.png',
				tag: 'img',
				id: 'jd',
				position: {
					top: uni.upx2px(490) + "px",
					left: uni.upx2px(165) + "px",
					width: uni.upx2px(74) + "px",
					height: uni.upx2px(74) + "px",
				}
			},
			{
				src: './static/images/app/pdd.png',
				tag: 'img',
				id: 'pdd',
				position: {
					top: uni.upx2px(490) + "px",
					left: uni.upx2px(275) + "px",
					width: uni.upx2px(74) + "px",
					height: uni.upx2px(74) + "px",
				}
			},
		];

		nogoodsIdwrap.drawRect({
			color: "#FFFFFF",
			radius: "8px"
		}, {
			top: "0px",
			height: popupViewHeight + "px",
		});

		nogoodsIdwrap.drawRect({
			color: "#F7F7F7",
			radius: "8px"
		}, {
			top: uni.upx2px(130) + "px",
			left: uni.upx2px(30) + "px",
			width: popupViewWidth - uni.upx2px(30) * 2 + "px",
			height: uni.upx2px(130) + "px",
		});

		nogoodsIdwrap.drawRect({
			color: "#FD002F",
			radius: uni.upx2px(38) + "px"
		}, {
			top: uni.upx2px(310) + "px",
			left: uni.upx2px(50) + "px",
			width: popupViewWidth - uni.upx2px(50) * 2 + "px",
			height: uni.upx2px(76) + "px",
		});

		nogoodsIdwrap.drawRect({
			color: "#333",
			radius: uni.upx2px(38) + "px"
		}, {
			top: uni.upx2px(442) + "px",
			left: uni.upx2px(120) + "px",
			width: uni.upx2px(55) + "px",
			height: uni.upx2px(2) + "px",
		});

		nogoodsIdwrap.drawRect({
			color: "#333",
			radius: uni.upx2px(38) + "px"
		}, {
			top: uni.upx2px(442) + "px",
			left: popupViewWidth - uni.upx2px(175) + "px",
			width: uni.upx2px(55) + "px",
			height: uni.upx2px(2) + "px",
		});


		nogoodsIdwrap.draw(nogoodsContentList);

		nogoodsIdwrap.show()

		nogoodsIdwrap.addEventListener("click", function(e) {
			console.log(e);
			let btntop = uni.upx2px(310);
			let btnbtm = uni.upx2px(390);
			let btnlft = uni.upx2px(50);
			let btnrgt = popupViewWidth - uni.upx2px(50);

			if (e.clientY > btntop && e.clientY < btnbtm && e.clientX < btnrgt && e.clientX>btnlft) {
				console.log('去搜索页');
				uni.setStorage({
					key: 'clipboard',
					data: data.originalContent,
					success: res => {
						console.log('succes');
						maskLayers.hide();
						nogoodsIdwrap.hide();
						uni.navigateTo({
							url:'/pages/search/searchResult?storetype=0&searchText='+ data.originalContent
						})
					}
				})
			}

			let icontop = uni.upx2px(490)
			let iconbtm = uni.upx2px(600)
			let jdleft = uni.upx2px(165)
			let jdrgt = uni.upx2px(240)
			let pddleft = uni.upx2px(275)
			let pddrgt = uni.upx2px(350)
			
			if (e.clientY > icontop && e.clientY < iconbtm){
				if(e.clientX < jdrgt && e.clientX>jdleft){
					console.log('去jd');
					uni.setStorage({
						key: 'clipboard',
						data: data.originalContent,
						success: res => {
							console.log('succes');
							maskLayers.hide();
							nogoodsIdwrap.hide();
							uni.navigateTo({
								url: '/pages/search/searchResult?type=1&searchText='+ data.originalContent
							})
						}
					})
				}
				
				if(e.clientX < pddrgt && e.clientX > pddleft){
					console.log('去pdd');
					uni.setStorage({
						key: 'clipboard',
						data: data.originalContent,
						success: res => {
							console.log('succes');
							maskLayers.hide();
							nogoodsIdwrap.hide();
							uni.navigateTo({
								url: '/pages/search/searchResult?type=2&searchText='+ data.originalContent
							})
						}
					})
				}
			}

		})
	}
	maskLayers.addEventListener("click", function() { //处理遮罩层点击
		uni.setStorage({
			key: 'clipboard',
			data: data.originalContent,
			success: res => {
				console.log('succes');
				maskLayers.hide();
				if (nogoodsIdwrap) {
					nogoodsIdwrap.hide()
				} else {
					clipViews.hide();
				}
			}
		})
	});
}

export default () => {
	getclick(res => {
		console.log(res);
		updatePopup(res)
	})
	// updatePopup()
}
// #endif
