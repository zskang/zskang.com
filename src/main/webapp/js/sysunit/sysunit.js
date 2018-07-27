$(function () {
    $("#jqGrid").jqGrid({
        url: '../sysunit/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 50, key: true,hidden:true},
			{ label: '部门名称', name: 'name', width: 80 },
			{ label: '部门代码', name: 'code', width: 80 ,hidden:true},
			{ label: '联系人', name: 'contact', width: 80,hidden:true },
			{ label: '联系电话', name: 'mobile', width: 80 },
			{ label: '地址', name: 'address', width: 80 ,hidden:true,hidden:true},
			{ label: '邮箱', name: 'email', width: 80 },
			{ label: '网址', name: 'web', width: 80,hidden:true },
			{ label: '是否有效', name: 'enabled', width: 80,hidden:true },
			{ label: '创建时间', name: 'createtime', width: 80,hidden:true },
            { label: '类型', name: 'type', width: 80 ,hidden:true}
        ],
		viewrecords: true,
        height: 400,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		
	},
	methods: {
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			
			location.href = "sysunit_add.html?id="+id;
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax ({
					type: "POST",
				    url: "../sysunit/delete",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		}
	}
});