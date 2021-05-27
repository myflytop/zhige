<template>
	<view class="">
		<u-navbar title-color="#fff" back-icon-color="#ffffff" :is-fixed="isFixed" :is-back="false"
			:background="background">
			<view class="slot-wrap" v-if="useSlot">
				<view class="search-wrap" v-if="search">
					<!-- 如果使用u-search组件，必须要给v-model绑定一个变量 -->
					<u-search v-model="keyword" action-text="搜索" :animation="true" :show-action="showAction" height="71"
						:action-style="{color: '#fff'}">
					</u-search>
				</view>
			</view>
		</u-navbar>

		<view class="zg-weal-swiper">
			<u-swiper :list="hotCrusePosts"></u-swiper>
		</view>

		<view class="zg-weal-hot">
			<view class="item-container">
				<view class="thumb-box" v-for="(item1, index1) in cruseCats" :key="index1">
					<image class="item-menu-image" :src="item1.catIcon" mode=""></image>
					<view class="item-menu-name">{{item1.catName}}</view>
				</view>
			</view>
		</view>

		<view class="weekNews-container colCen borderBox">
			<view class="scroll-content borderBox">
				<scroll-view class="newScroll" scroll-x="true" scroll-with-animation>
					<view class="listcontent">
						<block v-for="(items,index) in nowCrusePosts" :key='index'>
							<view class="news-items borderBox" @click="goDetails(items.id)">
								<view class="items-container colCen">
									<view class="newsPic defIcon">
										<image :src="items.articleImg[0]" mode="aspectFill" :lazy-load="true"></image>
									</view>
									<view class="bottom-info-container colCen borderBox">
										<view class="newstitle">
											{{items.articleTitle}}
										</view>
									</view>
								</view>
							</view>
						</block>
					</view>
				</scroll-view>
			</view>
		</view>
		<view class="zg-weal-list">
			<!-- 刷新页面后的顶部提示框 -->
			<view class="tips" :class="{ 'tips-ani': tipShow }">为您更新了10条最新新闻动态</view>
			<!-- 基于 uni-list 的页面布局 -->
			<uni-list>
				<!-- to属性：将新闻ID和标题传给详情页 -->
				<!-- TODO：需增加日期格式化的示例 -->
				<uni-list-item direction="row" v-for="item in crusePosts" :key="item.articleId"
					:title="item.articleTitle" :to="'/pages/cruse/post/post?id='+item.articleId">
					<!-- 通过body插槽定义列表内容显示 -->
					<template v-slot:body>
						<view class="uni-list-box uni-content">
							<view class="uni-title uni-ellipsis-2">{{item.articleTitle}}</view>
							<view class="uni-note">
								<text>{{item.articleLook}}</text>
								<text>{{item.userLike}}</text>
								<text>{{item.updateTime}}</text>
							</view>
						</view>
					</template>
				</uni-list-item>
			</uni-list>
		</view>
	</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				crusePosts: [{
						id: 1,
						title: '寒雨连江夜入吴,寒雨连江夜入吴,寒雨连江夜入吴',
						userName: 'zhangsan',
						updateTime: "102020222",
						avatar: 'http://img.alicdn.com/imgextra/i1/3611152221/O1CN01HofbNg1SHGF08Ez7i_!!3611152221.jpg',
					},
					{
						id: 2,
						title: '寒雨连江夜入吴,寒雨连江夜入吴,寒雨连江夜入吴',
						userName: 'zhangsan',
						updateTime: "102020222",
						avatar: 'http://img.alicdn.com/imgextra/i1/3611152221/O1CN01HofbNg1SHGF08Ez7i_!!3611152221.jpg',
					},
					{
						id: 3,
						title: '寒雨连江夜入吴,寒雨连江夜入吴,寒雨连江夜入吴',
						userName: 'zhangsan',
						updateTime: "102020222",
						avatar: 'http://img.alicdn.com/imgextra/i1/3611152221/O1CN01HofbNg1SHGF08Ez7i_!!3611152221.jpg',
					}

				],
				formData: {
					status: 'loading', // 加载状态
				},
				tipShow: false // 是否显示顶部提示框
					,
				// 教程分类
				cruseCats: [{
						"name": "A字裙",
						"key": "A字裙",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/1.jpg",
						"cat": 10
					},
					{
						"name": "T恤",
						"key": "T恤",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/2.jpg",
						"cat": 10
					},
					{
						"name": "半身裙",
						"key": "半身裙",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/3.jpg",
						"cat": 10
					},
					{
						"name": "衬衫",
						"key": "衬衫",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/4.jpg",
						"cat": 10
					},
					{
						"name": "短裙",
						"key": "短裙",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/5.jpg",
						"cat": 10
					},
					{
						"name": "阔腿裤",
						"key": "阔腿裤",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/6.jpg",
						"cat": 10
					},
					{
						"name": "连衣裙",
						"key": "连衣裙",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/7.jpg",
						"cat": 10
					},
					{
						"name": "妈妈装",
						"key": "妈妈装",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/8.jpg",
						"cat": 10
					},
					{
						"name": "牛仔裤",
						"key": "牛仔裤",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/9.jpg",
						"cat": 10
					},
					{
						"name": "情侣装",
						"key": "情侣装",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/10.jpg",
						"cat": 10
					},
					{
						"name": "休闲裤",
						"key": "休闲裤",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/11.jpg",
						"cat": 10
					},
					{
						"name": "雪纺衫",
						"key": "雪纺衫",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/12.jpg",
						"cat": 10
					},
					{
						"name": "防晒衣",
						"key": "防晒衣",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/13.jpg",
						"cat": 10
					},
					{
						"name": "礼服/婚纱",
						"key": "礼服婚纱",
						"icon": "https://cdn.uviewui.com/uview/common/classify/1/14.jpg",
						"cat": 10
					}
				],

				msg: [
					'寒雨连江夜入吴',
					'平明送客楚山孤',
					'洛阳亲友如相问',
					'一片冰心在玉壶'
				],
				//最新发布教程文章
				nowCrusePosts: [{
						"id": 15004,
						"name": "【合集】春季必买！超时髦的平价小饰品",
						"shortTitle": "让你开春靓起来",
						"image": "http://img.alicdn.com/imgextra/i1/3611152221/O1CN01HofbNg1SHGF08Ez7i_!!3611152221.jpg",
						"appImage": null,
						"label": "#春季配饰#,#配饰单品#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FoxrVLhc11vRhW8BHVnA1hIMxv7u",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fgvjtm9uEyn1UaHZcANZJ78nXTCl",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "32",
						"article": "叮咚~你们小编已上线自从开始进入春天很多集美们就忙着准备春装那搭配的小饰品你们也都安排上了吗？要知道春天脱掉厚",
						"tclass": 2
					},
					{
						"id": 15003,
						"name": "女王节送礼借鉴攻略，送给不懂女生的直男",
						"shortTitle": "宠爱女王的礼物清单",
						"image": "https://img.alicdn.com/imgextra/i4/2099113189/O1CN01b5sOsp1ZQbiKhyTr6_!!2099113189.jpg",
						"appImage": null,
						"label": "#妇女节#,#好礼推荐#,#实用贴心#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FhGWGeDMKOH7zI0cJOOyAZAcY0Xh",
						"highQuality": 0,
						"talentName": "尛呆瓜",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoB8yUGRQz8USo4SWI8IBkpraib5",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FkmF_7mUNvcHgV9mSuf7ZZPOSrEI",
						"followTimes": 0,
						"talentId": 148,
						"addtime": null,
						"itemNum": "19",
						"article": "哈喽，小伙伴们好呀~又开始我们今天的种草Time啦今天是元宵节，小编在此祝各位元宵快乐！财源滚滚！话说，这年算",
						"tclass": 2
					},
					{
						"id": 14992,
						"name": "【合集】嗦粉、嗦面的快乐，一口不过瘾！",
						"shortTitle": "嗦粉、嗦面大本营",
						"image": "https://img.alicdn.com/imgextra/i4/3360071896/O1CN0137yBer1PsPbGhtvnI_!!3360071896.jpg",
						"appImage": null,
						"label": "#嗦粉一族#,#螺蛳粉#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FvfK0p55M2k4HctkM_p6Z6t62Txi",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FiTqUnWbxQ4pgdTGJKoSLH6Gcqus",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "今天吃什么？是每个打工人每天都要思考的问题作为一个忙碌的上班族虽然平时都向往着在厨房大展身手做一顿美味但事实往",
						"tclass": 2
					},
					{
						"id": 14976,
						"name": "【合集】萌娃春季上新，我都帮你挑好了",
						"shortTitle": "备好春装迎接开学",
						"image": "https://img.alicdn.com/imgextra/i1/2936142452/O1CN01FUbkkL1Tz3oWskBFE_!!2936142452.jpg",
						"appImage": null,
						"label": "#童装上新#,#萌娃新衣#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FkIAuF7xnEU5aKBRObRuzoShqYdd",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fl1YqYIQN1RPiVefSra4WEWHoiZR",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "28",
						"article": "不知不觉中冬天的脚步终于渐行渐远春天气息扑面而来宝妈们是不是该给孩子添一波春季新衣啦在这种乍暖还寒的时节加上小",
						"tclass": 2
					},
					{
						"id": 14975,
						"name": "上班啦！get起这些早餐免得饿肚子",
						"shortTitle": "囤点早餐开工不用愁",
						"image": "https://img.alicdn.com/imgextra/i1/3416988900/O1CN01Yb03GZ2FcFcsgtjmi_!!3416988900.jpg",
						"appImage": null,
						"label": "#快速完成一件事#,#美味早餐#,#打工人必备#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FiKdXxkkDYQUEUfV5B66yWv4ZAf8",
						"highQuality": 0,
						"talentName": "沐渔橙风",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/Fsgqs9dddwzgEfxs6UAY7R-3jTBk",
						"talentcat": 3,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fm4E-A8JJCWJJqmJpW6zZlDiku0Z",
						"followTimes": 0,
						"talentId": 76,
						"addtime": null,
						"itemNum": "23",
						"article": "哈喽，小伙伴们好呀~随着2月尾声越来越近相信不少小伙伴都已经开工或在开工的路上了吧……不过刚开工，除了人还没恢",
						"tclass": 2
					},
					{
						"id": 14963,
						"name": "【合集】租房生活不将就，这些好物买就对了",
						"shortTitle": "租房不租生活",
						"image": "http://img.alicdn.com/imgextra/i1/690315933/O1CN01jGndoP1thMOv4rvQQ_!!690315933.jpg",
						"appImage": null,
						"label": "#租房幸福感#,#生活舒适好物#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FlQjApX7f9g4xIKhr6ZSlxoyJXaP",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FiNB43EwTZFTkSRAb4hmLzq0lot2",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "哈喽！小伙伴们好久不见鸭经过了春节大长假有的小伙伴陆陆续续开工有的小伙伴规划年后找工作租房子说到租房子，独自在",
						"tclass": 2
					},
					{
						"id": 14957,
						"name": "这几款运动鞋少女！洋气！超好看的",
						"shortTitle": "这些运动鞋太好看啦",
						"image": "http://img.alicdn.com/imgextra/i1/2207530320909/O1CN01DMlZvU1IaMeu72231_!!2207530320909.jpg",
						"appImage": null,
						"label": "#鞋控必入#,#学生党快拔草#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fr1ElOhHigyVWCI7WSYkOKJf0Xwi",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fh0DNW1EKlCrlP9q2hfLHrxYprqs",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "9",
						"article": "小伙伴们好呀！又开始我们今天的种草时间啦~&nbsp;最近天气愈来愈热草地上都长出了绿油油的新草路边的小树也长",
						"tclass": 2
					},
					{
						"id": 14946,
						"name": "【合集】2021年春季护肤好物大盘点",
						"shortTitle": "快收好这份护肤攻略",
						"image": "https://img.alicdn.com/imgextra/i3/2447569463/O1CN01s4z8AV2Jm6c9QygNZ_!!2447569463-0-daren.jpg",
						"appImage": null,
						"label": "#春季护肤#,#换季必备#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Ft9kqPAPT3oz5_X42ahCHwk__Of5",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fh2jHuy-R28JRTnzNpfeEwgWDmLs",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "哈喽！各位小仙女们转眼间快要到三月份啦三月份预示着什么呢？那就是春天的降临一想到春天小编的心情都开始变得明媚起",
						"tclass": 2
					},
					{
						"id": 14928,
						"name": "【合集】牛气满满迎开学，给孩子好的开始！",
						"shortTitle": "开学季必buy好物",
						"image": "https://img.alicdn.com/imgextra/i3/2209699598692/O1CN01EYUP3r2E4zFXPTHGt_!!2209699598692.jpg",
						"appImage": null,
						"label": "#开学季#,#学习必备#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fh_adDBel-SFA5EW1Syr6_Ja6K1S",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fsh3b3xqLTlF-1snZdk45OhJ7O6U",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "不知不觉快要过完春节了上班族陆陆续续开工转眼间也要到开学季家里的孩子即将开学对于为人父母的你来说既开心又忧愁开",
						"tclass": 2
					},
					{
						"id": 14913,
						"name": "年后如何快速瘦下来？记住这些高效减肥定律",
						"shortTitle": "甩掉过年赘肉减肥法",
						"image": "https://img.alicdn.com/imgextra/i3/3487092162/O1CN019hAa2o1RqEt0PixXf_!!3487092162.jpg",
						"appImage": null,
						"label": "#高效减肥定律#,#人人都适用#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FpcGMjvt85j53FjJib0GzG8cjkN8",
						"highQuality": 0,
						"talentName": "沐渔橙风",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/Fsgqs9dddwzgEfxs6UAY7R-3jTBk",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fku4Ne-NYjSxB49uWs3B-wSkvEUT",
						"followTimes": 0,
						"talentId": 76,
						"addtime": null,
						"itemNum": "11",
						"article": "享受了半个月约亲戚朋友烧烤、打火锅生活的你有木有发现▼肚肚的肉肉越来越凸出了？之前的裤子上身越来越勒了？两颊的",
						"tclass": 2
					},
					{
						"id": 14359,
						"name": "【合集】柴米油盐酱醋茶，一站式备齐！",
						"shortTitle": "烹饪日常变身小美好",
						"image": "https://img.alicdn.com/imgextra/i1/900877741/O1CN01Q80VPG273QaqLLR0w_!!900877741.png",
						"appImage": null,
						"label": "#生活好味道#,#厨房必备#,#人间烟火气#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fqax9L3xC6aM2stMQoSClrKmaztQ",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FsweZgcCHzb3HmgiCEyIako2emmr",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "从古至今柴米油盐酱醋茶都是生活必不可少的消耗品前有古人云“早起开门七件事，柴米油盐酱醋茶”后有现代人“蕞是人间",
						"tclass": 2
					},
					{
						"id": 14355,
						"name": "【合集】无限回购的卸妆清洁和补水好物~",
						"shortTitle": "仙女必备的护肤好物",
						"image": "https://img.alicdn.com/imgextra/i1/771521010/O1CN0126rjRw1JKceI6yViT_!!771521010.jpg",
						"appImage": null,
						"label": "#深层清洁#,#轻松卸妆#,#补水好物#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FgDmrcx_LIPfd8vYxzt0iphJXlIg",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FvXdoLMWRBwxci7tpJ2Xl0I8eAee",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "18",
						"article": "大家元旦快乐呀～2021年的第一个小长假开启啦小仙女们是不是都画上精致的妆容穿着漂亮的衣裳出去嗨啦然而，嗨完回",
						"tclass": 2
					},
					{
						"id": 14353,
						"name": "10分钟化妆挑战，冬天想偷懒赖床的赶紧看",
						"shortTitle": "冬日省心妆容",
						"image": "https://img.alicdn.com/imgextra/i4/1083531967/O1CN014SSEVz1QOvhhHIlWz_!!1083531967.jpg",
						"appImage": null,
						"label": "#冬日懒人妆#,#省力省时#,#自然好看#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fu4XOrRqhqlFIlN4CcQ5IC58MG58",
						"highQuality": 0,
						"talentName": "沐渔橙风",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/Fsgqs9dddwzgEfxs6UAY7R-3jTBk",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FgSds49xvM3GRLVd7cij6Y0u-QoA",
						"followTimes": 0,
						"talentId": 76,
						"addtime": null,
						"itemNum": "12",
						"article": "自从一场冬风之后广州也算是真真实实的入冬这几天出门小编天天厚外套+暖宝宝不然怕被冬天的“妖风”吹得瑟瑟发抖其实",
						"tclass": 2
					},
					{
						"id": 14344,
						"name": "【合集】居家刚需好物，统统低至9.9元",
						"shortTitle": "花小钱买刚需好物",
						"image": "https://img.alicdn.com/imgextra/i4/2207268230360/O1CN01RzhYfg1EWvC5tk5zp_!!2207268230360.jpg",
						"appImage": null,
						"label": "#刚需好物#,#物美价廉#,#低至9.9元#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FnIb9KsFoU47R2YH-OPTgy5zDe_Y",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FhN1l6oDpCBUe5T_L9wj1z-RQSBM",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "哈喽，小伙伴们好~今天是2020年蕞后一天提前祝大家元！旦！节！快！乐！今天想跟大家分享一些我们日常生活中少不",
						"tclass": 2
					},
					{
						"id": 14337,
						"name": "快来拆盲盒呀，可有机会拆出隐藏款珍贵手办",
						"shortTitle": "来拆惊喜盲盒啦",
						"image": "https://img.alicdn.com/imgextra/i3/2200632493802/O1CN01E9ZOc51dxMT151K8a_!!2200632493802.jpg",
						"appImage": null,
						"label": "#盲盒惊喜#,#神秘好玩#,#快去试试运气#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fgp2Rgt5NS57M7dUE2YGkRGTmHIl",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FocG0MEPKZMlOjoe4Dp1XNhc2Wn7",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "9",
						"article": "最近有一个很特殊的消费现象引起了小编的注意，那就是——盲盒盲盒，顾名思义就是你买回来一盒子东西里面的东西不能指",
						"tclass": 2
					},
					{
						"id": 14329,
						"name": "暖心又暖胃的火锅，你吃了吗？",
						"shortTitle": "从舌尖暖到心头美食",
						"image": "http://img.alicdn.com/imgextra/i4/1918385168/O1CN01nRvKUh1o2zQdl9TZK_!!0-item_pic.jpg",
						"appImage": null,
						"label": "#火锅控#,#暖胃美食#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fjk6L8JMHGae_XWpsKcp_grW2Z0R",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 3,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FgonXD7OEeBYfu-NoxQQNEQlJfwL",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "18",
						"article": "对于生活在广东的小编来说湿冷的冬天没有什么寒冷是一顿火锅解决不了的吃上一口浓郁的味道在舌尖慢慢散开满满的都是幸",
						"tclass": 2
					},
					{
						"id": 14322,
						"name": "年末流行的可爱童装，上身既保暖又舒适",
						"shortTitle": "年末潮款童装大盘点",
						"image": "https://img.alicdn.com/imgextra/i2/1629773736/O1CN01N99tFf1dT8LbRXmf3_!!1629773736.jpg",
						"appImage": null,
						"label": "#年末流行款#,#舒适&amp;保暖#,#时尚萌娃必看#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fq6qlxg7Jjq1Nnowl39JeMUQ18G4",
						"highQuality": 0,
						"talentName": "尛呆瓜",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoB8yUGRQz8USo4SWI8IBkpraib5",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FmHhWTffSGBbOHWJHuIuYnhzBgi6",
						"followTimes": 0,
						"talentId": 148,
						"addtime": null,
						"itemNum": "23",
						"article": "2020年即将结束马上迎来崭新的2021年俗话说得好“迎新年，穿新衣”各位宝爸宝妈们有为自己的小宝贝挑选衣身合",
						"tclass": 2
					},
					{
						"id": 14314,
						"name": "【合集】馋人韩式美食来啦，快去瞧一瞧",
						"shortTitle": "韩国特色美食专场",
						"image": "http://img.alicdn.com/imgextra/i4/2460128721/O1CN01y4yT0r2EIGjWP6Qex_!!2460128721.jpg",
						"appImage": null,
						"label": "#韩式美食#,#韩剧迷最爱#,#色香味俱全#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fq5CY8TwgZVBvoTeGUedhr-6WznG",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 3,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FgZ99FxGroJn5P7Zgtkpz3lYHKo8",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "20",
						"article": "hello，小伙伴们好你们的种草小编又来啦今天给你们分享一波美食778！嗯~之前都是给大家分享我们大中华的美食",
						"tclass": 2
					},
					{
						"id": 14306,
						"name": "冬季居家必备小家电，你更爱用哪一款？",
						"shortTitle": "舒适过冬的小家电",
						"image": "http://img-haodanku-com.cdn.fudaiapp.com/oimg_624419792164_1606469341.jpg",
						"appImage": null,
						"label": "#小家电#,#过小资生活#,#家家户户都需要#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FvvAhrCQ3DTE26sbpK8jqdMSOghC",
						"highQuality": 0,
						"talentName": "沐渔橙风",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/Fsgqs9dddwzgEfxs6UAY7R-3jTBk",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Ft38mbyCe1EDDeuCP5v4iFHzvi4B",
						"followTimes": 0,
						"talentId": 76,
						"addtime": null,
						"itemNum": "11",
						"article": "哈喽，小伙伴们好呀12月准备过完更为寒冷的1月要来了你做好准备了吗？！天气冷冽，除了保暖“装”备一些让你舒适过",
						"tclass": 2
					},
					{
						"id": 14298,
						"name": "【合集】天亮了还没睡着？看看这些助眠好物",
						"shortTitle": "值得一试的助眠好物",
						"image": "http://img.alicdn.com/imgextra/i4/2206713008287/O1CN011EkvNK2B5UosBBe3r_!!2206713008287.jpg",
						"appImage": null,
						"label": "#失眠星人必看#,#美容觉#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fm8as6VRCZwRlPx7yx714gADHkGc",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FjvPBbgbLWaggeSQjSjNc8Z6QvNz",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "18",
						"article": "Hello，你们的小编上线啦~可能是因为现在的人们压力大身边好多小伙伴都说难入睡其实小编也是个不折不扣的失眠党",
						"tclass": 2
					},
					{
						"id": 13953,
						"name": "双十二时尚馆特惠来袭，狂欢好货等你来抢",
						"shortTitle": "时尚爆款低至3折起",
						"image": "https://img.alicdn.com/i2/2935755427/O1CN01VQxq3I1pxc3V1PlNB_!!2935755427-0-lubanu-s.jpg",
						"appImage": null,
						"label": "#双十二大促#,#潮奢时尚馆#,#时尚小伙必逛#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FpeUzrUhfy_5A-pfSyTJ05yB_dDQ",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FlHg728XAeTn20b5eotad4SKEQ30",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "26",
						"article": "双十二作为2020年最后一个大型网购节也是一年中为数不多的促销大放价作为羊毛党，当然不能错过啦！！！所以今天继",
						"tclass": 2
					},
					{
						"id": 13947,
						"name": "冷空气到账，那热乎乎的火锅也请收下！",
						"shortTitle": "冬天就要吃火锅",
						"image": "http://img.alicdn.com/imgextra/i3/2206731816344/O1CN0112sbuD1wjbHTYZscP_!!2206731816344.jpg",
						"appImage": null,
						"label": "#冬天就要吃火锅#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FpSaxDy-dyjRLmtK0xY6XTxfJWxb",
						"highQuality": 0,
						"talentName": "尛呆瓜",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoB8yUGRQz8USo4SWI8IBkpraib5",
						"talentcat": 3,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FtfyTgBhbYCrzICMH0bvJhQFJlto",
						"followTimes": 0,
						"talentId": 148,
						"addtime": null,
						"itemNum": "13",
						"article": "Hello，BB们~我是你们的小编呀昨天早上醒来后真的是感觉太！冷！了！一点也不想从被窝里出来&nbsp;&n",
						"tclass": 2
					},
					{
						"id": 13938,
						"name": "双12我又可以了！这些大牌美妆太太便宜了",
						"shortTitle": "超划算的大牌美妆",
						"image": "http://img-haodanku-com.cdn.fudaiapp.com/oimg_614543969471_1604115342.jpg",
						"appImage": null,
						"label": null,
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FqlnxP6YSPSYGPFzs8cacZab79h7",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FsfkuN6xBNPC0ZDiu-GH7K4igaL8",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "16",
						"article": "&nbsp;嗨喽艾瑞巴蒂~我是小编呐昨天给大家整理了一期猫超好物然后就有不少姐妹在说想要看双12有哪些适合冬天",
						"tclass": 2
					},
					{
						"id": 13930,
						"name": "双十二想买厚外套大衣？！不妨看看这几件",
						"shortTitle": "保暖洋气厚外套来啦",
						"image": "https://img.alicdn.com/imgextra/i2/1110394198/O1CN01ZGsuTG1gsjKEwYwtn_!!1110394198.jpg",
						"appImage": null,
						"label": "#不同版型#,#潮酷感满满#,#今年爆款#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FsE6-2vgAXtRgjhFUeewKdiHfVFi",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FogqJt1pLOjy3XEUODv2gDN72q4_",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "10",
						"article": "这两个月打工人真的太南了！好不容易抗过了双十一和黑五想着终于能踏踏实实地在冲会儿“浪”谁能想到，双十二又悄咪咪",
						"tclass": 2
					},
					{
						"id": 13923,
						"name": "双十二开始啦！天猫超市好物大放价ing",
						"shortTitle": "猫超好货不止5折",
						"image": "https://img.alicdn.com/imgextra/i2/725677994/O1CN01vgY86Y28vImYKapXh_!!725677994-0-sm.jpg",
						"appImage": null,
						"label": "#双十二大促#,#天猫超市好货合集#,#快去看看#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FmCiWdk3wQDLg6hM3jJThBcK9iXp",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fg4rRHVuuYJilTFLqB5kFHcZohe5",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "60",
						"article": "来啦！来啦！双十二它真的来啦！各位小伙伴们快打起精神来开始新一轮的薅羊毛大战呀虽然双十二活动力度没有双十一那么",
						"tclass": 2
					},
					{
						"id": 13916,
						"name": "冬季萌娃潮搭，选这几款童鞋就对了！",
						"shortTitle": "时尚又暖和的童鞋",
						"image": "https://img.alicdn.com/imgextra/i4/3380069475/O1CN01cLEBGk2JrbMSU9dPN_!!3380069475.jpg",
						"appImage": null,
						"label": "#时尚又暖和的童鞋#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FvKlxUsaiOj038S0xw3KfhIVL5nm",
						"highQuality": 0,
						"talentName": "欢欢很欢乐",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FgnBUdZ09VN9uvcxlac9BLTmFqXM",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FlLjtRmjo0I5Zaxawrv-BwVAr4ng",
						"followTimes": 0,
						"talentId": 132,
						"addtime": null,
						"itemNum": "11",
						"article": "嗨喽小伙伴们好呀~大家今天冷不冷呀？一到冬季，大家就开始热衷于穿戴各种围巾帽子、手套等吸晴单品想要成为这条街最",
						"tclass": 2
					},
					{
						"id": 13915,
						"name": "学生党冬季寝室好物来啦，低至9.9元起！",
						"shortTitle": "5款寝室实用好物",
						"image": "http://img-haodanku-com.cdn.fudaiapp.com/oimg_628079325622_1606299192.jpg",
						"appImage": null,
						"label": "#宿舍好物#,#实用又平价#,#低至9.9元起#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FhH4cDzB5Crdf6BjoGl3HiIaA11X",
						"highQuality": 0,
						"talentName": "沐渔橙风",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/Fsgqs9dddwzgEfxs6UAY7R-3jTBk",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FhS3EfPXykF6ITPJCii8Oe4__SEj",
						"followTimes": 0,
						"talentId": 76,
						"addtime": null,
						"itemNum": "13",
						"article": "嘿小伙伴们，我来啦！今天12月4号了距离双十二预热还剩一天期待不期待？激动不激动？相信不少小伙伴都开始集金币造",
						"tclass": 2
					},
					{
						"id": 13908,
						"name": "个人洗护好物大公开，让你从头美到脚！",
						"shortTitle": "洗护用品大合集",
						"image": "https://img.alicdn.com/imgextra/i1/13616081/O1CN01L7ldyX1un96sW1EY7_!!13616081.jpg",
						"appImage": null,
						"label": null,
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FhKzk6iGYcXD7PGxEXQWPZ4DJ6Jc",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FhgbZVuLdv09NCPUukfu6qS_9u6P",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "32",
						"article": "&nbsp;嗨喽艾瑞巴蒂~我是小编呐又到了洗澡都需要勇气的冬天了昨天晚上小编在浴室里磨磨蹭蹭了好久都没有勇气脱",
						"tclass": 2
					},
					{
						"id": 13898,
						"name": "红色单品的艳丽和优雅，只有穿戴过才知道！",
						"shortTitle": "超亮眼的红色单品",
						"image": "http://img.alicdn.com/imgextra/i2/2206539011291/O1CN01XkIMlZ1LPJxjBjb5P_!!2206539011291.jpg",
						"appImage": null,
						"label": "#时尚弄潮儿#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fl1VqFwoesCQsFXPNrgiSov_A7Om",
						"highQuality": 0,
						"talentName": "尛呆瓜",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoB8yUGRQz8USo4SWI8IBkpraib5",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FrXTHDdZM3MXGgAZg-3GAXzazUVG",
						"followTimes": 0,
						"talentId": 148,
						"addtime": null,
						"itemNum": "11",
						"article": "&nbsp;Hello，BB们~我是你们的小编呀还记得小时候非常讨厌红色因为妈妈给我买的衣服都是清一色红色，穿",
						"tclass": 2
					},
					{
						"id": 13886,
						"name": "双十二购买攻略提前剧透，来看看有啥值得买",
						"shortTitle": "双十二清单新鲜出炉",
						"image": "https://img.alicdn.com/imgextra/i4/2271904549/O1CN01VFQWNP1jTUKqyYDP3_!!2271904549.jpg",
						"appImage": null,
						"label": "#双12来啦#,#值得买清单#,#高性价比好货#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fg8RFnIWeRXSLmUeFPDrKFMHkYvm",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FjEy34JiwLtEL_nQRhCT7QuLF3JV",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "64",
						"article": "好消息！好消息！在经历了双十一的“剁手”大战后双十二大促又悄摸的来了！虽说5号才正式进入预热期但目前有不少商品",
						"tclass": 2
					},
					{
						"id": 13772,
						"name": "学期过半文具用得差不多了？快来这里囤货吧",
						"shortTitle": "得力、晨光文具",
						"image": "https://img.alicdn.com/imgextra/i1/292438365/O1CN01kg1GXw2BfDjGp9kp1_!!292438365.jpg",
						"appImage": null,
						"label": "#学习文具#,#学生党必备#,#价格实惠#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FrF9pLZntIctlPxqxuIDFbIhdhb1",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FmvkUrgcQ2gY1tViJlRG09_gq3oK",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "14",
						"article": "hello，小伙伴们好啊你们的小编又开始种草啦~话说时间过得挺快的眼睛一眨一闭学期都已经过半了相信不少童鞋开学",
						"tclass": 2
					},
					{
						"id": 13764,
						"name": "晒美食必备！好看的餐具、杯子、桌布…",
						"shortTitle": "平价貌美的餐具分享",
						"image": "https://img.alicdn.com/i4/1820940334/O1CN01qWdaCE1EL0lchsBFP_!!1820940334.jpg",
						"appImage": null,
						"label": "#高颜值美物#,#装点美食#,#款款都是宝藏#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FmVIrGNhlvWvnuFI-7TLxsWWk5Fy",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FvqpX2cXQEMwUS8teeihVkZ-YmMz",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "30",
						"article": "嘿嘿~各位小伙伴好哇最近天气越来越冷，不想出门的日常是不是老想在家捣鼓点美食吃吃啊不过俗话说得好“人靠衣装，佛",
						"tclass": 2
					},
					{
						"id": 13758,
						"name": "打工人续命好物，轻松提升上班幸福感",
						"shortTitle": "又困又累全靠它续命",
						"image": "https://img.alicdn.com/imgextra/i4/2584887237/O1CN01b7xVT423KaxTv2auX_!!2584887237.jpg",
						"appImage": null,
						"label": "#打工人续命好物#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FjYE23LEkU5EPUwhwoWGon289-MD",
						"highQuality": 0,
						"talentName": "欢欢很欢乐",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FgnBUdZ09VN9uvcxlac9BLTmFqXM",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FjZfaPUnzAfNYbfq5FmSLGZZlmXR",
						"followTimes": 0,
						"talentId": 132,
						"addtime": null,
						"itemNum": "10",
						"article": "嗨喽，各位打工人好呀~自从打工人这个梗开始流传朋友圈就有越来越多的打工人段子其中最火的那句“早安打工人”里怀着",
						"tclass": 2
					},
					{
						"id": 13756,
						"name": "黑五火热进行中，薅大牌羊毛看这一篇就够了",
						"shortTitle": "黑五薅羊毛指南",
						"image": "https://img.alicdn.com/imgextra/i3/1876633291/O1CN0103lD5T1aBK2geY44u_!!1876633291.jpg",
						"appImage": null,
						"label": "#黑色星期五#,#解锁全球好物#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FvtNY1IL_mIWg57uHPM2uWWZTjNh",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fu89Q-64oopu8x7OnxPdaB_mqgNv",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "19",
						"article": "哈喽啊，小伙伴们~一年一度的双十一购物狂欢节过去没多久隔壁美国的“双十一”黑五又双叒叕到啦羊毛党的春天又回来咯",
						"tclass": 2
					},
					{
						"id": 13747,
						"name": "冷空气即将到货，萌娃御寒物件请提前备好！",
						"shortTitle": "萌娃御寒好物大放送",
						"image": "https://img.alicdn.com/imgextra/i1/461949708/O1CN019F91qO2LaJe1w2kKh_!!461949708.jpg",
						"appImage": null,
						"label": "",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FpbCQCDvrDxKhea_4vse4-lzZ-7u",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fjgm6v7S0bzzOWhoMMOT4H2llbmC",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "24",
						"article": "&nbsp;嗨喽艾瑞巴蒂~我是小编呐今天早上从温暖的被窝醒来后一下床小编就被冻得瑟瑟发抖这天气是真的冷了啊！！",
						"tclass": 2
					},
					{
						"id": 13742,
						"name": "这5个入冬必买单品，个个都是我的宝藏！！",
						"shortTitle": "冬日神器来了~",
						"image": "http://img.alicdn.com/imgextra/i1/2200719379381/O1CN01X6H8UL2JAY4Y1V0Ns_!!2200719379381.jpg",
						"appImage": null,
						"label": "#戳心窝的冬日好物#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FiEVRiAEyA3X0PLvwJXSrc3UxstB",
						"highQuality": 0,
						"talentName": "欢欢很欢乐",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FgnBUdZ09VN9uvcxlac9BLTmFqXM",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FkADQG99cXGhc_DUaG649oj2MSbO",
						"followTimes": 0,
						"talentId": 132,
						"addtime": null,
						"itemNum": "11",
						"article": "嗨喽小伙伴们好呀~好奇的问一问大家你们那里今天几度？穿的啥？Emmm...小编昨天穿短袖今天穿毛衣，真的服了广",
						"tclass": 2
					},
					{
						"id": 13740,
						"name": "几十块买爆款化妆品！这份清单让钱包很安心",
						"shortTitle": "适合学生党的化妆品",
						"image": "http://img.alicdn.com/imgextra/i1/2200580634753/O1CN01kyKzw61kyv64OxveZ_!!2200580634753-0-lubanu-s.j",
						"appImage": null,
						"label": "#超好用的化妆品#,#价格不贵又好用#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FqfGYZoEBwgkPzr7LuEPVWLeXA-e",
						"highQuality": 0,
						"talentName": "沐渔橙风",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/Fsgqs9dddwzgEfxs6UAY7R-3jTBk",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FpFKEZUxXVvvzfJqHE7Tlf8bklWZ",
						"followTimes": 0,
						"talentId": 76,
						"addtime": null,
						"itemNum": "11",
						"article": "Hello小伙伴们好啊，我是小编双十一之后相信童鞋的生活费挺拮据的吧所以今天呢，小编打算给学生党们推荐一份#平",
						"tclass": 2
					},
					{
						"id": 13732,
						"name": "冷冷冷冷！全国大降温这些好物助你过暖冬",
						"shortTitle": "暖冬好物合集",
						"image": "https://img.alicdn.com/imgextra/i2/715470002/O1CN019K6TWG1BsxQYlYpvr_!!715470002.png",
						"appImage": null,
						"label": "#降温啦#,#御寒好物#,#给你温暖呵护#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FuRzClDHpQCq_7kHX_vhstZy2R0G",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fqxupn3wXskKPNEXBWLvh4E5OizY",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "54",
						"article": "这几天东北下雪、北京下雪、哈尔滨下雪…等关键词陆续上热搜，北方各地都开始下大雪也出现了不少让人欢乐的段子比如拿",
						"tclass": 2
					},
					{
						"id": 13696,
						"name": "省时又省力的家用清洁神器，懒人必入！",
						"shortTitle": "居家必备清洁神器",
						"image": "https://img.alicdn.com/imgextra/i2/2761058145/O1CN01q5Afmj2A2Sa1Ht3UN_!!2761058145.jpg",
						"appImage": null,
						"label": "#居家必备清洁神器#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FsRnvRPCychs4JE4bal5H0d28mii",
						"highQuality": 0,
						"talentName": "尛呆瓜",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoB8yUGRQz8USo4SWI8IBkpraib5",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FoI9YiPCXEIJK-aCPYe5Qf_4aOpw",
						"followTimes": 0,
						"talentId": 148,
						"addtime": null,
						"itemNum": "11",
						"article": "嗨喽小伙伴们好呀~你们的种草小编上线了哟对于贤惠又居家的人来说每天最大的成就感就是做好各种各样的家务活&nbs",
						"tclass": 2
					},
					{
						"id": 13697,
						"name": "不想囤脂肪过冬的看这里，好吃易做的减肥餐",
						"shortTitle": "好吃易做的减肥餐",
						"image": "http://img.alicdn.com/imgextra/i3/3191603335/O1CN01SUK4mb1aVTVov19BG_!!3191603335-0-lubanu-s.jpg",
						"appImage": null,
						"label": "#刮脂低卡#,#好吃不负担#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FiHxfpSOXX5NRA0nQDz4PAtKfHDQ",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 3,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fv_h-04xCvG3vkVsc7kiiRhRqF9Z",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "16",
						"article": "俗话说得好“三分吃七分练”减肥除了要迈开腿，管住嘴也是非常重要的所以想维持好身材很多人会选择吃减肥餐那减脂餐你",
						"tclass": 2
					},
					{
						"id": 13317,
						"name": "双11运动好物清单，一起来健身呀！",
						"shortTitle": "运动健身好物",
						"image": "https://img.alicdn.com/imgextra/i3/2236038167/O1CN01Kf3a1y2ACXIaGeOBA_!!2236038167.jpg",
						"appImage": null,
						"label": "#运动健身好物#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Fp8jyq4cT-40GQZuYEowsG8DK2i4",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FrU7wqId0SRA3MEEJQbjljlLFUI3",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "14",
						"article": "嗨喽艾瑞巴蒂~你们的小编我又上线啦今天依旧要跟大家聊双11不过今天这一篇是当代人比较容易忽略的运动健身&nbs",
						"tclass": 2
					},
					{
						"id": 13312,
						"name": "别只知道小CK了 ！这几款包也很好背",
						"shortTitle": "秋冬新款包包清单",
						"image": "http://img.alicdn.com/imgextra/i4/2206761443538/O1CN01b25se91c0RtMYtMvF_!!2206761443538.jpg",
						"appImage": null,
						"label": "#装扮必备#,#当季新款#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/Ft593vYzcjjejBlw1zsrJ1eP_p2n",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 2,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FqXEJmtrqGhTu2tcTXqMy6jftAWd",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "12",
						"article": "哈喽，小伙伴们下午好今日份小编种草文来咯！话说前几天小编心血来潮把家里的包都搜刮出来整理了一番这不整理不知道，",
						"tclass": 2
					},
					{
						"id": 13314,
						"name": "把小窝改造成超火ins风，让生活充满幸福",
						"shortTitle": "超火ins风家装",
						"image": "https://img.alicdn.com/bao/uploaded/O1CN01oKQyG51rO0VO1FczH_!!2-item_pic.png",
						"appImage": null,
						"label": "#超火ins风家装#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FoJaRxw-DZy8aCeKu9bp7C8GLb6D",
						"highQuality": 0,
						"talentName": "欢欢很欢乐",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FgnBUdZ09VN9uvcxlac9BLTmFqXM",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/Fnyj6wogyOX6IUvx1FrPZBi1cF49",
						"followTimes": 0,
						"talentId": 132,
						"addtime": null,
						"itemNum": "10",
						"article": "当代社会，许多年轻人为了理想选择在异国它乡工作因此租房成了他们的一大难题为了考虑租金与地段等问题往往租到的房子",
						"tclass": 2
					},
					{
						"id": 13299,
						"name": "双11必撸美妆单品，价格太太太划算啦",
						"shortTitle": "抢着买的美妆单品",
						"image": "https://img.alicdn.com/imgextra/i1/1083531967/O1CN01fvT5wI1QOvgxw3oM9_!!1083531967.jpg",
						"appImage": null,
						"label": "#大牌美妆#,#款式齐全#,#所有女生必看#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FiATlVz4XrnMek8PDTh9875ov1-W",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FkkHdhpThlRA3NOojcCTEkQtKX2-",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "56",
						"article": "哈喽，你们的魔鬼小编又上线啦最近大家最关注的事莫过于一年一度的快乐剁手节啦&nbsp;话说，每天一有空闲下来就",
						"tclass": 2
					},
					{
						"id": 13297,
						"name": "时髦精们都入手的厚外套，让冬天美丽不冻人",
						"shortTitle": "好看不冻人的厚外套",
						"image": "http://img.alicdn.com/imgextra/i2/263817957/O1CN01IlXux728eM7A2V1Sv_!!263817957-0-lubanu-s.jpg",
						"appImage": null,
						"label": "#好看不冻人的厚外套#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FnI03bPf8AYGmJt94xOX63DILaPI",
						"highQuality": 0,
						"talentName": "欢欢很欢乐",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FgnBUdZ09VN9uvcxlac9BLTmFqXM",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FsrV6VMx7Af3Smqqt3mj4mSz3Y-P",
						"followTimes": 0,
						"talentId": 132,
						"addtime": null,
						"itemNum": "14",
						"article": "嗨喽，小伙伴们好呀给大家介绍了好几天的双11好物不知道大家会不会看疲劳了呢哈哈，今天来聊点不一样的吧&nbsp",
						"tclass": 2
					},
					{
						"id": 13295,
						"name": "双11省钱攻略，尾款人们快进来捡便宜啦",
						"shortTitle": "巨划算粮油清单",
						"image": "http://img.alicdn.com/imgextra/i4/2200694335855/O1CN016Mf6B11t7daYsPIaG_!!2200694335855.jpg",
						"appImage": null,
						"label": "#居家必备#,#烹饪好物#,#让你买买买更省心#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FvmFKS2YktnkWwK6slgSor2A2kyp",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 3,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FukufhDaHvu_VWRMGk97C6x5Heb0",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "18",
						"article": "最近连续更新了好几篇双11购物攻略不知道你们看得还过瘾吗？不过双11不结束，小编会继续更新为大家奉上更多双11",
						"tclass": 2
					},
					{
						"id": 13281,
						"name": "双11值得买的母婴好物，趁便宜多囤点啦！",
						"shortTitle": "母婴好物清单",
						"image": "https://img.alicdn.com/bao/uploaded/O1CN01DzRhvS1qa5LRn40nZ_!!6000000005511-2-yinhe.png",
						"appImage": null,
						"label": "#母婴好物清单#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FtwVXZIwr8jBiSJDiURNgaq77guE",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FgMdH8vMYTB8QcpByrC-CL5LQA99",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "30",
						"article": "马爸爸说，双11女人是主力军因为女人不仅会给自己买还会给父母买，给老公买，给孩子买甚至是给朋友闺蜜买，照顾的很",
						"tclass": 2
					},
					{
						"id": 13278,
						"name": "薇娅双11爆款清单曝光，大家都抢着买这些",
						"shortTitle": "薇娅直播爆款清单",
						"image": "https://img.alicdn.com/bao/uploaded/TB1ojEOM4D1gK0jSZFsXXbldVXa.png",
						"appImage": null,
						"label": "#薇娅推荐#,#爆款清单#,#优惠力度大#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FtDDTO4ddOM6YOgkMQnjk7nX9Qsb",
						"highQuality": 0,
						"talentName": "半夏微凉",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FoJtOF0ufi3bcCSJ1nEgMtJfu_n4",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FiSga3aMY5CvUItUTsW832ZtlvAg",
						"followTimes": 0,
						"talentId": 9,
						"addtime": null,
						"itemNum": "20",
						"article": "前天给大家整理了一些李佳琦直播间的爆款商品大家看得还过瘾吗？没看过瘾今天继续！小伙伴千万别错过今天的文章今天要",
						"tclass": 2
					},
					{
						"id": 13277,
						"name": "双十一护肤篇|这些平价护肤品真的太可了！",
						"shortTitle": "护肤达人都在用",
						"image": "http://img.alicdn.com/imgextra/i1/2928278102/TB2p3WodbvpK1RjSZPiXXbmwXXa_!!2928278102.jpg",
						"appImage": null,
						"label": "#双十一护肤篇#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FupwDebmqqZz0NEy-Xk7mtNJxieC",
						"highQuality": 0,
						"talentName": "欢欢很欢乐",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FgnBUdZ09VN9uvcxlac9BLTmFqXM",
						"talentcat": 1,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FgxOBu0imCGI3h2bdEGCfvDzPtHF",
						"followTimes": 0,
						"talentId": 132,
						"addtime": null,
						"itemNum": "11",
						"article": "双十一对于我们来说真的是即开心又难受开心是因为东西真的便宜了不少难受是本宝宝又要剁手了&nbsp;&nbsp;",
						"tclass": 2
					},
					{
						"id": 13268,
						"name": "双11抄作业啦！宝妈都在买的高性价比童装",
						"shortTitle": "童装服饰合集来啦",
						"image": "https://img.alicdn.com/imgextra/i4/2200692135422/O1CN011SDHls1pvK1OOLXeI_!!2200692135422.jpg",
						"appImage": null,
						"label": "#童装预售#,#必买清单#,#超多款式任你选#",
						"tkItemId": null,
						"articleBanner": "http://img-haodanku-com.cdn.fudaiapp.com/FgWL_0cik6v1IkdNCxgJqkkwuC9d",
						"highQuality": 0,
						"talentName": "FY牛油果",
						"headImg": "http://img-haodanku-com.cdn.fudaiapp.com/FqIHtdhgrzR98dUhmHqyjApnS5ln",
						"talentcat": 4,
						"type": 0,
						"composeImage": "http://img-haodanku-com.cdn.fudaiapp.com/FghLnfdRlt5ahRylIjf7JlRTPAme",
						"followTimes": 0,
						"talentId": 131,
						"addtime": null,
						"itemNum": "46",
						"article": "哈喽，你们的小编又回来啦看到标题相信大家就能猜到今天这篇文章小编要给大家聊的是▼其实对于家有萌娃的家庭是深有体",
						"tclass": 2
					}
				],
				//推荐教程文章
				hotCrusePosts: [{
						image: 'https://cdn.uviewui.com/uview/swiper/1.jpg',
						title: '昨夜星辰昨夜风，画楼西畔桂堂东'
					},
					{
						image: 'https://cdn.uviewui.com/uview/swiper/2.jpg',
						title: '身无彩凤双飞翼，心有灵犀一点通'
					},
					{
						image: 'https://cdn.uviewui.com/uview/swiper/3.jpg',
						title: '谁念西风独自凉，萧萧黄叶闭疏窗，沉思往事立残阳'
					}
				],
				scrollTop: 0,
				showTip: true,
				backIconName: 'nav-back',
				showAction: true,
				useSlot: true,
				background: {
					'background-color': '#02553c'
				},
				isBack: true,
				search: true,
				custom: false,
				isFixed: true,
				keyword: ''

			}
		},
		onLoad(options) {
			this.keyword = options.keyword;

		},
		computed: {

		},
		methods: {
			//教程分类
			getCruseCats() {
				this.$http.get('api/list/cat/1/21').then((res) => {
					console.log(res, '========>首页顶部商品分类栏');
					let ts = [];
					res.forEach(function(value, index) {
						ts.push({
							'columnName': value.columnName,
							'columnImg': value.columnmIcon,
							'columnId': value.columnId
						});

					})
					this.cruseCats = ts;
				})

			},
			//热门推荐教程
			getHotCrusePosts() {

				this.$http.get('api/list/article/tag/22/10').then((res) => {
					let ts = [];
					res.forEach(function(value, index) {
						ts.push({
							'title': value.articleTitle,
							'image': value.articleImg,
							'articleId': value.articleId
						});
					})

					this.hotCrusePosts = ts;
				})
			},
			//最近发布教程
			getNowCrusePosts() {
				this.$http.get('api/list/article/tag/22/10').then((res) => {
					let ts = [];
					res.forEach(function(value, index) {
						ts.push({
							'title': value.articleTitle,
							'image': value.articleImg,
							'articleId': value.articleId
						});
					})
					this.nowCrusePosts = ts;
				})
			},
			//教程列表综合
			getCrusePosts() {
				this.$http.get('api/list/article/tag/22/10').then((res) => {
					let ts = [];
					res.forEach(function(value, index) {
						ts.push({
							'title': value.articleTitle,
							'image': value.articleImg,
							'articleId': value.articleId
						});
					})

					this.nowCrusePosts = ts;
				})
			}

		}
	}
