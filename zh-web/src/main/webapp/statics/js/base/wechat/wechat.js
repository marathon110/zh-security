/**
 * 我的公众号js
 */
var vm = new Vue({
	el : '#zhLTE',
	data : {
	    wechatConfig : {
            appId : '',
            appsecret : '',
        },
        error : false,
        errorMsg : '',
	},
	methods : {
        wechatInfoEdit : function() {
            $('#wechat_info').css('display', 'none');
            $('#wechat_info_edit').css('display', 'block');
		},
        wechatInfoSubmit : function() {
            if(!$('#wechat_info_edit').Validform()) {
                return false;
            }
            $.SetForm({
                url: '../../wechat/config/saveOrUpdate?_' + $.now(),
                param: vm.wechatConfig,
                success: function(data) {
                    getConfig();
                }
            });
		},
        getWechatConfig : function() {
            getConfig();
		},
		clear : function() {

		}
	},
	created : function() {
        this.getWechatConfig();
	}
})

function getConfig() {
    $.SetForm({
        url : '../../wechat/config/getConfig?_' + $.now(),
        success : function(data) {
            if(isNotNullOrEmpty(data) && isNotNullOrEmpty(data.appId) && isNotNullOrEmpty(data.appsecret)) {
                vm.wechatConfig = data;
                vm.error = false;
                vm.errorMsg = '';
                $('#wechat_info').css('display', 'block');
                $('#wechat_info_edit').css('display', 'none');
            } else {
                vm.wechatConfig = data;
                vm.error = true;
                vm.errorMsg = '请输入微信基本配置信息';
            }
        }
    });
}