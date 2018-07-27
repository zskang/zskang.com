$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbbanli/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '文档编号', name: 'docId', width: 80},
            {label: '操作时间', name: 'doTime', width: 80},//1:阅读时间  2  反馈时间 3.指派时间
            {label: '操作类型', name: 'doType', width: 80}, 			//1:阅读 2 反馈 3 指派
            {label: '谁指派', name: 'fromUserId', width: 80},
            {label: '谁来做', name: 'toUserId', width: 80},
            {label: '备注', name: 'remark', width: 80}
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
    data: {},
    methods: {
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }

            location.href = "tbbanli_add.html?id=" + id;
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../tbbanli/delete",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        }
    }
});