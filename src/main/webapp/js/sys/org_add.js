//机构ID
var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增机构",
		org:{
			enabled:1
		}
	},
	created: function() {
		if(id != null){
			this.title = "修改机构";
			this.getOrg(id)
		}
		//获取子机构信息
		 // this.getChildOrgList();
    },
	methods: {
		getOrg: function(id){
			$.get("../sys/org/info/"+id, function(r){
				vm.org = r.org;
			});
		},
		// getChildOrgList: function(){
		// 	$.get("../sys/org/getChildOrgList", function(r){
		 //		vm.childOrgList = r.childOrgList;
		 //	});
		// },
		saveOrUpdate: function (event) {
			var url = vm.org.id == null ? "../sys/org/save" : "../sys/org/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.org),
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