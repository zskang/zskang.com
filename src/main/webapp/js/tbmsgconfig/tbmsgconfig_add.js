var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbMsgConfig:{}
	},
	created: function() {
		if(id != null){
			this.title = "修改";
			this.getInfo(id)
		}
    },
	methods: {
		getInfo: function(id){
            $.get("../tbmsgconfig/info/"+id, function(r){
                vm.tbMsgConfig = r.tbMsgConfig;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.tbMsgConfig.id == null ? "../tbmsgconfig/save" : "../tbmsgconfig/update";
            $.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbMsgConfig),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.back();
						});
					}else{
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