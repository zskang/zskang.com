var uuid = T.p("uuid");
var rmi_url = "http://61.190.254.172:8080";
$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbfileattach/list/' + uuid + '/4',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '附件名称', name: 'filename'},
            {label: '文件路径', name: 'filepath', hidden: true},
            {label: '创建时间', name: 'createtime', width: 80}
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
        download: function (event) {
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
            var rowData = $("#jqGrid").jqGrid("getRowData", obj);
            if (rowData.filepath != null && rowData.filepath != "") {
                var url = rmi_url + rowData.filepath;
                window.open(url);
            }
            else {
                alert("暂未上传相关附件！")
                return;
            }
        },
        back: function (event) {
            history.go(-1);
        }
    }
});