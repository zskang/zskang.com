var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbFileAttach:{}
	},
	created: function() {
		if(id != null){
			this.title = "修改";
			this.getInfo(id)
		}
    },
	methods: {
		getInfo: function(id){
			$.get("../${pathName}/info/"+id, function(r){
                vm.tbFileAttach = r.tbFileAttach;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.tbFileAttach.id == null ? "../tbfileattach/save" : "../tbfileattach/update";
			$.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbFileAttach),
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