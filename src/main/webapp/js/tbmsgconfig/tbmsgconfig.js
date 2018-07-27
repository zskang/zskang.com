$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbmsgconfig/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '紧急程度', name: 'urgencylevel', width: 80},
            {label: '指派时是否发短信', name: 'sfzpsend', width: 80},
            {label: '提前提醒天数', name: 'tqday', width: 80},
            {label: '当天是否提醒', name: 'sfdtsend', width: 80},
            {label: '已查看后是否发短信', name: 'sfseesend', width: 80},
            {label: '已反馈后是否发短信', name: 'sffankuisend', width: 80}
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
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }

            var selectedIDs = grid.getGridParam("selarrrow");
            if (selectedIDs.length > 1) {
                alert("只能选择一条记录");
                return;
            }

            var id = selectedIDs[0];

            location.href = "tbmsgconfig_add.html?id=" + id;
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../tbmsgconfig/delete",
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