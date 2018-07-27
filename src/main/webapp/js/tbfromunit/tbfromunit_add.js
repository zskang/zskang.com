var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbFromUnit:{}
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
                vm.tbFromUnit = r.tbFromUnit;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.tbFromUnit.id == null ? "../tbfromunit/save" : "../tbfromunit/update";
			$.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbFromUnit),
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