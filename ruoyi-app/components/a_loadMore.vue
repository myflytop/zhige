<template>
  <!-- loadMore -->
  <view class="bottom_loading_box" :style="{ paddingTop: padding, paddingBottom: padding }">
    <view class="box_right" v-if="status == 'loading'">
      <view
        v-if="mode == 'loading1'"
        class="loading_1"
        :style="{
          'border-color': color,
        }"
      >
        <view class="ball_holder">
          <view class="ball" :style="{ 'background-color': color }"></view>
        </view>
      </view>
      <view v-if="mode == 'loading2'" class="loading_2">
        <view class="line li1" :style="{ 'background-color': color }"></view>
        <view class="line li2" :style="{ 'background-color': color }"></view>
        <view class="line li3" :style="{ 'background-color': color }"></view>
      </view>
      <view v-if="mode == 'loading3'" class="loading_3" :style="{ 'border-top-color': color }"></view>
      <!-- <view v-if="mode == 'loading4'" class="loading_4" :class="{ left: !showTitle }"></view> -->
      <view v-if="mode == 'loading4'" class="loading_4">
        <view class="b1" :style="{ 'border-color': color }"></view>
        <view class="b2" :style="{ 'border-color': color }"></view>
      </view>
    </view>
    <view
      class="box_left"
      :style="{ color: textColor || color, fontSize: textSize }"
      :class="{ left: mode == 'loading4' }"
      v-if="showTitle"
      >{{ status == "down" ? loadTitle.down : status == "loading" ? loadTitle.loading : loadTitle.normal }}</view
    >
  </view>
</template>

<script>
export default {
  props: {
    /* loading 样式 */
    mode: {
      type: String,
      default: "loading1",
    },
    /* 状态 */
    status: {
      type: String,
      default: "loading",
    },
    /* 显示文本 */
    showTitle: {
      type: Boolean,
      default: true,
    },
    /* 加载中文本 */
    loadTitle: {
      type: Object,
      default() {
        return {
          down: "上拉显示更多",
          loading: "正在加载...",
          normal: "-- 没有更多了 --",
        };
      },
    },
    /* loading 颜色 */
    color: {
      type: String,
      default: "#FFF",
    },
    /* 上下边距 */
    padding: {
      type: String,
      default: "20rpx",
    },
    /* 文字样式 */
    textColor: String,
    textSize: String,
  },
};
</script>

<style lang="scss" scoped>
/* loading1  */
/* 外圆大小 */
$load1Wh: 16px;
/* border大小 */
$load1Border: 2px;
/* 内圆大小 */
$load1BallWh: 5px;

/* loading2 大小 */
$loading2Wh: 8px;

/* loading4 大小 */
$loading4Wh: 8px;
.bottom_loading_box {
  width: 100%;
  padding: 20rpx 0;
  display: flex;
  align-items: center;
  justify-content: center;
  .box_left {
    padding: 0 6px;
    &.left {
      position: relative;
      left: 8px;
    }
  }
  .box_right {
    .loading_1 {
      position: relative;
      width: $load1Wh;
      height: $load1Wh;
      margin: 0 auto;
      border: $load1Border solid #666666;
      border-radius: 100%;
      .ball_holder {
        position: absolute;
        width: 12px;
        height: 100%;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        margin: auto;
        animation: loading1 1.3s linear infinite;
        .ball {
          position: absolute;
          left: 0;
          top: 1px;
          width: $load1BallWh;
          height: $load1BallWh;
          border-radius: 100%;
          background: #666666;
        }
      }
    }
    .loading_2 {
      display: flex;
      align-items: center;
      .line {
        display: inline-block;
        margin: 0 2px;
        width: $loading2Wh;
        height: $loading2Wh;
        border-radius: 15px;
        background-color: #666666;
        &.li1 {
          animation: loading2 0.6s 0.1s linear infinite;
        }
        &.li2 {
          animation: loading2 0.6s 0.2s linear infinite;
        }
        &.li3 {
          animation: loading2 0.6s 0.3s linear infinite;
        }
      }
    }
    .loading_3 {
      border-radius: 50%;
      width: 16px;
      height: 16px;
      border: 0.25rem solid rgba(255, 255, 255, 0.2);
      border-top-color: #ffffff;
      animation: spin 1s infinite linear;
    }
    // color
    .loading_4 {
      border-radius: 50%;
      position: relative;
      opacity: 1;
      .b1,
      .b2 {
        border: $loading4Wh #ffffff solid;
        border-radius: 50%;
        width: 100%;
        height: 100%;
        position: absolute;
        top: -8px;
        left: -8px;
      }
      .b1 {
        transform: scale(1, 1);
        opacity: 1;
        animation: spWaveBe 0.6s infinite linear;
      }
      .b2 {
        transform: scale(0, 0);
        opacity: 0;
        animation: spWaveAf 0.6s infinite linear;
      }
    }
  }
}

@keyframes spWaveAf {
  from {
    transform: scale(0.5, 0.5);
    opacity: 0;
  }
  to {
    transform: scale(1, 1);
    opacity: 1;
  }
}
@keyframes spWaveBe {
  from {
    -webkit-transform: scale(1, 1);
    opacity: 1;
  }
  to {
    -webkit-transform: scale(1.5, 1.5);
    opacity: 0;
  }
}

@keyframes loading1 {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
@keyframes loading2 {
  0% {
    transform: translate(0, 0);
  }

  50% {
    transform: translate(0, -3px);
  }

  100% {
    transform: translate(0, 0);
  }
}
</style>
