/**
 * 文件管理js
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
		url: '../../sys/file/list?_' + $.now(),
		height: $(window).height()-54,
		queryParams: function(params){
			params.name = vm.keyword;
			return params;
		},
		showRefresh : true,
		columns: [
			{checkbox: true},
			{field : "docId", title : "对应文档id", width : "100px"}, 
			{field : "fileMd", title : "文件MD5值（做秒传）", width : "100px"}, 
			{field : "fileType", title : "文件类型", width : "100px"}, 
			{field : "fileShow", title : "文件展示名（原文件名）", width : "100px"}, 
			{field : "fileName", title : "文件上传后名称", width : "100px"}, 
			{field : "filePath", title : "文件上传路径", width : "100px"}, 
			{field : "fileSize", title : "文件大小(单位B)", width : "100px"}, 
			{field : "fileSizeFormat", title : "文件大小页面展示", width : "100px"}, 
			{field : "fileExt", title : "文件后缀名", width : "100px"}, 
			{field : "fileIp", title : "文件上传服务器ip", width : "100px"}, 
			{field : "fileAddress", title : "文件所在服务器磁盘位置", width : "100px"}, 
			{field : "remark", title : "描述", width : "100px"}, 
			{field : "userIdCreate", title : "创建人id", width : "100px"}, 
			{field : "gmtCreate", title : "创建时间", width : "100px"}, 
			{field : "gmtModified", title : "修改时间", width : "100px"}
		]
	})
}

var vm = new Vue({
	el : '#zhLTE',
	data : {
		keyword: null
	},
	methods : {
		load : function() {
			$('#dataGrid').bootstrapTable('refresh');
		},
		save : function() {
			dialogOpen({
				title : '新增文件管理',
				url : 'base/file/add.html?_' + $.now(),
				width : '420px',
				height : '350px',
				yes : function(iframeId) {
					top.frames[iframeId].vm.acceptClick();
				},
			});
		},
		edit : function() {
			var ck = $('#dataGrid').bootstrapTable('getSelections');
			if(checkedRow(ck)){
				dialogOpen({
					title : '编辑文件管理',
					url : 'base/file/edit.html?_' + $.now(),
					width : '420px',
					height : '350px',
					success : function(iframeId){
						top.frames[iframeId].vm.sysFile.fileId = ck[0].fileId;
						top.frames[iframeId].vm.setForm();
					},
					yes : function(iframeId){
						top.frames[iframeId].vm.acceptClick();
					}
				});
			}
		},
		remove : function() {
			var ck = $('#dataGrid').bootstrapTable('getSelections'), ids = [];	
			if(checkedArray(ck)){
				$.each(ck, function(idx, item){
					ids[idx] = item.fileId;
				});
				$.RemoveForm({
					url : '../../sys/file/remove?_' + $.now(),
			    	param : ids,
			    	success : function(data) {
			    		vm.load();
			    	}
				});
			}
		},
		upload : function() {
			dialogOpen({
				id : 'layerUpload',
				title : '上传文件列表',
				url : 'base/file/upload.html?_' + $.now(),
				width : '633px',
				height : '350px',
				maxmin: true, //开启最大化最小化按钮
				offset: 'rb', //右下角弹出
				scroll : true,//滚动条
				shade : false,//阴影
				shadeClose : true,//弹框后别处可以点击
				btn: false,
				cancel : function(iframeId){
					alert("haha ");
				}
			})
		},
		download : function() {
			alert("下载文件");
		}
	}
})