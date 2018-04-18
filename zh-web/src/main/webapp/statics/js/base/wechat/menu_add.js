/**
 * 新增-微信菜单js
 */

var vm = new Vue({
	el : '#zhLTE',
	data: {
		menu:{
			parentName : null,
			parentId : 0,
			type : '',
			name : '',
            key : '',
            url : '',
            appid : '',
            pagepath : '',
            buttonType : 1,
			orderNum:0
		}
	},
	methods : {
		menuTree : function() {
			dialogOpen({
				id : 'layerMenuTree',
				title : '选择菜单',
		        url : 'base/wechat/menu_tree.html?_' + $.now(),
		        scroll : true,
		        width : "300px",
		        height : "450px",
		        yes : function(iframeId) {
		        	top.frames[iframeId].vm.acceptClick();
				}
		    })
		},
		acceptClick : function() {
			if (!$('#form').Validform()) {
		        return false;
		    }
			$.SaveForm({
				url: '../../wechat/menu/save?_' + $.now(),
		    	param: vm.menu,
		    	success: function(data) {
		    		$.currentIframe().vm.load();
		    	}
			});
		},
	}
})