$(function () {
    $("#jqGrid").jqGrid({
        url: '../tbtasksendinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'staticid', name: 'staticid', width: 50, key: true ,hidden:true},
            { label: '科室', name: 'unitname', width: 80 },
			{ label: '姓名', name: 'staticname', width: 80 },
			{ label: '每日一事(个)', name: 'mryscount', width: 80 },
			{ label: '每周一悟(个)', name: 'mzywcount', width: 80 },
            {
                label: '操作', name: 'staticid', width: 160, formatter: function (value, options, row) {
                return "<a href='#' onclick=infoItem('" + value + "')>查看每日一事</a> " +
                    "<a href='#' onclick=infoItem1('" + value + "')>查看每周一悟</a> "/* +
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


var staticidpar;
var type;
var diatitle;
function infoItem(staticid) {
    staticidpar=staticid;
    type=0;
    diatitle="每日一事";
    $("#typeparent").val(type);
    $("#staticidparent").val(staticidpar);

    // $("#uploadFrame").attr("src", '../tbtasksendinfo/tbtext.html/');
    // $("#dialogSelectUpload").modal('show');





    opendia();

}

function infoItem1(staticid) {
    staticidpar=staticid;
    type=2;
    diatitle="每周一悟";
    $("#typeparent").val(type);
    $("#staticidparent").val(staticidpar);

    opendia();
}

 function   opendia(){
    layer.open({
        type: 2,
        offset: '50px',
        // skin: 'layui-layer-molv',
        title: diatitle,
        area: ['900px', '450px'],
        shade: 0,
        shadeClose: false,
        content: '../tbtasksendinfo/tbtext.html/',
        // btn: ['确定', '取消'],
        // btn1: function (index) {
        //
        //
        //     layer.close(index);
        // }
    });
}





var vm = new Vue({
	el:'#rrapp',
	data:{
		choose:{
			month:"",
            month1:""
		}

	},
	methods: {



		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			
			location.href = "tbtasksendinfo_add.html?id="+id;
		},

        selectFile: function () {
            $("#dialogSelectUpload").modal('hide');
        },
        search: function (event) {
            var month = escape($("#month").val());
            var month1 = escape($("#month1").val());
            if(month!=null&&month1!=null&&month!=""&&month1!=""){

                    $("#jqGrid").jqGrid('setGridParam', {
                        url: "../tbtasksendinfo/list",
                        postData: {
                        	'month': month,
                            'month1': month1
						},
						//发送数据
                        page: 1
                    }).trigger("reloadGrid"); //重新载入
             }else{
            	alert("请选择起始时间");
			}

        },
        exportDatas: function (event) {
            var month = escape($("#month").val());
            var month1 = escape($("#month1").val());

            if(month==null||month==""){
                month=null;
            }
            if(month1==null||month1==""){
                month1=null;
            }

            if(month==null&&month1!=null){

                alert("请选择起始时间");
                reeturn;
            }

            if(month!=null&&month1==null){

                alert("请选择起始时间");
                reeturn;
            }

            $.ajax({
                type: "POST",
                // url: "../tbtasksendinfo/checkQx",
                url: "../tbtasksendinfo/checkQx",
                data: JSON.stringify("all"),
                success: function (r) {
                    if (r.code == 0) {
                        document.location.href = "../tbtasksendinfo/datasExport?month="+month+"&month1="+month1;
                        // vm.toexportDatas();
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        toexportDatas: function () {

            var month = escape($("#month").val());
            var month1 = escape($("#month1").val());
            alert(month)
            $.ajax({
                type: "POST",
                url: "../tbtasksendinfo/datasExport",
                dataType:"json",
                data: {
                    // 'month': month,
                    // 'month1': month1
                },
                success: function (r) {
                    if (r.code == 0) {
                        // document.location.href = "../tbtasksendinfo/datasExport";
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        // toexportDatas: function () {
        //     var month = escape($("#month").val());
        //     var month1 = escape($("#month1").val());
        //     $.get("../tbtasksendinfo/datasExport/" + month+month1, function (r) {
        //
        //     });
        // },
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax ({
					type: "POST",
				    url: "../tbtasksendinfo/delete",
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