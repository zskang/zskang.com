$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbsenddoc/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '年度', name: 'nd', width: 80},
            {label: '发文时间', name: 'fwsj', width: 80},
            {label: '序号', name: 'djh', width: 80},
            {label: '文号', name: 'wh', width: 120},
            {label: '题名', name: 'timing', width: 250},
            {label: '责任者', name: 'zrz', width: 80},
            {label: '签发人', name: 'qfr', width: 80},
            {label: '保管期限', name: 'bgqx', width: 80},
            {
                label: '操作', name: 'id', width: 160, formatter: function (value, options, row) {
                return "<a href='#' onclick=updateItem('" + value + "')>修改</a> " +
                    "<a href='#' onclick=deleteItem('" + value + "')>删除</a> " +
                    "<a href='#' onclick=detailItem('" + value + "')>查看</a>";
            }
            }
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


function exportDatas() {
    location.href = "tbsenddoc_add.html?uuid=" + id;
}


function updateItem(id) {
    location.href = "tbsenddoc_add.html?uuid=" + id;
}


function detailItem(id) {
    location.href = "tbsenddoc_detail.html?uuid=" + id;
}

function deleteItem(id) {
    confirm('确定要删除选中的记录？', function () {
        $.ajax({
            type: "POST",
            url: "../tbsenddoc/delete1",
            data: JSON.stringify(id),
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

var vm = new Vue({
    el: '#rrapp',
    data: {},
    methods: {
        exportDatas: function (event) {
            $.ajax({
                type: "POST",
                url: "../tbfromdoc/checkQx",
                data: JSON.stringify("all"),
                success: function (r) {
                    if (r.code == 0) {
                        document.location.href = "../tbsenddoc/datasExport";
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        search: function (event) {
            var wh = escape($("#wh").val());
            var tm = escape($("#tm").val());
            $("#jqGrid").jqGrid('setGridParam', {
                url: "../tbsenddoc/list",
                postData: {'wh': wh, 'tm': tm}, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }

            location.href = "tbsenddoc_add.html?id=" + id;
        }, fuckall: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }

            location.href = "tbsenddoc_fuckall.html?id=" + id;
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../tbsenddoc/delete",
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