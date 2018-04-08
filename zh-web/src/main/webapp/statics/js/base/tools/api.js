/**
 * 接口测试js
 */


var vm = new Vue({
	el : '#zhLTE',
	data : {
		api : {
            method : 'GET',
            url : '',
            params : {},
		}
	},
	methods : {
        request : function() {
            $.SetForm({
                url: '../../sys/api/request?_' + $.now(),
                param: vm.api,
                success: function(data) {
                    console.log(data);
                }
            });
		},
        methodSelect : function(method) {
			if(method == 'GET') {
                vm.api.method = 'GET';
			}else if(method == 'POST'){
                vm.api.method = 'POST';
            }
		},
		remove : function() {
		},
		clear : function() {
		}
	},
	created : function() {

	}
})