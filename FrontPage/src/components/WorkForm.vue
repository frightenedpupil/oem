<template>
  <div class="WorkForm">
    <h3>添加作业</h3>
    <el-form
      ref="addworkForm"
      class="demo-form-inline"
      :model="addworkForm"
      label-position="top"
    >
      <el-form-item label="课程名称" prop="subject">
        <el-input
          type="text"
          placeholder="请输入作业名"
          v-model="subject"
          :disabled="true"
        >
        </el-input>
      </el-form-item>
      <el-form-item label="作业名称" prop="name">
        <el-input
          type="text"
          placeholder="请输入作业名"
          v-model="addworkForm.name"
        >
        </el-input>
      </el-form-item>
      <el-form-item label="作业内容" prop="name">
        <el-input
          type="textarea"
          :rows="2"
          placeholder="请输入内容"
          v-model="addworkForm.content"
        >
        </el-input>
      </el-form-item>
      <el-form-item label="作业截止时间" prop="DeadLine">
        <el-date-picker
          type="date"
          placeholder="选择日期"
          v-model="addworkForm.DeadLine"
          style="width: 100%"
          format="yyyy-MM-dd"
          value-format="yyyy-MM-dd"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="confirmAdd" style="width:100%" :loading="loading">
          添加</el-button
        >
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { addwork } from "../api";
import { mapGetters } from "vuex";
export default {
  name: "WorkForm",
  components: {},
  computed: {},
  data() {
    return {
      loading: false,
      ifSmall: false,
      subject: "形势与政策",
      paginationLayout: "prev, pager,next, jumper, ->, total, sizes",
      // 数据列表
      addworkForm: {
        name: "",
        DeadLine: "",
        content: "",
      },
    };
  },
  mounted() {},
  methods: {
    //数据格式化(还没用到)
    formatter(row, column) {
      return row.address;
    },
    //确认添加
    confirmAdd() {
      let _this = this;
      _this.loading = true;
      let params = new URLSearchParams();
      params.append("name", this.addworkForm.name);
      params.append("DeadLine", this.addworkForm.DeadLine);
      params.append("content", this.addworkForm.content);
      addwork(params)
        .then((res) => {
          //closeDebug console.log("-----------添加作业---------------");
          if (res.code === 0) {
            _this.$message({
              message: res.msg,
              type: "success",
            });
            _this.loading = false;
            _this.$router.push("/oem/work");
          } else {
            _this.$message({
              message: res.msg,
              type: "error",
            });
            _this.loading = false;
          }
        })
        .catch((failResponse) => {});

    },
  },
  computed: {
    ...mapGetters(["name", "roleId"]),
  },
};
</script>

<style>
.pagination {
  margin-top: 20px;
}
.check-group {
  margin-bottom: 10px;
}
.check-group > span {
  font-size: 14px;
  color: #606266;
  font-weight: 500;
}
</style>
