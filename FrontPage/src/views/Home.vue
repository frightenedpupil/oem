<template>
  <div class="home">
    <el-row :gutter="20">
      <el-col :span="8" :xs="24" style="margin-bottom:20px">
        <h3>欢迎使用</h3>
      </el-col>
      <el-col v-if="roleId == 1 || roleId == 2">
        <h4>
          上传视频须知：请使用格式工厂将视频转化为MP4文件，大小限制在100M以下，视频编码为AVC(H264)，否则课程视频可能无法播放。
        </h4>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "Home",
  methods: {},
  computed: {
    ...mapGetters(["roleId"]),
  },
};
</script>

<style></style>
