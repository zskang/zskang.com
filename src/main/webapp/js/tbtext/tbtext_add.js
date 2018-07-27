var id = T.p("id");
var type = T.p("type");
var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "新增",
        tbText: {
            contentStr: ""
        }
    },
    created: function () {
        if (id != null) {
            this.title = "修改";
            this.getInfo(id);
        }
    },
    methods: {
        getInfo: function (id) {
            $.get("../tbtext/info/" + id, function (r) {
                vm.tbText = r.tbText;
                $('#summernote').summernote('code', r.tbText.content);
            });
        },
        saveOrUpdate: function (event) {
            var cc = $("#contentStr").val();
            vm.tbText.contentStr = cc;
            vm.tbText.type = type;
            //alert(vm.tbText.type );
            var url = vm.tbText.id == null ? "../tbtext/save" : "../tbtext/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.tbText),
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