var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增",
		tbMsgLog:{}
	},
	created: function() {
		if(id != null){
			this.title = "修改";
			this.getInfo(id)
		}
    },
	methods: {
		getInfo: function(id){
            $.get("../tbmsglog/info/"+id, function(r){
                vm.tbMsgLog = r.tbMsgLog;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.tbMsgLog.id == null ? "../tbmsglog/save" : "../tbmsglog/update";
            $.ajax  ({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.tbMsgLog),
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