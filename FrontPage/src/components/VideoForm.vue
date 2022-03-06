<template>
  <div class="VideoForm">
    <video-player class="video-player vjs-custom-skin" :options="options" />
  </div>
</template>

<script>
const options = {
  playbackRates: [0.25, 0.5, 1.0, 1.25, 2.0], // 可选择的播放速度
  autoplay: false, // 如果true,浏览器准备好时开始回放。
  muted: false, // 默认情况下将会消除任何音频。
  loop: false, // 视频一结束就重新开始。
  preload: "auto",
  language: "zh-CN",
  aspectRatio: "16:9",
  sources: [
    {
      type: "video/mp4", // 类型
      src: "",
    },
  ],
  notSupportedMessage: "等待教师发布该视频",
};
import { getVideo } from "../api";
export default {
  name: "VideoForm",
  data() {
    return {
      options,
    };
  },
  mounted() {
    this.init();
  },
  methods: {
    //调用接口取数据
    init() {
      let id = this.$route.params.id;
      let params = new URLSearchParams();
      params.append("id", id.substr(1));
      getVideo(params)
        .then((res) => {
          //closeDebug console.log("-----------获取视频数据---------------");
          //closeDebug console.log(res.data);
          this.options.sources[0].src =
            "http://oem.844307947.xyz/api/upload/video/" +
            res[0].SubjectName +
            ".mp4"; //不知道为啥axios返回的地址无法被引用，只能先用简单粗暴的地址
        })
        .catch((failResponse) => {});
    },
  },
};
</script>

<style scoped>
.videoBtn button {
  margin: 8px 8px 0 0;
}
</style>
