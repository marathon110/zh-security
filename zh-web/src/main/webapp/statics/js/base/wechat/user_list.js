/**
 * 微信授权页用户表js
 */
 
$(function () {
	initialPage();
	getGrid();
});

function initialPage() {
	$(window).resize(function() {
		$('#dataGrid').bootstrapTable('resetView', {height: $(window).height()-54});
	});
}

function getGrid() {
	$('#dataGrid').bootstrapTableEx({
		url: '../../wechat/user/list?_' + $.now(),
		height: $(window).height()-54,
		queryParams: function(params){
			params.name = vm.keyword;
            params.startDate = vm.startDate;
            params.endDate = vm.endDate;
			return params;
		},
		showRefresh : true,
		columns: [
			{checkbox: true},
            {field : "nickname", title : "昵称", width : "100px"},
            {field : "realname", title : "真实姓名", width : "100px"},
            {field : "mobile", title : "手机号", width : "100px"},
            {
            	field : "sex",
				title : "性别",
				width : "40px",
				formatter : function(value, row, index) {
                    if (value == '1') {
                        return '<span class="label label-primary">男</span>';
                    } else if (value == '2') {
                        return '<span class="label label-success">女</span>';
                    } else {
                        return '<span class="label label-danger">未知</span>';
                    }
                }
			},
            {field : "city", title : "城市", width : "50px"},
			{field : "country", title : "国家", width : "50px"},
			{field : "province", title : "省份", width : "50px"},
			{field : "gmtCreate", title : "创建时间", width : "100px"}, 
			{field : "gmtModified", title : "修改时间", width : "100px"}
		]
	})
}

var vm = new Vue({
	el : '#zhLTE',
	data : {
		keyword: null,
        startDate : null,
        endDate : null,
        dateRangeText : '时间范围',
        dateRange : null
	},
	methods : {
		load : function() {
			$('#dataGrid').bootstrapTable('refresh');
		},
        dateRangeSelect : function(count) {
            if(count == 1) {
                vm.dateRangeText = '最近一天';
                vm.startDate = countDay(-1);
                vm.endDate = today();
                vm.dateRange = vm.startDate + ' - ' + vm.endDate;
            }else if(count == 7){
                vm.dateRangeText = '最近一周';
                vm.startDate = countDay(-7);
                vm.endDate = today();
                vm.dateRange = vm.startDate + ' - ' + vm.endDate;
            }else if(count == 30){
                vm.dateRangeText = '最近一月';
                vm.startDate = countDay(-30);
                vm.endDate = today();
                vm.dateRange = vm.startDate + ' - ' + vm.endDate;
            }else{
                vm.dateRangeText = '时间范围';
                vm.startDate = '';
                vm.endDate = '';
                vm.dateRange = '';
            }
        }
	},
    mounted : function() {
		var time = url('time');//新增用户才有的参数
		if(isNotNullOrEmpty(time)) {
            this.dateRangeText = '最近一天';
            this.startDate = countDay(-1);
            this.endDate = today();
            this.dateRange = this.startDate + ' - ' + this.endDate;
		}
        //日期选择
        laydate.render({
            elem: '#dateRange',
            range: true,
            theme: '#3C8DBC',
            done: function(value, date, endDate){
                vm.dateRangeSelect(0);
                vm.dateRange = value;
                //vm.startDate = date.year + '-' + date.month + '-' + date.date;
                //vm.endDate = endDate.year + '-' + endDate.month + '-' + endDate.date;
                vm.startDate = formatDayForZero(date);
                vm.endDate = formatDayForZero(endDate);
            }
        });
    }
})