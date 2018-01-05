/**
 * 重置密码js
 */
var vm = new Vue({
		el:'#zhLTE',
		data: {
			user: {}
		},
		methods : {
			acceptClick: function() {
				if (!$('#form').Validform()) {
			        return false;
			    }
			    $.ConfirmForm({
			    	url: '../../sys/user/reset',
			    	param: vm.user,
			    	success: function(data) {
			    		
			    	}
			    });
			}
		}
	})