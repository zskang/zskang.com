var uuid = T.p("uuid");
function showOther() {
    document.getElementById("other2").value = "";
    var fromdepartment = document.getElementById("fromdepartment").value;
    if (fromdepartment == '其他') {
        document.getElementById("other").style.display = "block";
    } else {
        document.getElementById("other").style.display = "none";
    }
}
var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "新增文件处理单",
        tbFromDoc: {
            years: "",
            finishdate: ""
        }
    },
    methods: {
        save: function (event) {
            var lwjg = document.getElementById("other2").value;
            if (lwjg != null && lwjg != "" && lwjg.length > 0) {
                vm.tbFromDoc.fromdepartment = lwjg;
            }
            var url = "../tbfromdoc/save";
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