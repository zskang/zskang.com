/**
 * Created by zhougang on 2017/7/9/009.
 */
var uuid = T.p("uuid");
$(function () {
    $("#uuid").val(uuid);
    $("#jqGrid").jqGrid({
        url: '../sys/user/listByUnit4zhipai/ALL/'+uuid,
        datatype: "json",
        colModel: [
            {label: '用户ID', name: 'userId', width: 45, key: true, hidden: true},
            {label: '姓名', name: 'xm', width: 75},
            {label: '手机号', name: 'mobile', width: 100},
            {label: '角色', name: 'rolename', width: 80}
        ],
        viewrecords: true,
        height: 400,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

});
var vm = new Vue({
    el: '#rrapp',
    data: {
        unitid: "",
        unitlist: {}
    },
    created: function () {
        this.getunitlist();
    },
    methods: {
        search: function (event) {
            var xm = escape($("#xm").val());
            var unitId = escape($("#dsds").val());
            $("#jqGrid").jqGrid('setGridParam', {
                url: '../sys/user/listByUnit4zhipai/' + unitId+'/'+uuid,
                postData: {'xm': xm}, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        },
        getunitlist: function () {
            $.get("../sys/user/select", function (r) {
                vm.unitlist = r.list;
            });
        }
    }
});