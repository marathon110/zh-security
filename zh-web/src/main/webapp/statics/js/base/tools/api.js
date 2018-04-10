/**
 * 接口测试js
 */


var vm = new Vue({
	el : '#zhLTE',
	data : {
        urlPath : '',
		api : {
            method : 'GET',
            url : '',
            params : {
                zhaozhenghao : ''
            },
		},
        date : '',
        time : '',
	},
	methods : {
        request : function() {
            if(vm.urlPath == '') {
                dialogMsg('请输入请求路径', '7');
                return false;
            }
            if(vm.urlPath.indexOf('http://') == -1 && vm.urlPath.indexOf('https://') == -1) {
                dialogMsg('路径缺少http或https', '7');
                return false;
            }
            //每次请求都先初始化参数
            vm.api.params = {
                zhaozhenghao : ''
            };
            if(vm.urlPath.indexOf('?') > -1) {
                vm.api.params = urlToJson(vm.urlPath);
                vm.api.url = vm.urlPath.substring(0, vm.urlPath.indexOf('?'));
			} else {
                vm.api.url = vm.urlPath;
			}
			//去空格
            vm.api.url = vm.api.url.trimAll();
			//获取参数信息
            var param = {};
            var param_key = $("input[name='param_key']");
            var param_value = $("input[name='param_value']");
            if (param_key.length > 0) {
                for (var i = 0; i < param_key.length; i++) {
                    if (isNotNullOrEmpty(param_key[i].value)) {
                        param[param_key[i].value] = param_value[i].value;
                    }
                }
            }
            vm.api.params = $.extend({}, vm.api.params, param);

            $.SetForm({
                url: '../../sys/api/request?_' + $.now(),
                param: vm.api,
                success: function(data) {
                    vm.date = data.date;
                    vm.time = data.time;
                    if (isJSON(data.body)) {
                        $('#result').html(syntaxHighlight(JSON.parse(data.body)));
                    } else {
                        $('#result').text(data.body);
                    }

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


/**
 * Created by DreamBoy on 2016/6/4.
 */
/**
 * Created by DreamBoy on 2016/4/29.
 */
$(function() {
    $.fn.initInputGroup = function (options) {
        //1.Settings 初始化设置
        var c = $.extend({
            widget: 'input',
            add: "<span class=\"glyphicon glyphicon-plus\"></span>",
            del: "<span class=\"glyphicon glyphicon-minus\"></span>",
            field: '',
            data: []
        }, options);

        var _this = $(this);

        //添加序号为1的输入框组
        addInputGroup(1);

        /**
         * 添加序号为order的输入框组
         * @param order 输入框组的序号
         * @param data 初始化输入框组中的数据
         */
        function addInputGroup(order) {

            //1.创建输入框组
            var inputGroup = $("<div class='input-group' style='margin: 10px 0'></div>");
            //2.输入框组的序号
            var inputGroupAddon1 = $("<span class='input-group-addon'></span>");
            //3.设置输入框组的序号
            inputGroupAddon1.html(" " + order + " ");

            //4.创建输入框组中的输入控件（input或textarea）
            var widget = '', inputGroupAddon2;
            if(c.widget == 'textarea') {
                widget = $("<textarea class='form-control' style='resize: vertical;'></textarea>");
                widget.html(c.data[order - 1]);
                inputGroupAddon2 = $("<span class='input-group-addon'></span>");
            } else if(c.widget == 'input') {
                widget = $("<input class='form-control' type='text' style='width: 50%' placeholder='key' name='param_key'/>" +
					"<input class='form-control' type='text' style='width: 50%' placeholder='value' name='param_value'/>");
                widget.val(c.data[order - 1]);
                inputGroupAddon2 = $("<span class='input-group-btn'></span>");
            }

            //5.设置表单提交时的字段名
            if(c.field.length == 0) {
                widget.prop('name', c.widget + 'Data[]');
            } else {
                //widget.prop('name', c.field + '[]');
            }


            //6.创建输入框组中最后面的操作按钮
            var addBtn = $("<button class='btn btn-default' type='button'>" + c.add + "</button>");
            addBtn.appendTo(inputGroupAddon2).on('click', function() {
                //7.响应删除和添加操作按钮事件
                if($(this).html() == c.del) {
                    $(this).parents('.input-group').remove();
                } else if($(this).html() == c.add) {
                    $(this).html(c.del);
                    addInputGroup(order+1);
                }
                //8.重新排序输入框组的序号
                resort();
            });

            inputGroup.append(inputGroupAddon1).append(widget).append(inputGroupAddon2);

            _this.append(inputGroup);

            if(order + 1 > c.data.length) {
                return;
            }
            addBtn.trigger('click');
        }

        function resort() {
            var child = _this.children();
            $.each(child, function(i) {
                $(this).find(".input-group-addon").eq(0).html(' ' + (i + 1) + ' ');
            });
        }
    }
});

$(function() {
    $('.input-group-add').initInputGroup({
        'widget' : 'input', //输入框组中间的空间类型
        /*'add' : '添加',
        'del' : '删除'*/
        'field': 'data',
        'data' : []
    });
});

function syntaxHighlight(json) {
    if (typeof json != 'string') {
        json = JSON.stringify(json, undefined, 2);
    }
    json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function(match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}