/**
 * 代码生成器列表js
 */

$(function() {
	initialPage();
	getGrid();
});

function initialPage() {
	$(window).resize(function() {
		$('#dataGrid').bootstrapTable('resetView', {
			height : $(window).height() - 54
		});
	});
}

function getGrid() {
	$('#dataGrid').bootstrapTableEx({
		url : '../../sys/generator/list?_' + $.now(),
		height : $(window).height() - 54,
		queryParams : function(params) {
			params.name = vm.keyword;
			return params;
		},
		showRefresh : true,
		columns : [ {
			checkbox : true
		}, {
			field : "tableName",
			title : "表格名称"
		}, {
			field : "objName",
			title : "数据库引擎类型"
		}, {
			field : "tableComment",
			title : "备注"
		}, {
			field : "createTime",
			title : "创建时间"
		}]
	})
}

var vm = new Vue({
	el : '#zhLTE',
	data : {
		keyword : null
	},
	methods : {
		load : function() {
			$('#dataGrid').bootstrapTable('refresh');
		},
		generate : function() {
			
		}
	}
})