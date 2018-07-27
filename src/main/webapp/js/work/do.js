var uuid = T.p("uuid");
var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "新增",
        tbFromDoc: {}
    },
    created: function () {
        if (uuid != null) {
            this.title = "明细";
            this.readinfo(uuid)
        }
    },
    methods: {
        readinfo: function (uuid) {
            $.get("../tbfromdoc/readinfo/" + uuid, function (r) {
                vm.tbFromDoc = r.tbFromDoc;
            });
        },
        back: function (event) {
            history.go(-1);
        }
    }
});
var rmi_url = "http://61.190.254.172:8080";

$(function () {
    $("#attachJqGrid").jqGrid({
        url: '../tbfileattach/list/' + uuid + '/3',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '附件名称', name: 'filename'},
            {label: '文件路径', name: 'filepath', hidden: true},
            {label: '创建时间', name: 'createtime', width: 80},
            {
                lable: '下载', name: 'filepath', width: 80, formatter: function (value, options, row) {
                return "<a href='#' onclick=download('" + value + "')>查看</a>";
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
});
function download(filepath) {
    var url = rmi_url + filepath;
    window.open(url);
}