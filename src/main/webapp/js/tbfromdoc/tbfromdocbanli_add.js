var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbFromDocBanli:{}
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
                vm.tbFromDocBanli = r.tbFromDocBanli;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.tbFromDocBanli.id == null ? "../tbfromdocbanli/save" : "../tbfromdocbanli/update";
			$.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbFromDocBanli),
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