/**
 * upload文件上传js
 */

(function( $ ){
	// 当domReady的时候开始初始化
	$(function() {
		/*init webuploader*/
		var $list = $("#thelist"), 
		$btn =$("#ctlBtn");   //开始上传
		var $test =$("#ctlBtn2");   //测试按钮
		var n = 0;//记次数用
		var startTime;
		
		var uploader = WebUploader.create({

		    // swf文件路径
		    swf: '../../../plugins/webuploader/Uploader.swf',

		    // 文件接收服务端。
		    server: '../../sys/file/upload',

		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#picker',
		    
		    //分片
            //chunked: true,
            //每片大小 2M
            //chunkSize: 2 * 1024 * 1024,
            //单片失败后重试次数
            //chunkRetry: 5,
            //上传并发线程数
            threads: 3,
		    
		    fileSingleSizeLimit: 4 * 1024 * 1024 * 1024,   //设定单个文件大小
		    fileSizeLimit: 5 * 1024 * 1024 * 1024,
            fileNumLimit: 5,

		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false,
		    
		 // 禁掉全局的拖拽功能。  
            disableGlobalDnd: true 
		});

		
		//当有文件被添加进队列的时候
		uploader.on( 'fileQueued', function( file ) {
		    $list.append( '<div id="' + file.id + '" class="uploader-list-info">' +
		    	'<div class="file-process" style="width: 0%;"></div>' +
		        '<div class="file-name">' + file.name + '</div>' +
		        '<div class="file-size"><span id="all' + file.id + '"></span></div>' +
		        '<div class="file-status">等待上传...</div>' +
		        '<div class="file-operate"><a href="#" onclick=operateUpload("' + file.id + '") class="operate" id="operate' + file.id + '"><i class="fa fa-play"></i></a>' +
		        '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick=removeUpload("' + file.id + '")><i class="fa fa-remove"></i></a></div>' +
		    '</div>' );
		    
		  //上传期间所上传占总的比例
		    var fileSize = uploader.getFiles()[uploader.getFiles().length - 1].size;//总大小
            $("#all" + file.id).html(fileSizeFun(fileSize));//总大小
		});

		//文件上传过程中创建进度条实时显示。
		uploader.on( 'uploadProgress', function( file, percentage ) {
		    var $li = $( '#'+file.id ),
		    $process = $li.find('.file-process');
		    $process.css( 'width', percentage * 100 + '%' );
		    $process.css( 'background-color', '#e2eeff' );
            //经测试，这个方法几乎为0.1s执行一次
            $li.find('.file-status').text((percentage*100).toFixed(2) + "%");//已上传比例
		});


		uploader.on( 'uploadStart', function( file ) {
			$( '#'+file.id ).find('.file-operate').find('.operate').html('<i class="fa fa-pause"></i>');//正在上传图标
		});
		
		
		uploader.on( 'stopUpload', function( file ) {
		    console.log(file.id)
		});
		
		uploader.on( 'uploadSuccess', function( file ) {
		    $( '#'+file.id ).find('.file-status').text('已上传');
		    $( '#'+file.id ).find('.file-operate').html('<i class="fa fa-check-circle"></i>');
		});

		//文件成功、失败处理
		uploader.on( 'uploadError', function( file ) {
		    $( '#'+file.id ).find('.file-status').text('上传出错');
		    $( '#'+file.id ).find('.file-operate').find('.operate').html('<i class="fa fa-refresh"></i>');
		});

		uploader.on( 'uploadComplete', function( file ) {
		});

		$btn.on('click', function () {
		    if ($(this).hasClass('disabled')) {
		    	console.log(2);
		        return false;
		    }
		    uploader.upload();
		});
		
		removeUpload = function (fileId){  
			var file = uploader.getFile(fileId);
			$("#"+fileId).remove();//删除页面上传信息元素
			uploader.cancelFile( file )
		    uploader.removeFile(file, true); 
	    }  
		
		operateUpload = function (fileId){
			var operate_id = "operate" + fileId;
			var file = uploader.getFile(fileId);
        	if($('#'+operate_id).children().hasClass('fa fa-pause')) {//则为正在上传，可点击暂停
        		uploader.stop(file);
        		uploader.upload();
        		$('#'+operate_id).html('<i class="fa fa-play"></i>');//暂停后
        	} else if($('#'+operate_id).children().hasClass('fa fa-play')) {//否则为正在暂停，可点击继续上传
        		uploader.upload(file);
        		$('#'+operate_id).html('<i class="fa fa-pause"></i>');//上传后
        	} else if($('#'+operate_id).children().hasClass('fa fa-refresh')) {//若上传出错，则重新上传
        		uploader.retry(file);
        		$('#'+operate_id).html('<i class="fa fa-pause"></i>');//上传后
        	}
		}
	});
})( jQuery );




function fileSizeFun(fileSize) {
	var nowSize = 0;//已上传大小
    var gb = Math.pow(1024, 3);
    var mb = Math.pow(1024, 2);
    var kb = 1024;
    
    if (fileSize >= gb) {
        var fz = (fileSize / gb).toFixed(2);
        Size = fz + "GB";
    }
    else if (fileSize >= mb) {
        var fz = (fileSize / mb).toFixed(2);
        Size = fz + "MB";
    }
    else if (fileSize >= kb) {
        var fz = (fileSize / kb).toFixed(2);
        Size = fz + "KB";
    }
    else {
        var fz = fileSize;
        Size = fz + "B";
    }
    return Size;
}