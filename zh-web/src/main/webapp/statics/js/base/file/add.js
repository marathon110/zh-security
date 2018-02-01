/**
 * 新增-文件管理js
 */
var vm = new Vue({
	el : '#zhLTE',
	data : {
		sysFile : {
			fileId : 0
		}
	},
	methods : {
		acceptClick: function() {
			if (!$('#form').Validform()) {
		        return false;
		    }
		    $.SaveForm({
		    	url: '../../sys/file/save?_' + $.now(),
		    	param: vm.sysFile,
		    	success: function(data) {
		    		$.currentIframe().vm.load();
		    	}
		    });
		}
	}
})