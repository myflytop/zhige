<template>
	<view class="articleDetails-container wrapperLayer">
	</view>
</template>

<script>
	import titleBar from '../../components/backTitlebar.vue';
	import replaceContent from '../../utils/replaceContent.js'
	import jyfParser from "@/components/jyf-parser/jyf-parser";
	export default {
		components: {
			jyfParser,
			titleBar
		},
		data() {
			return {
				pageInfo: ''
			}
		},
		onLoad(options) {
			this.id = options.id
			this.getDetails()
		},
		methods: {
			ccc(e){
				console.log(e);
			},
			getDetails() {
				this.$http.post('talentInfo/getTalentArticle', {
					id: this.id
				}).then((res) => {
					console.log(res, '========>页面数据');
					res.articleLabel = replaceContent.replaceImg(res.articleLabel)
					this.pageInfo = res
				})
			}
		}
	}
</script>

<style lang="scss">
	.articleDetails-container {
		background-color: #FFFFFF;
		min-height: 100vh;

		.pageContent-container {
			width: 100%;

			.topbannerbox {
				width: 100%;
				height: 415rpx;
			}

			.pageTitle {
				width: 100%;
				margin-top: 32rpx;
				color: #3c2b2a;
				font-weight: 600;
				font-size: 38rpx;
			}

			.authorinfo-container {
				width: 100%;
				padding-top: 40rpx;
				padding-bottom: 30rpx;

				.left-info {
					width: 100%;

					.avatorbox {
						width: 90rpx;
						height: 90rpx;
						overflow: hidden;
						border-radius: 50%;
					}

					.infobox {
						margin-left: 20rpx;

						.nickname {
							font-size: 24rpx;
							font-weight: 500;
							color: #333333;
						}

						.timer {
							font-size: 24rpx;
							font-weight: 400;
							color: #999999;
						}
					}
				}

				.right-watch-container {
					font-size: 24rpx;
					white-space: nowrap;
					font-weight: 400;
					color: #999999;
				}
			}

			.subTitle {
				font-size: 24rpx;
				font-weight: 400;
				color: #333333;
			}

			.article-newpage-write {
				width: 100%;
				margin-top: 50rpx;

				p {
					color: #635959;
					line-height: 64rpx;
					margin: 0;
					text-align: justify;
				}
			}
		}
	}
</style>
