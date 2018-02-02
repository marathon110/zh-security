/**
 * upload文件上传js
 */

(function( $ ){
	// 当domReady的时候开始初始化
	$(function() {
		/*init webuploader*/
		var $list = $("#thelist"), 
		$btn =$("#ctlBtn");   //开始上传
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
		    
		    fileSingleSizeLimit: 4 * 1024 * 1024 * 1024,   //设定单个文件大小
		    fileSizeLimit: 5 * 1024 * 1024 * 1024,
            fileNumLimit: 5,

		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false
		});

		
		//当有文件被添加进队列的时候
		uploader.on( 'fileQueued', function( file ) {
		    $list.append( '<div id="' + file.id + '" class="uploader-list-info">' +
		        '<div class="file-name">' + file.name + '</div>' +
		        '<div class="file-size"><span id="all' + file.id + '"></span></div>' +
		        '<div class="file-status">等待上传...</div>' +
		        '<div class="file-operate"><a href="#" onclick=operateUpload("' + file.id + '") class="operate" id="operate' + file.id + '"><i class="fa fa-play"></i></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick=removeUpload("' + file.id + '")><i class="fa fa-remove"></i></a></div>' +
		    '</div>' );
		    
		  //上传期间所上传占总的比例
		    var fileSize = uploader.getFiles()[uploader.getFiles().length - 1].size;//总大小
            $("#all" + file.id).html(fileSizeFun(fileSize));//总大小
		});

		//文件上传过程中创建进度条实时显示。
		uploader.on( 'uploadProgress', function( file, percentage ) {
		    var $li = $( '#'+file.id ),
		        $percent = $li.find('.progress .progress-bar');

		    // 避免重复创建
		    if ( !$percent.length ) {
		        $percent = $('<div class="progress progress-striped active">' +
		          '<div class="progress-bar" role="progressbar" style="width: 0%;">' +
		          '</div>' +
		        '</div>').appendTo( $li ).find('.progress-bar');
		    }

		    $percent.css( 'width', percentage * 100 + '%' );
		    
		    //上传期间所上传占总的比例
            var nowSize = 0;//已上传大小
            var gb = Math.pow(1024, 3);
            var mb = Math.pow(1024, 2);
            var kb = 1024;
            var fileSize = uploader.getFiles()[uploader.getFiles().length - 1].size;//总大小
            if (fileSize >= gb) {
                var fz = (fileSize / gb).toFixed(2);
                Size = fz + "GB";
                nowSize = (fz * percentage).toFixed(2) + "GB";
            }
            else if (fileSize >= mb) {
                var fz = (fileSize / mb).toFixed(2);
                Size = fz + "MB";
                nowSize = (fz * percentage).toFixed(2) + "MB";
            }
            else if (fileSize >= kb) {
                var fz = (fileSize / kb).toFixed(2);
                Size = fz + "KB";
                nowSize = (fz * percentage).toFixed(2) + "KB";
            }
            else {
                var fz = fileSize;
                Size = fz + "B";
                nowSize = fz * percentage + "B";
            }
            //经测试，这个方法几乎为0.1s执行一次，则计算当前上传速度为nowSize*10/s
            $li.find('.file-status').text((percentage*100).toFixed(2) + "%");//已上传比例
            
            $("#all" + file.id).html(Size);//总大小
            
		});


		uploader.on( 'uploadStart', function( file ) {
			$( '#'+file.id ).find('.file-operate').find('.operate').html('<i class="fa fa-pause"></i>');//正在上传图标
		});
		
		
		uploader.on( 'stopUpload', function( file ) {
		    
		});
		
		uploader.on( 'uploadSuccess', function( file ) {
		    $( '#'+file.id ).find('.file-status').text('已上传');
		    $( '#'+file.id ).find('.file-operate').html('<i class="fa fa-check-circle"></i>');
		});

		//文件成功、失败处理
		uploader.on( 'uploadError', function( file ) {
		    $( '#'+file.id ).find('.file-status').text('上传出错');
		});

		uploader.on( 'uploadComplete', function( file ) {
		    $( '#'+file.id ).find('.progress').fadeOut();
		});

		$btn.on('click', function () {
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		    uploader.upload();
		});
		
		removeUpload = function (fileId){  
			var file = uploader.getFile(fileId);
		    uploader.removeFile(file); 
	    }  
		
		operateUpload = function (fileId){
			var operate_id = "operate" + fileId;
			var file = uploader.getFile(fileId);
        	if($('#'+operate_id).children().hasClass('fa fa-pause')) {//则为正在上传，可点击暂停
        		uploader.stop(file);
        		$('#'+operate_id).html('<i class="fa fa-play"></i>');//暂停后
        	} else {//否则为正在暂停，可点击继续上传
        		uploader.upload(file);
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