$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbfromdocbanli/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 50, key: true },
			{ label: '来文id', name: 'fromDocId', width: 80 }, 			
			{ label: '办理人员id', name: 'userId', width: 80 }, 			
			{ label: '接收时间', name: 'receivedtime', width: 80 }, 			
			{ label: '是否查阅    0:否 1:是', name: 'read', width: 80 }, 			
			{ label: '是否反馈    0:否 1:是', name: 'feedback', width: 80 }, 			
			{ label: '预留1', name: 'spare1', width: 80 }, 			
			{ label: '预留3', name: 'spare2', width: 80 }, 			
			{ label: '备注', name: 'comment', width: 80 }, 			
			{ label: '文件来源用户id', name: 'fromUserId', width: 80 }, 			
			{ label: '指派到的用户id', name: 'toUserId', width: 80 }, 			
			{ label: '阅读时间', name: 'readtime', width: 80 }, 			
			{ label: '反馈时间', name: 'feedbacktime', width: 80 }, 			
			{ label: '指派时间', name: 'sendtime', width: 80 }, 			
			{ label: '是否指派   0:否 1:是', name: 'send', width: 80 }			
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
			
			location.href = "tbfromdocbanli_add.html?id="+id;
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax ({
					type: "POST",
				    url: "../tbfromdocbanli/delete",
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