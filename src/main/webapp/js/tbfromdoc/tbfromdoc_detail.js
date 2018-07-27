var uuid = T.p("uuid");
$(function () {
    $("#attachJqGrid").jqGrid({
        url: '../tbfileattach/list/' + uuid + '/3',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '附件名称', name: 'filename'},
            {label: '文件路径', name: 'filepath', hidden: true},
            {label: '创建时间', name: 'createtime', width: 80}
        ],
        viewrecords: true,
        height: 200,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#attachjqGridPager",
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
            $("#attachJqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });


    $("#zhipaiRyJqGrid").jqGrid({
        url: '../sys/user/listByUnit4zhipai/ALL/' + uuid,
        datatype: "json",
        colModel: [
            {label: '用户ID', name: 'userId', width: 45, key: true, hidden: true},
            {label: '姓名', name: 'xm', width: 75},
            {label: '手机号', name: 'mobile', width: 100},
            {label: '角色', name: 'rolename', width: 80},
            {
                label: '查看状态', name: 'state', width: 80, formatter: function (value, options, row) {
                return ss(value);

            }
            }
        ],
        viewrecords: true,
        height: 200,
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
            $("#zhipaiRyJqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});
var rmi_url = "http://61.190.254.172:8080";
function ss(value) {
    if (value === 0) {
        return '<span class="label label-danger">未查看</span>';
    } else if (value === 1) {
        return '<span class="label label-success">已查看</span>';
    } else {
        return '<span class="label label-success">已反馈</span>';
    }
}

var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "新增",
        tbFromDoc: {}
    },
    created: function () {
        if (uuid != null) {
            this.title = "明细";
            this.getInfo(uuid)
        }
    },
    methods: {
        download: function (event) {
            var grid = $("#attachJqGrid");
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
            var rowData = $("#attachJqGrid").jqGrid("getRowData", obj);
            if (rowData.filepath != null && rowData.filepath != "") {
                var url = rmi_url + rowData.filepath;
                var filename = rowData.filename;
                window.open(url, filename);
            }
            else {
                alert("暂未上传相关附件！");
                return;
            }
        },
        getInfo: function (uuid) {
            $.get("../tbfromdoc/info/" + uuid, function (r) {
                vm.tbFromDoc = r.tbFromDoc;
            });
        },
        back: function (event) {
            history.go(-1);
        }
    }
});