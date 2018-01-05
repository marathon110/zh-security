/**
 * 新增-用户管理js
 */
var vm = new Vue({
	el : '#zhLTE',
	data : {
		roleList : {},
		user : {
			status : 1,
			roleIdList : []
		}
	},
	methods : {
		getRoleList : function() {
			$.get('../../sys/role/select?_' + $.now(), function(r) {
				vm.roleList = r.rows;
			});
		},
		acceptClick : function() {
			if(!$('#form').Validform()) {
				return false;
			}
			$.SaveForm({
				url : '../../sys/user/save?_' + $.now(),
				param : vm.user,
				success: function(data) {
		    		$.currentIframe().vm.load();//函数在common.js中配置,刷新当前iframe
		    	}
			});
		}
	},
	created : function() {
		this.getRoleList();
	}
})