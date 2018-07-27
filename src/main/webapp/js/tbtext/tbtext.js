var type = T.p("type");
$(function () {
    $("#type").val(type);
    if (type == '0' || type == '2') {
        document.getElementById("ddd").style.display = "none";
        document.getElementById("ddd2").style.display = "block";
    } else {
        document.getElementById("ddd").style.display = "block";
        document.getElementById("ddd2").style.display = "none";
    }

    $("#jqGrid").jqGrid({
        url: '../tbtext/list/' + type,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '标题', name: 'title', width: 80},
            {label: '发布人', name: 'userid', width: 80},
            {label: '发布时间', name: 'createtime', width: 80}
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
        add: function (event) {
            location.href = "tbtext_add.html?type=" + $("#type").val();
        },
        images: function (event) {
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
            var obj = selectedIDs[0];
            location.href = "image_attach.html?uuid=" + obj;
        },
        fuck:function (event) {
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }
            var ids = grid.getGridParam("selarrrow");
            confirm('确定要发送选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../tbtext/fuckout",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.code == 0) {
                            alert('发送成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        info: function (event) {
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
            location.href = "tbtext_info.html?id=" + id;
        },
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
            location.href = "tbtext_add.html?id=" + id;
        },
        del: function (event) {
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }
            var ids = grid.getGridParam("selarrrow");
            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../tbtext/delete",
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