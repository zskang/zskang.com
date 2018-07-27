$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbtask/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 50, key: true,hidden:true },

			{ label: '主题', name: 'title', width: 80 },
			{ label: '内容', name: 'content', width: 80 },
            { label: '任务类型', name: 'tasktype', width: 80 },
			{ label: '下发时间', name: 'createtime', width: 80 },
			{ label: '', name: 'extrafile', width: 80 ,hidden:true},
			{ label: '', name: 'createuserid', width: 80,hidden:true },
            { label: '下发人', name: 'createname', width: 80 },
            {
                label: '操作', name: 'id', width: 160, formatter: function (value, options, row) {
                return "<a href='#' onclick=huizhiItem('" + value + "')>查看回执</a> " /*+
                    "<a href='#' onclick=zhipaiItem('" + value + "')>指派</a> " +
                    "<a href='#' onclick=deleteItem('" + value + "')>删除</a> " +
                    "<a href='#' onclick=printItem('" + value + "')>打印</a> " +
                    "<a href='#' onclick=uploadFile('" + value + "')>上传附件</a> " +
                    "<a href='#' onclick=detail('" + value + "')>查看</a>"*/;
            }
            }
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

function huizhiItem(id) {

    location.href = "taskhuizhi.html?id=" + id;
}

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
			
			location.href = "tbtask_add.html?id="+id;
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax ({
					type: "POST",
				    url: "../tbtask/delete",
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
		},

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
	}
});