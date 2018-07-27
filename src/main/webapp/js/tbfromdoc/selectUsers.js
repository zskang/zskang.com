/**
 * Created by zhougang on 2017/7/9/009.
 */
var uuid = T.p("uuid");
$(function () {

    $("#uuid").val(uuid);

    $("#jqGrid").jqGrid({
        url: '../sys/user/listByUnit/ALL',
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
                url: '../sys/user/listByUnit/' + unitId,
                postData: {'xm': xm}, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        },
        getunitlist: function () {
            $.get("../sys/user/select", function (r) {
                vm.unitlist = r.list;
            });
        },
        ok: function () {
            var uuid = $("#uuid").val();
            var unitId = $("#dsds").val();
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }
            var ids = grid.getGridParam("selarrrow");

            var params = uuid + "&" + unitId + "&" + ids;
            if (unitId == 'null' || unitId == null || unitId == "") {
                alert("请选择单位后进行查询！");
                return;
            }
            if (!ids) {
                alert("请确定当前部门下有人员存在！");
                return;
            } else {
                $.post(
                    "../tbfromdoc/saveBanliRelation/" + params,
                    {}, function (r) {
                        if (r.code == 0) {
                            alert('操作成功');
                        } else {
                            alert(r.msg);
                        }
                    });
            }
        }
    }
});