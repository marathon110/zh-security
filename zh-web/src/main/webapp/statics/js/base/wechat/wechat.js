/**
 * 我的公众号js
 */
var vm = new Vue({
	el : '#zhLTE',
	data : {
	    wechatConfig : {
            appId : '',
            appsecret : '',
            token : '',
            encodingAesKey : '',
            redirectUri : '',
        },
        error : false,
        errorMsg : '',
        alluser : 0,
        newuser : 0
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
                url: '../../wechat/config/save?_' + $.now(),
                param: vm.wechatConfig,
                success: function(data) {
                    getConfig();
                }
            });
		},
        getWechatConfig : function() {
            getConfig();
        },
        getWechatCount : function() {
            getCount();
        },
		clear : function() {

		}
	},
	created : function() {
        this.getWechatCount();
        this.getWechatConfig();
	}
})

function getConfig() {
    $.SetForm({
        url : '../../wechat/config/info?_' + $.now(),
        success : function(data) {
            if(isNotNullOrEmpty(data)
                && isNotNullOrEmpty(data.appId)
                && isNotNullOrEmpty(data.appsecret)
                && isNotNullOrEmpty(data.token)) {
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

function getCount() {
    $.SetForm({
        url : '../../wechat/user/count?_' + $.now(),
        success : function(data) {
            vm.alluser = data[0].alluser;
            vm.newuser = data[0].newuser;
        }
    });
}