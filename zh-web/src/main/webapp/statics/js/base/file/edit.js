/**
 * 编辑-文件管理js
 */
var vm = new Vue({
	el : '#zhLTE',
	data : {
		sysFile : {
			fileId : 0
		}
	},
	methods : {
		setForm: function() {
			$.SetForm({
				url: '../../sys/file/info?_' + $.now(),
		    	param: vm.sysFile.fileId,
		    	success: function(data) {
		    		vm.sysFile = data;
		    	}
			});
		},
		acceptClick: function() {
			if (!$('#form').Validform()) {
		        return false;
		    }
		    $.ConfirmForm({
		    	url: '../../sys/file/update?_' + $.now(),
		    	param: vm.sysFile,
		    	success: function(data) {
		    		$.currentIframe().vm.load();
		    	}
		    });
		}
	}
})