$(function () {
    $("#jqGrid").jqGrid({
        url: '../syslog/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 50, key: true },
			{ label: '客户端ip', name: 'clientip', width: 80 },
			{ label: '操作内容', name: 'operatecontent', width: 80 },
			//{ label: '模块编号', name: 'operatemodule', width: 80 },
			{ label: '操作结果', name: 'operateresult', width: 80 },
			{ label: '操作时间', name: 'operatetime', width: 80 },
			{ label: '操作类型', name: 'operatetype', width: 80 },
			{ label: '操作人名称', name: 'username', width: 80 },
			{ label: '模块名称', name: 'operatemodulename', width: 80,hidden:true }
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
			
			location.href = "syslog_add.html?id="+id;
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax ({
					type: "POST",
				    url: "../syslog/delete",
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