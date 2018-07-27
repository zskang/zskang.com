var uuid = T.p("uuid");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbFromDoc:{}
	},
	created: function() {
		if(uuid != null){
			this.title = "修改";
			this.getInfo(uuid)
		}
    },
	methods: {
		getInfo: function(uuid){
            $.get("../tbfromdoc/info/"+uuid, function(r){
                vm.tbFromDoc = r.tbFromDoc;
            });
		},
		saveOrUpdate: function (event) {
			var url = "../tbfromdoc/update";
            $.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbFromDoc),
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