</script>

<style lang="scss" scoped>
	@import '@/common/uni-ui.scss';

	page {
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		background-color: #efeff4;
		min-height: 100%;
		height: auto;
	}

	.uni-list-box {
		margin-top: 0;
	}

	.uni-content {
		padding-right: 10px;
	}

	.uni-note {
		display: flex;
		margin: 0;
		justify-content: space-between;
	}

	.tips {
		color: #67c23a;
		font-size: 14px;
		line-height: 40px;
		text-align: center;
		background-color: #f0f9eb;
		height: 0;
		opacity: 0;
		transform: translateY(-100%);
		transition: all 0.3s;
	}

	.tips-ani {
		transform: translateY(0);
		height: 40px;
		opacity: 1;
	}

	.content {
		width: 100%;
		display: flex;
	}

	.list-picture {
		width: 100%;
		height: 145px;
	}

	.thumb-image {
		width: 100%;
		height: 100%;
	}

	.ellipsis {
		display: flex;
		overflow: hidden;
	}

	.uni-ellipsis-1 {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	.uni-ellipsis-2 {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}

	.zg-weal-hot {
		padding-top: 10rpx;
		padding-bottom: 10rpx;
	}

	.u-th {
		background-color: #fff;
		border: none;
	}

	.zg-weal-swiper {
		padding: 5rpx;
	}

	.navbar-right {
		margin-right: 24rpx;
		display: flex;
	}

	.search-wrap {
		margin: 0 20rpx;
		flex: 1;
	}

	.right-item {
		margin: 0 12rpx;
		position: relative;
		color: #ffffff;
		display: flex;
	}

	.message-box {}

	.slot-wrap {
		display: flex;
		align-items: center;
		flex: 1;
	}

	.map-wrap {
		display: flex;
		align-items: center;
		padding: 4px 6px;
		background-color: rgba(240, 240, 240, 0.35);
		color: #fff;
		font-size: 22rpx;
		border-radius: 100rpx;
		margin-left: 30rpx;
	}

	.map-wrap-text {
		padding: 0 6rpx;
	}


	.item-container {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}

	.thumb-box {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		padding: 5rpx;
		margin-top: 20rpx;
	}

	.item-menu-image {
		width: 120rpx;
		height: 120rpx;
	}

	.scroll-content {
		width: 100%;
		padding: 0 16rpx;
		margin-bottom: 20rpx;

		.newScroll {
			width: 100%;
			height: 260rpx;

			.listcontent {
				white-space: nowrap;
				height: 100%;

				.news-items {
					display: inline-block;
					margin-right: 20rpx;

					.items-container {
						width: 335rpx;
						height: 260rpx;
						overflow: hidden;
						border-radius: 10rpx;

						.newsPic {
							width: 100%;
							height: 140rpx;
						}

						.bottom-info-container {
							width: 100%;
							height: 120rpx;
							padding: 0 20rpx;
							background-color: #F0F1F7;

							.newstitle {
								width: 100%;
								font-size: 24rpx;
								font-weight: 400;
								color: #333333;
								overflow: hidden;
								text-overflow: ellipsis;
								white-space: nowrap;
								margin-top: 10rpx;
							}

							.avatorType-content {
								width: 100%;
								margin-top: 10rpx;

								.avatar {
									width: 60rpx;
									height: 60rpx;
									border-radius: 50%;
									overflow: hidden;
								}

								.type-box {
									font-size: 24rpx;
									font-weight: 400;
									color: #999999;
									margin-left: 10rpx;
								}
							}
						}
					}
				}
			}
		}
	}

	.container-title {
		width: 100%;
		height: 80rpx;
		font-size: 28rpx;
		font-weight: 500;
		color: #333333;
		padding: 0 16rpx;
	}
</style>
