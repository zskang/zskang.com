$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/user/list',
        datatype: "json",
        colModel: [
            {label: '用户ID', name: 'userId', width: 45, key: true, hidden: true},
            {label: '名称', name: 'xm', width: 75},
            {label: '用户名', name: 'username', width: 75},
            {label: '手机号', name: 'mobile', width: 100},
            {
                label: '状态', name: 'status', width: 80, formatter: function (value, options, row) {
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }
            },
            {label: '部门', name: 'unitname', width: 80},
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
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        unitlist:{}
        },
    created: function() {
        this.getunitlist();
    },
    methods: {
        search: function (event) {
            var xm = escape($("#xm").val());
            var username = escape($("#username").val());
            var mobile = escape($("#mobile").val());
            var status = escape($("#status").val());
            var roleId = escape($("#roleId").val());
            var unitid = escape($("#unitid").val());
            $("#jqGrid").jqGrid('setGridParam', {
                url: '../sys/user/list',
                postData: {'xm': xm, 'username': username, 'mobile': mobile, 'status': status, 'roleId': roleId, 'unitid': unitid}, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        },
        getunitlist: function(){

            $.get("../sys/user/select", function(r){

                vm.unitlist = r.list;


            });
        },
        getRoleList: function(){
            $.get("../sys/role/select", function(r){
                vm.roleList = r.list;
            });
        },
        sendmsg: function (event) {
            var userIds = getSelectedRows();
            if (userIds == null) {
                return;
            }
            var msgFrame = "write_msg.html?userIds=" + userIds;
            $("#writeMsg").attr("src", msgFrame);
            $("#dialogWriteMsg").modal('show');
        },
        ddd: function (event) {
            $("#dialogWriteMsg").modal('hide');
        }
    }
});