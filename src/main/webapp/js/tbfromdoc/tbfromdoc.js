$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbfromdoc/list',
        datatype: "json",
        colModel: [
            {label: 'uuid', name: 'uuid', key: true, width: 50, hidden: true},
            {label: '主题词', name: 'subjectword', width: 80, hidden: true},
            {
                label: '题名', name: 'title', width: 240
            },
            {label: '序号', name: 'filesequence', width: 80},
            {label: '办文编号', name: 'transactnumber', width: 80},
            {label: '年度', name: 'years', width: 80, hidden: false},
            {label: '密级', name: 'secretlevel', width: 80, hidden: true},
            {label: '文件类型', name: 'filetype', width: 80, hidden: true},
            {label: '文号', name: 'filenumber', width: 80, hidden: true},
            {label: '紧急程度', name: 'urgencylevel', width: 80},
            {label: '来文机关', name: 'fromdepartment', width: 80},
            {label: '文件份数', name: 'count', width: 80, hidden: true},
            {label: '保管期限', name: 'storageperiod', width: 80, hidden: true},
            {label: '页数', name: 'pagenumber', width: 80, hidden: true},
            {label: '收文时间', name: 'receiveddate', width: 80, hidden: true},
            {label: '实体分类号', name: 'entityclassnumber', width: 80, hidden: true},
            {label: '完成时限', name: 'finishdate', width: 80, hidden: true},
            {
                label: '操作', name: 'uuid', width: 160, formatter: function (value, options, row) {
                return "<a href='#' onclick=updateItem('" + value + "')>修改</a> " +
                    "<a href='#' onclick=zhipaiItem('" + value + "')>指派</a> " +
                    "<a href='#' onclick=deleteItem('" + value + "')>删除</a> " +
                    "<a href='#' onclick=printItem('" + value + "')>打印</a> " +
                    "<a href='#' onclick=uploadFile('" + value + "')>上传附件</a> " +
                    "<a href='#' onclick=detail('" + value + "')>查看</a>";
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

function zhipaiItem(uuid) {
    location.href = "tbfromdoc_zhipai.html?uuid=" + uuid;
}
function updateItem(uuid) {
    location.href = "tbfromdoc_update.html?uuid=" + uuid;
}

function deleteItem(uuid) {
    confirm('确定要删除选中的记录？', function () {
        $.ajax({
            type: "POST",
            url: "../tbfromdoc/delete1",
            data: JSON.stringify(uuid),
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

function printItem(uuid) {
    location.href = "tbfromdoc_print.html?uuid=" + uuid;
}

function uploadFile(uuid) {
    location.href = "tbfromdoc_uploadfile.html?uuid=" + uuid;
}


function detail(uuid) {
    location.href = "tbfromdoc_detail.html?uuid=" + uuid;
}
var vm = new Vue({
    el: '#rrapp',
    data: {},
    methods: {
        toupload: function (event) {
            var uuid = getSelectedRow();
            if (uuid == null) {
                return;
            }
            location.href = "tbfromdoc_uploadfile.html?uuid=" + uuid;
        },
        search: function (event) {
            var title = escape($("#title").val());
            $("#jqGrid").jqGrid('setGridParam', {
                url: "../tbfromdoc/list",
                postData: {'title': title}, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        },
        exportDatas: function (event) {
            $.ajax({
                type: "POST",
                url: "../tbfromdoc/checkQx",
                data: JSON.stringify("all"),
                success: function (r) {
                    if (r.code == 0) {
                        document.location.href = "../tbfromdoc/datasExport";
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        update: function (event) {
            var uuid = getSelectedRow();
            if (uuid == null) {
                return;
            }
            location.href = "tbfromdoc_update.html?uuid=" + uuid;
        },
        print: function (event) {
            var uuid = getSelectedRow();
            if (uuid == null) {
                return;
            }
            location.href = "tbfromdoc_print.html?uuid=" + uuid;
        },
        zhipai: function (event) {
            var uuid = getSelectedRow();
            if (uuid == null) {
                return;
            }
            location.href = "tbfromdoc_zhipai.html?uuid=" + uuid;
        },
        attach: function (event) {
            var uuid = getSelectedRow();
            if (uuid == null) {
                return;
            }
            location.href = "tbfromdoc_attach.html?uuid=" + uuid;
        },
        del: function (event) {
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }
            var fromDocIds = grid.getGridParam("selarrrow");
            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../tbfromdoc/delete",
                    data: JSON.stringify(fromDocIds),
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