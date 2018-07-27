var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		sysUnit:{}
	},
	created: function() {
		if(id != null){
			this.title = "修改";
			this.getInfo(id)
		}
    },
	methods: {
		getInfo: function(id){
			$.get("../sysunit/info/"+id, function(r){
                vm.sysUnit = r.sysUnit;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.sysUnit.id == null ? "../sysunit/save" : "../sysunit/update";
			$.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.sysUnit),
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