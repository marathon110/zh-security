/**
 * 编辑-菜单管理js
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
		setForm : function() {
			$.SetForm({
				url: '../../wechat/menu/info?_' + $.now(),
		    	param: vm.menu.id,
		    	success: function(data) {
		    		vm.menu = data;
		    	}
			});
		},
		acceptClick: function() {
			if (!$('#form').Validform()) {
		        return false;
		    }
		    $.ConfirmForm({
		    	url: '../../wechat/menu/update?_' + $.now(),
		    	param: vm.menu,
		    	success: function(data) {
		    		$.currentIframe().vm.load();
		    	}
		    });
		}
	}
})