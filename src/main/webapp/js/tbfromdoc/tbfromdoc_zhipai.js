var uuid = T.p("uuid");
$(function () {


    $("#ALlJqGrid").jqGrid({
        url: '../sys/user/listByUnit/ALL',
        datatype: "json",
        colModel: [
            {label: '用户ID', name: 'userId', width: 45, key: true, hidden: true},
            {label: '姓名', name: 'xm', width: 75},
            {label: '手机号', name: 'mobile', width: 110},
            {label: '角色', name: 'rolename', width: 100},
            {label: '所属机构', name: 'unitname', width: 180},
            {
                label: '操作', name: 'userId', width: 60, formatter: function (value, options, row) {
                return "<a href='#' onclick=selectItem('" + value + "')>选择</a> ";
            }
            }
        ],
        viewrecords: true,
        height: 200,
        rowNum: 10,
        width: 800,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: false,
        multiselect: true,
        pager: "#ALlJqGridPager",
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
            $("#ALlJqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });


    $("#hasJqGrid").jqGrid({
        url: '../sys/user/listByUnit4HasSelected/' + uuid,
        datatype: "json",
        colModel: [

            {label: 'id', name: 'id', width: 45, key: true, hidden: true},
            {label: '用户ID', name: 'userid', width: 45, hidden: true},
            {label: '姓名', name: 'xm', width: 75},
            {label: '手机号', name: 'mobile', width: 100},
            {label: '所在机构', name: 'uname', width: 100},
            {
                label: '操作', name: 'id', width: 160, formatter: function (value, options, row) {
                return "<a href='#' onclick=cancelSelectItem('" + value + "')>取消选择</a> ";
            }
            }
        ],
        viewrecords: true,
        height: 200,
        rowNum: 10,
        width: 800,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: false,
        multiselect: false,
        pager: "#hsJqGridPager",
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
            $("#hasJqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
    $("#zhipaiRyJqGrid").jqGrid({
        url: '../sys/user/listByUnit4zhipai/ALL/' + uuid,
        datatype: "json",
        colModel: [
            {label: '用户ID', name: 'userId', width: 45, key: true, hidden: true},
            {label: '姓名', name: 'xm', width: 75},
            {label: '手机号', name: 'mobile', width: 100},
            {label: '角色', name: 'rolename', width: 80}
        ],
        viewrecords: true,
        height: 200,
        width: 800,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: false,
        multiselect: true,
        pager: "#zhipaiRyJqGridPager",
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

function refalshGrids() {
    $("#ALlJqGrid").trigger("reloadGrid");
    $("#hasJqGrid").trigger("reloadGrid");
}

function selectItem(id) {
    // alert(id);
    var url = "../tbtempuser/saveOne/" + uuid;
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(id),
        success: function (r) {
            if (r.code === 0) {
                alert('操作成功', function (index) {
                    refalshGrids();
                });
            } else {
                alert(r.msg);
            }
        }
    });
    refalshGrids();
}
function cancelSelectItem(id) {
    var url = "../tbtempuser/deleteOne";
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(id),
        success: function (r) {
            if (r.code === 0) {
                alert('操作成功', function (index) {
                    refalshGrids();
                });
            } else {
                alert(r.msg);
            }
        }
    });
}

function selectALL() {
    var unitid = $("#unitid").val();
    //alert(unitid+"--"+uuid);
    var url = "../tbtempuser/saveAll/" + unitid;
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(uuid),
        success: function (r) {
            if (r.code === 0) {
                alert('操作成功', function (index) {
                    refalshGrids();
                });
            } else {
                alert(r.msg);
            }
        }
    });
}
function cancelSelectALL() {
    //  alert("cancelSelectALL");
    var url = "../tbtempuser/deleteAll";
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(uuid),
        success: function (r) {
            if (r.code === 0) {
                alert('操作成功', function (index) {
                    refalshGrids();
                });
            } else {
                alert(r.msg);
            }
        }
    });
}

function chk() {
    var obj = document.getElementsByName('tbFromDoc.ldArr');
    var s = '';
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].checked) s += obj[i].value + ','; //如果选中，将value添加到变量s中
    }
    if (s.length > 0) {
        vm.tbFromDoc.ldArr = s.substr(0, s.length - 1);
    }
}
function setSelectChecked(selectId, checkValue) {
    var select = document.getElementById(selectId);
    for (var i = 0; i < select.options.length; i++) {
        if (select.options[i].value == checkValue) {
            select.options[i].selected = true;
            break;
        }
    }
}
var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "任务指派",
        unitlist: {},
        unitid: "",
        tbFromDoc: {
            unitid: ""
        }
    },
    created: function () {
        if (uuid != null) {//修改
            this.getInfo(uuid);
            this.getunitlist();
            //var srccc = "selectUsers.html?uuid=" + uuid ;
            //$("#selectUsers11").attr("src", srccc);
            //var selectedUsers_history = "selectedUsers_history.html?uuid=" + uuid ;
            //$("#selectUsers22").attr("src", selectedUsers_history);
        }
    },
    methods: {
        search: function (event) {
            var xm = escape($("#xm").val());
            var unitId = escape($("#dsds").val());
            $("#ALlJqGrid").jqGrid('setGridParam', {
                url: '../sys/user/listByUnit/' + unitId,
                postData: {'xm': xm}, //发送数据
                page: 1
            }).trigger("reloadGrid"); //重新载入
        },
        ok: function (event) {
            $.post(
                "../tbfromdoc/dozhipai/" + uuid,
                {}, function (r) {
                    if (r.code == 0) {
                        alert('操作成功', function (index) {
                            vm.back();
                        });
                    } else {
                        alert(r.msg);
                    }
                });
        },
        getunitlist: function () {
            $.get("../sys/user/select", function (r) {
                vm.unitlist = r.list;
            });
        },
        doSelectUser: function () {
            $("#dialogSelectBanLiUsers").modal('hide');
        },
        doSelectUser2: function () {
            $("#dialogSelectedBanLiUsers").modal('hide');
        },
        getInfo: function (fromDocId) {
            $.get("../tbfromdoc/info/" + uuid, function (r) {
                vm.tbFromDoc = r.tbFromDoc;
                setSelectChecked("urgencylevel", r.tbFromDoc.urgencylevel);
            });
        },
        zhipai: function (event) {
            chk();
            var url = "../tbfromdoc/zhipai";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.tbFromDoc),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.back();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        back: function (event) {
            history.go(-1);
        }
    }
});