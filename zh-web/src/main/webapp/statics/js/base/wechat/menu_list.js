/**
 * 菜单管理js
 */

$(function () {
	initialPage();
	getGrid();
});

function initialPage() {
	$(window).resize(function() {
		Menu.table.resetHeight({height: $(window).height()-100});
	});
}

function getGrid() {
	var colunms = Menu.initColumn();
    var table = new TreeTable(Menu.id, '../../wechat/menu/list?_' + $.now(), colunms);
    table.setExpandColumn(2);
    table.setIdField("id");
    table.setCodeField("id");
    table.setParentCodeField("parentId");
    table.setExpandAll(false);
    table.setHeight($(window).height()-100);
    table.init();
    Menu.table = table;
}

var Menu = {
    id: "dataGrid",
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Menu.initColumn = function () {
    var columns = [
        {field: 'selectItem', radio: true},
        {title: '编号', field: 'id', visible: false, align: 'center', valign: 'middle', width: '50px'},
        {title: '名称', field: 'name', align: 'center', valign: 'middle', width: '180px'},
        {title: '上级菜单', field: 'parentName', align: 'center', valign: 'middle', width: '100px'},
        {title: '级别', field: 'buttonType', align: 'center', valign: 'middle', width: '60px', formatter: function(item, index){
                if(item.buttonType === 1){
                    return '<span class="label label-primary">一级</span>';
                }
                if(item.buttonType === 2){
                    return '<span class="label label-success">二级</span>';
                }
            }},
        {title: '排序', field: 'orderNum', align: 'center', valign: 'middle', width: '50px'},
        {title: '类型', field: 'type', align: 'center', valign: 'middle', width: '150px'},
        {title: '菜单KEY值', field: 'key', align: 'center', valign: 'middle', width: '150px'},
        {title: '菜单URL', field: 'url', align: 'center', valign: 'middle'}]
    return columns;
};

var vm = new Vue({
	el : '#zhLTE',
	methods : {
		load: function() {
			Menu.table.refresh();
		},
		save : function() {
			dialogOpen({
				title : '新增菜单',
				url : 'base/wechat/menu_add.html?_' + $.now(),
				width : '600px',
				height : '560px',
				scroll : true,
				yes : function(iframeId) {
					top.frames[iframeId].vm.acceptClick();
				},
			});
		},
		edit : function() {
			var ck = Menu.table.getSelectedRow();
			if(checkedRow(ck)) {
				dialogOpen({
					title : '编辑菜单',
					url : 'base/wechat/menu_edit.html?_' + $.now(),
					width : '600px',
					height : '560px',
					scroll : true,
					success : function(iframeId){
						top.frames[iframeId].vm.menu.id = ck[0].id;
						top.frames[iframeId].vm.setForm();
					},
					yes : function(iframeId) {
						top.frames[iframeId].vm.acceptClick();
					},
				});
			}
		},
		remove : function() {
			var ck = Menu.table.getSelectedRow(), ids = [];
			if(checkedArray(ck)) {
				$.each(ck, function(idx, item){
					ids[idx] = item.id;
				});
				$.RemoveForm({
					url: '../../wechat/menu/remove?_' + $.now(),
			    	param: ids,
			    	success: function(data) {
			    		vm.load();
			    	}
				});
			}
		},
	}
})