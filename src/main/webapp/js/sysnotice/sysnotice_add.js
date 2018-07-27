var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		sysNotice:{}
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
                vm.sysNotice = r.sysNotice;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.sysNotice.id == null ? "../sysnotice/save" : "../sysnotice/update";
			$.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.sysNotice),
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