$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbxinxishangbao/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 50, key: true,hidden:true },
			{ label: '标题', name: 'title', width: 80 },
			{ label: '内容', name: 'content', width: 80  },
            { label: '上传人姓名', name: 'username', width: 80 },
            { label: '上传时间', name: 'createtime', width: 80 }
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
        images:function (event) {
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }
            var selectedIDs = grid.getGridParam("selarrrow");
            if (selectedIDs.length > 1) {
                alert("只能选择一条记录");
                return;
            }
            var obj = selectedIDs[0];
            location.href = "xxsb_attach.html?uuid=" + obj;
        },
        download: function (event) {
            var grid = $("#jqGrid");
            var rowKey = grid.getGridParam("selrow");
            if (!rowKey) {
                alert("请选择一条记录");
                return;
            }

            var selectedIDs = grid.getGridParam("selarrrow");
            if (selectedIDs.length > 1) {
                alert("只能选择一条记录");
                return;
            }

            var obj = selectedIDs[0];
            var rowData = $("#jqGrid").jqGrid("getRowData", obj);
            var url = "http://220.180.110.108:8080/static_res/jyjuploadfiles/"+rowData.extrafile;
            window.open(url);
        },
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			
			location.href = "tbxinxishangbao_add.html?id="+id;
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax ({
					type: "POST",
				    url: "../tbxinxishangbao/delete",
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