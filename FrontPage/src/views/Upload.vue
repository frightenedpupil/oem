<template>
  <div class="upload">
    <h3>提交作业</h3>

    <!---作业列表部分，选中作业后隐藏--->
    <div v-show="!ifSelected">
      <el-form :inline="true" class="demo-form-inline" size="small">
        <el-form-item>
          <el-input
            v-model="search"
            style="width:130px"
            placeholder="查找关键字"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSearch">查找</el-button>
        </el-form-item>
        <el-form-item>
          <el-button @click="cancelSearch">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table
        :data="tableData"
        border
        style="width: 100%"
        :default-sort="{ prop: 'WorkName', order: 'descending' }"
      >
        <el-table-column prop="id" width="80" label="序号"> </el-table-column>
        <el-table-column prop="WorkName" label="作业名称"> </el-table-column>
        <el-table-column prop="DeadLine" label="截止日期"> </el-table-column>
        <el-table-column label="操作" width="80" fixed="right" align="center">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
              >上传</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div slot="tip" class="el-upload__tip">
        作业一经提交不可再修改，请完成后再提交。
      </div>
      <el-pagination
        class="pagination"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10, 20, 30, 40, 50, 100]"
        :page-size="pageSize"
        :layout="paginationLayout"
        :small="ifSmall"
        :total="dataCount"
      >
      </el-pagination>
    </div>

    <!---提交表单部分，选中作业后显示--->

    <UploadForm
      :WorkName="WorkSelected"
      :WorkContent="WorkContentSelected"
      :WorkId="WorkIdSelected"
      :DeadLine="SelectedDeadLine"
      :goback="goBack"
      v-show="ifSelected"
    >
    </UploadForm>
  </div>
</template>

<script>
import { getWorkList } from "../api";
import { mapGetters } from "vuex";
import UploadForm from "../components/UploadForm.vue";
export default {
  name: "Upload",
  components: { UploadForm },
  data() {
    return {
      ifSmall: false,
      paginationLayout: "prev, pager,next,  ->, total",
      ifSelected: false,
      WorkSelected: "",
      WorkIdSelected: 0,
      currentPage: 1,
      pageSize: 10,
      tableData: [{}],
      dataCount: 0, //总数据条数
      search: "",
    };
  },
  mounted() {
    this.getTableData();
    if (document.documentElement.clientWidth < 720) {
      //closeDebug console.log("触发移动端布局");
      this.ifSmall = true;
    }
  },
  methods: {
    //调用接口取数据
    getTableData() {
      //参数绑定「分页大小、页码」
      let params = new URLSearchParams();
      params.append("limit", this.pageSize);
      params.append("page", this.currentPage);
      params.append("key", this.search);
      getWorkList(params)
        .then((res) => {
          //closeDebug console.log("-----------获取表格数据---------------");
          //closeDebug console.log(res.data);
          this.tableData = res.data;
          this.dataCount = res.count;
        })
        .catch((failResponse) => {});
    },
    //查找作业
    onSearch() {
      this.getTableData();
    },
    //取消查找
    cancelSearch() {
      this.search = "";
      this.getTableData();
    },
    //数据格式化
    formatter(row, column) {
      return row.address;
    },
    handleSizeChange(val) {
      this.currentPage = 1;
      this.pageSize = val;
      //closeDebug console.log(`每页 ${val} 条`);
      this.getTableData();
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      //closeDebug console.log(`当前页: ${val}`);
      this.getTableData();
    },
    //处理选中，隐藏作业列表，显示提交表单
    handleEdit(index, row) {
      //closeDebug console.log("选中了", index, row);
      this.WorkSelected = row.WorkName;
      this.WorkIdSelected = row.id;
      this.WorkContentSelected = row.WorkContent;
      this.SelectedDeadLine = row.DeadLine;
      this.ifSelected = true;
    },
    //返回重选作业
    goBack() {
      this.ifSelected = false;
    },
  },
  computed: {
    ...mapGetters([]),
  },
};
</script>

<style>
.upload > .el-button {
  margin-top: 1em;
  margin-bottom: 1em;
}
.back-button {
  margin-top: 1em;
  margin-bottom: 1em;
}
.pagination {
  margin-top: 20px;
}
</style>
