var id = T.p("id");
var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "新增",
        tbSendDoc: {}
    },
    created: function () {
        // document.getElementById("d").style.display = "none";
        if (id != null) {
            this.title = "修改";
            this.getInfo(id)
        }
        this.changeXh();
    },
    methods: {
        getInfo: function (id) {
            $.get("../tbsenddoc/info/" + id, function (r) {
                vm.tbSendDoc = r.tbSendDoc;
            });
        },
        changeXh: function (event) {
            $("#aaaa").val("");
            ///  document.getElementById("d").style.display = "none";
            //  document.getElementById("dddoctype").value = "";
            var doctype = $("#doctype").val();
            if (doctype == undefined || doctype == "") {
                doctype = 1;
            }
            // alert(doctype);
            if (doctype != "6") {
                $.get("../tbsenddoc/ddd/" + doctype, function (r) {
                    //   alert(r.msg);
                    $("#aaaa").val(r.msg);
                });
            } else {
                // document.getElementById("doctype").style.display = "none";
                //document.getElementById("d").style.display = "block";
            }
        },
        saveOrUpdate: function (event) {
            var url = vm.tbSendDoc.id == null ? "../tbsenddoc/save" : "../tbsenddoc/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.tbSendDoc),
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

function ddd() {
    $("#djh").val("001");
}