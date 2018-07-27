var type = T.p("type");

$(function () {
    $("#jqGrid").jqGrid({
        url: '../mywork/list/' + type,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '文件题名', name: 'title', width: 80},
            {label: '指派人', name: 'fromUserId', width: 80},
            {label: '指派时间', name: 'doTime', width: 80},
            {
                label: '操作', name: 'uuid', width: 160, formatter: function (value, options, row) {
                return "<a href='#' onclick=detail('" + value + "')>查看</a>";
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
function detail(uuid) {
    location.href = "do.html?uuid=" + uuid;
}

var vm = new Vue({
    el: '#rrapp',
    data: {},
    methods: {}
});