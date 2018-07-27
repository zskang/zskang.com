var url_;
$(function() {
	$("#gridTable")
		.jqGrid({
			url: url_,
			datatype: "json",
			colModel: [{
				label: '用户ID',
				name: 'userId',
				width: 45,
				key: true
			}, {
				label: '用户名',
				name: 'username',
				width: 75
			}, {
				label: '邮箱',
				name: 'email',
				width: 90
			}, {
				label: '手机号',
				name: 'mobile',
				width: 100
			}, {
				label: '状态',
				name: 'status',
				width: 80,
				formatter: function(value, options, row) {
					return value === 0 ?
						'<span class="label label-danger">禁用</span>' :
						'<span class="label label-success">正常</span>';
				}
			}, {
				label: '创建时间',
				name: 'createTime',
				width: 80
			}],
			viewrecords: true,
			height: 400,
			rowNum: 10,
			rowList: [10, 30, 50],
			rownumbers: true,
			rownumWidth: 25,
			autowidth: true,
			multiselect: true,
			pager: "#jqGridPager",
			jsonReader: {
				root: "page.list",
				page: "page.currPage",
				total: "page.totalPage",
				records: "page.totalCount"
			},
			prmNames: {
				page: "page",
				rows: "limit",
				order: "order"
			},
			gridComplete: function() {
				// 隐藏grid底部滚动条
				$("#jqGrid").closest(".ui-jqgrid-bdiv").css({
					"overflow-x": "hidden"
				});
			}
		});
});


		var zNodes =[
			{ id:1, pId:0, name:"父节点 1", open:true},
			{ id:11, pId:1, name:"叶子节点 1-1"},
			{ id:12, pId:1, name:"叶子节点 1-2"},
			{ id:13, pId:1, name:"叶子节点 1-3"},
			{ id:2, pId:0, name:"父节点 2", open:true},
			{ id:21, pId:2, name:"叶子节点 2-1"},
			{ id:22, pId:2, name:"叶子节点 2-2"},
			{ id:23, pId:2, name:"叶子节点 2-3"},
			{ id:3, pId:0, name:"父节点 3", open:true},
			{ id:31, pId:3, name:"叶子节点 3-1"},
			{ id:32, pId:3, name:"叶子节点 3-2"},
			{ id:33, pId:3, name:"叶子节点 3-3"}
		];
		
var zTreeObj;
var setting = {
	view: {
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false
	},
	edit: {
		enable: true,
		editNameSelectAll: true,
		showRemoveBtn: showRemoveBtn,
		showRenameBtn: showRenameBtn
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeEditName: beforeEditName,
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRemove: onRemove,
		onRename: onRename
	}
};

var log, className = "dark";

function beforeDrag(treeId, treeNodes) {
	return false;
}

function beforeEditName(treeId, treeNode) {
	alert(className);
	className = (className === "dark" ? "" : "dark");
	showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("orgTree");
	zTree.selectNode(treeNode);
	setTimeout(function() {
		if(confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？")) {
			setTimeout(function() {
				zTree.editName(treeNode);
			}, 0);
		}
	}, 0);
	return false;
}

function beforeRemove(treeId, treeNode) {
	alert(className);
	className = (className === "dark" ? "" : "dark");
	showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("orgTree");
	zTree.selectNode(treeNode);
	return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
}

function onRemove(e, treeId, treeNode) {
	showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}

function beforeRename(treeId, treeNode, newName, isCancel) {
	className = (className === "dark" ? "" : "dark");
	showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
	if(newName.length == 0) {
		setTimeout(function() {
			var zTree = $.fn.zTree.getZTreeObj("orgTree");
			zTree.cancelEditName();
			alert("节点名称不能为空.");
		}, 0);
		return false;
	}
	return true;
}

function onRename(e, treeId, treeNode, isCancel) {
	showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
}

function showRemoveBtn(treeId, treeNode) {
	return !treeNode.isFirstNode;
}

function showRenameBtn(treeId, treeNode) {
	return !treeNode.isLastNode;
}

function showLog(str) {
	if(!log) log = $("#log");
	log.append("<li class='" + className + "'>" + str + "</li>");
	if(log.children("li").length > 8) {
		log.get(0).removeChild(log.children("li")[0]);
	}
}

function getTime() {
	var now = new Date(),
		h = now.getHours(),
		m = now.getMinutes(),
		s = now.getSeconds(),
		ms = now.getMilliseconds();
	return(h + ":" + m + ":" + s + " " + ms);
}

var newCount = 1;

function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if(treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId +
		"' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_" + treeNode.tId);
	if(btn) btn.bind("click", function() {
		var zTree = $.fn.zTree.getZTreeObj("orgTree");
		zTree.addNodes(treeNode, {
			id: (100 + newCount),
			pId: treeNode.id,
			name: "new node" + (newCount++)
		});
		return false;
	});
};

function removeHoverDom(treeId, treeNode) {
	$("#addBtn_" + treeNode.tId).unbind().remove();
};

function selectAll() {
	var zTree = $.fn.zTree.getZTreeObj("orgTree");
	zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
}
var vm = new Vue({
	el: '#rrapp',
	data: {
		orgs: {
			parentName: "",
			parentId: 0,
			type: 1,
			orderNum: 0
		}
	},
	created: function() {
		$.get("../sys/org/select", function(r) {
			zTreeObj = $.fn.zTree.init($("#orgTree"), setting, zNodes);
			$("#selectAll").bind("click", selectAll);
			//	var node = zTreeObj.getNodeByParam("menuId", vm.orgs.parentId);
			//	zTreeObj.selectNode(node); 
			//	vm.menu.parentName = node.name;
		})

	},

	methods: {
		delOrg: function(event) {

		},
		updateOrg: function(event) {

		},
		//从人员列表中选人员 加入到机构中 
		pushIn: function(event) {
			layer.open({
				type: 1,
				offset: '50px',
				skin: 'layui-layer-molv',
				title: "选择菜单",
				area: ['300px', '450px'],
				shade: 0,
				shadeClose: false,
				content: jQuery("#userLayer"),
				btn: ['确定', '取消'],
				btn1: function(index) {
					var node = ztree.getSelectedNodes();
					//选择上级菜单
					vm.menu.parentId = node[0].menuId;
					vm.menu.parentName = node[0].name;

					layer.close(index);
				}
			});
		},
		//从当前的机构中除去不需要的人员
		pullOut: function(event) {

		},

	}
});