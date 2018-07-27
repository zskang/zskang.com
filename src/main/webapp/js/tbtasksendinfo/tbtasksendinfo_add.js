var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbTaskSendInfo:{}
	},
	created: function() {
		if(id != null){
			this.title = "修改";
			this.getInfo(id)
		}
    },
	methods: {
		getInfo: function(id){
			.get("../${pathName}/info/"+id, function(r){
                vm.tbTaskSendInfo = r.tbTaskSendInfo;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.tbTaskSendInfo.id == null ? "../tbtasksendinfo/save" : "../tbtasksendinfo/update";
			.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbTaskSendInfo),
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