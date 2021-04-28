<template>
	<view>
		<web-view :webview-styles="webviewStyles" :src="webviewUrl"></web-view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				webviewUrl: '',
				webviewStyles: {
					progress: {
						color: '#EE1B14'
					}
				}
			}
		},
		onLoad(options) {
			console.log(options);
			this.webviewUrl = encodeURI(options.url)
			console.log(this.webviewUrl);
		},
		onNavigationBarButtonTap(e) {
			// #ifdef APP-PLUS
			const currentWebview = this.$scope.$getAppWebview(); //此对象相当于html5plus里的plus.webview.currentWebview()。在uni-app里vue页面直接使用plus.webview.currentWebview()无效，非v3编译模式使用this.$mp.page.$getAppWebview()
			var wv = currentWebview.children()[0]
			wv.reload();
			// #endif
			console.log(JSON.stringify(e))
		},
	}
</script>

<style>

</style>
