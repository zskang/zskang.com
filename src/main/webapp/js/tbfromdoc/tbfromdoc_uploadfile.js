var uuid = T.p("uuid");
function chk() {
    var obj = document.getElementsByName('tbFromDoc.ldArr');
    var s = '';
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].checked) s += obj[i].value + ','; //如果选中，将value添加到变量s中
    }
    if(s.length>0){
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
        title: "上传附件",
        unitlist: {},
        tbFromDoc: {
            unitid:""
        }
    },
    created: function () {
        if (uuid != null) {//修改
            this.getInfo(uuid);
            var upload_src = "http://61.190.254.172:8080/upload/index.html?uuid=" + uuid;
            $("#uploadFrame").attr("src", upload_src);
        }
    },
    methods: {
        selectFile: function () {
            $("#dialogSelectUpload").modal('hide');
        },
        getInfo: function (fromDocId) {
            $.get("../tbfromdoc/info/" + uuid, function (r) {
               // alert(r.tbFromDoc.urgencylevel);
                vm.tbFromDoc = r.tbFromDoc;
                setSelectChecked("urgencylevel",r.tbFromDoc.urgencylevel);
            });
        },
        uploadFile: function (event) {
            chk();
            var url = "../tbfromdoc/uploadFile";
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