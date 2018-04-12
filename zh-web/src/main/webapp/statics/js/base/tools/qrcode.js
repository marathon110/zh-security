/**
 * 接口测试js
 */


var vm = new Vue({
	el : '#zhLTE',
	data : {
        qrcode : {
            content : '',
            height : 380,
            width : 380,
            format : 'png'
        },
        img : '',
	},
	methods : {
        request : function() {
            if(vm.qrcode.content == '') {
                dialogMsg('请输入请求内容', '7');
                return false;
            }
            if(vm.qrcode.content.length > '500') {
                dialogMsg('请求内容太长', '7');
                return false;
            }
            if(vm.qrcode.height <= 0) {
                dialogMsg('宽高必须大于0', '7');
                return false;
            }
            vm.qrcode.width = vm.qrcode.height;
            vm.img = '<img src="../../sys/qrcode/create?content=' + vm.qrcode.content
            + '&height='+ vm.qrcode.height
            + '&width='+ vm.qrcode.width
            + '&format='+ vm.qrcode.format
            +'" class="img-responsive" alt="qrcode image"></img>';
		},
        formatSelect : function(format) {
			if(format == 'png') {
                vm.qrcode.format = 'png';
			}else if(format == 'jpg'){
                vm.qrcode.format = 'jpg';
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
