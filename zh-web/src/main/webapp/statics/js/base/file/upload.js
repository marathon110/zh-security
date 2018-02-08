/**
 * upload文件上传js
 */

(function( $ ){
	// 当domReady的时候开始初始化
	$(function() {
		/*init webuploader*/
		var $list = $("#thelist"), 
		$btn =$("#ctlBtn"),   //开始上传
		$retryBtn =$("#retryBtn"),   //继续上传
		$stopBtn =$("#stopBtn");   //暂停上传
		var fileMd5;  //文件唯一标识 
		
		/******************下面的参数是自定义的*************************/  
	    var fileName;//文件名称  
	    var oldJindu;//如果该文件之前上传过 已经上传的进度是多少  
	    var count=0;//当前正在上传的文件在数组中的下标，一次上传多个文件时使用  
	    var filesArr=new Array();//文件数组：每当有文件被添加进队列的时候 就push到数组中  
	    var map={};//key存储文件id，value存储该文件上传过的进度  
	    var mapMd5={};//key存储文件id，value存储该文件md5值
	    var mapFileName={};//key存储文件id，value存储该文件名称 
		
		
		/********************** 监听分块上传过程中的三个时间点 start ******************************/  
		WebUploader.Uploader.register({
			'before-send-file' : 'beforeSendFile',//整个文件上传前
			'before-send' : 'beforeSend',//每个分片上传前 
			'after-send-file' : 'afterSendFile',//分片上传完毕
		},{
			//时间点1：所有分块进行上传之前调用此函数 
			beforeSendFile : function(file) {
				fileMd5 = mapMd5[file.id];
				fileName = mapFileName[file.id];
				var deferred = WebUploader.Deferred();
				deferred.resolve();
			},
			//时间点2：如果有分块上传，则每个分块上传之前调用此函数  
			beforeSend : function(block) {
				var deferred = WebUploader.Deferred();
				$.ajax({
					type : "POST",
					url : "../../sys/file/checkChunk",//ajax验证每一个分片 
					data : {
						fileName : fileName,
						progress : $("#progress").val(),
						fileMd5 : fileMd5, //文件唯一标记 
						chunk : block.chunk,  //当前分块下标
						chunkSize : block.end-block.start//当前分块大小
					},
					cache: false,  
	                async: false,  // 与js同步  
	                timeout: 1000, //todo 超时的话，只能认为该分片未上传过  
	                dataType:"json", 
	                success:function(response){    
	                    if(response.ifExist == 1){  
	                        //分块存在，跳过    
	                        deferred.reject();    
	                    }else{    
	                        //分块不存在或不完整，重新发送该分块内容    
	                        deferred.resolve();    
	                    }    
	                }
				});
				this.owner.options.formData.fileMd5 = fileMd5;    
	            deferred.resolve();    
	            return deferred.promise(); 
			},
			//时间点3：所有分块上传成功后调用此函数
			afterSendFile : function(file) {
				//如果分块上传成功，则通知后台合并分块 
				$.ajax({
					type : "POST",
					url : "../../sys/file/mergeChunks",//ajax将所有片段合并成整体 
					data : {
						fileName : file.name,  
					},
	                success:function(response){   
	                	count++; //每上传完成一个文件 count+1 
	                    if(count <= filesArr.length - 1){  
	                    	uploader.upload(filesArr[count].id);//上传文件列表中的下一个文 
	                    }   
	                }
				});
			}
		});
		/********************** 监听分块上传过程中的三个时间点 end ********************************/  
		
		
		/************************* 初始化WebUploader start ********************************/
		var uploader = WebUploader.create({
			auto:false,//选择文件后是否自动上传  
		    // swf文件路径
		    swf: '../../../plugins/webuploader/Uploader.swf',

		    // 文件接收服务端。
		    server: '../../sys/file/upload',

		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#picker',
		    
		    //分片
            chunked: true,
            //每片大小 2M
            chunkSize: 5 * 1024 * 1024,
            //单片失败后重试次数
            chunkRetry: 3,
            //上传并发线程数
            threads: 3,
            prepareNextFile: true,//上传当前分片时预处理下一分片
            duplicate : false,//是否重复上传（同时选择多个一样的文件），true可以重复上传  
		    
		    fileSingleSizeLimit: 4 * 1024 * 1024 * 1024,   //设定单个文件大小
		    fileSizeLimit: 5 * 1024 * 1024 * 1024,
            fileNumLimit: 5,

		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false,
		    
		 // 禁掉全局的拖拽功能。  
            disableGlobalDnd: true 
		});
		/************************* 初始化WebUploader end ********************************/
		
		//当有文件被添加进队列的时候
		uploader.on( 'fileQueued', function( file ) {
			//限制单个文件的大小 超出了提示  
	        if(file.size > 4 * 1024 * 1024 * 1024){ 
	        	dialogMsg("单个文件大小不能超过4G", "info");
	            return false;  
	        } 
	        
	        //将选择的文件添加进文件数组  
	        filesArr.push(file);
	        
	        mapFileName[file.id] = file.name;
	        
	        $.ajax({
	        	type : "POST",
	        	url : "../../sys/file/progress",
	        	data : {    
	                fileName : file.name  //文件名  
	            },
	            cache : false,  
	            async : false,  // 同步  
	            dataType :"json",
	            success : function(data){
	            	if(data > 0) {//说明之前上传过
	            		oldJindu= data / 100;
	            		var jindutiaoStyle = "width:" + data + "%;";
	            		$list.append( '<div id="' + file.id + '" class="uploader-list-info">' +
	            		    	'<div class="file-process" style="' + jindutiaoStyle + '"></div>' +
	            		        '<div class="file-name">' + file.name + '</div>' +
	            		        '<div class="file-size"><span id="all' + file.id + '"></span></div>' +
	            		        '<div class="file-status">' + data + '%</div>' +
	            		        '<div class="file-operate"><a href="#" onclick=operateUpload("' + file.id + '") class="operate" id="operate' + file.id + '"><i class="fa fa-play"></i></a>' +
	            		        '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick=removeUpload("' + file.id + '")><i class="fa fa-remove"></i></a></div>' +
	            		    '</div>' );
	            		//将上传过的进度存入map集合  
	                    map[file.id]=oldJindu; 
	            	} else {//没有上传过
	            		$list.append( '<div id="' + file.id + '" class="uploader-list-info">' +
	            		    	'<div class="file-process" style="width: 0%;"></div>' +
	            		        '<div class="file-name">' + file.name + '</div>' +
	            		        '<div class="file-size"><span id="all' + file.id + '"></span></div>' +
	            		        '<div class="file-status">等待上传...</div>' +
	            		        '<div class="file-operate"><a href="#" onclick=operateUpload("' + file.id + '") class="operate" id="operate' + file.id + '"><i class="fa fa-play"></i></a>' +
	            		        '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick=removeUpload("' + file.id + '")><i class="fa fa-remove"></i></a></div>' +
	            		    '</div>' );
	            	}
	            	
	            	(new WebUploader.Uploader()).md5File(file, 0, 1 * 1024 * 1024).progress(function(percentage){
	    				$( '#'+file.id ).find('.file-status').text('读取文件信息...');
	    			}).then(function(val){    
	    				$( '#'+file.id ).find('.file-status').text('成功读取文件信息');
	    				mapMd5[file.id] = val;
	                });
	            	//上传期间所上传占总的比例
	            	var fileSize = uploader.getFiles()[uploader.getFiles().length - 1].size;//总大小
	                $("#all" + file.id).html(fileSizeFun(fileSize));//总大小
	            }
	        });
		});

		//文件上传过程中创建进度条实时显示。
		uploader.on( 'uploadProgress', function( file, percentage ) {
		    var $li = $( '#'+file.id ),
		    $process = $li.find('.file-process');
		    
            //将实时进度存入隐藏域  
            $("#progress").val(Math.round(percentage * 100));  
            
            //根据fileId获取当前要上传的文件的进度
            var oldJinduValue = map[file.id];
            
            if(percentage < oldJinduValue && oldJinduValue != 1){
            	$process.css( 'width', oldJinduValue * 100 + '%' );
                $li.find('.file-status').text((oldJinduValue*100).toFixed(2) + "%");//已上传比例
            } else {
            	$process.css( 'width', percentage * 100 + '%' );
                $li.find('.file-status').text((percentage*100).toFixed(2) + "%");//已上传比例
            }
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
		    $( '#'+file.id ).find('.file-operate').find('.operate').html('<i class="fa fa-refresh"></i>');
		});

		uploader.on( 'uploadComplete', function( file ) {
		});

		$btn.on('click', function () {
		    if ($(this).hasClass('disabled')) {
		        return false;
		    }
		    
		    if (filesArr.length <= 0) {
		        return false;
		    }
		    //当前上传文件的文件名  
            var currentFileName;  
            //当前上传文件的文件id  
            var currentFileId; 
            //count=0 说明没开始传 默认从文件列表的第一个开始传  
            if(count == 0) {
            	currentFileName = filesArr[0].name;  
                currentFileId = filesArr[0].id;
            } else {
            	if(count <= filesArr.length-1){  
                    currentFileName = filesArr[count].name;  
                    currentFileId = filesArr[count].id;  
                } 
            }
            
            //先查询该文件是否上传过 如果上传过已经上传的进度是多少  
            $.ajax({    
                type : "POST",    
                url : "../../sys/file/progress",    
                data : {    
                    fileName : currentFileName//文件名  
                },    
                cache : false,  
                async : false,  // 同步  
                dataType : "json",    
                success : function(data){    
                    //如果上传过 将进度存入map  
                    if(data > 0){  
                        map[currentFileId] = data/100;  
                    }  
                    //执行上传  
                    uploader.upload(currentFileId);  
                }    
            });
		    //uploader.upload();
		});
		
		removeUpload = function (fileId){  
			var file = uploader.getFile(fileId);
			$("#"+fileId).remove();//删除页面上传信息元素
		    uploader.removeFile(file, true); 
		  //数组中的文件也要删除  
            for(var i=0;i<filesArr.length;i++){  
                if(filesArr[i].id == fileId){  
                    filesArr.splice(i,1);//i是要删除的元素在数组中的下标，1代表从下标位置开始连续删除一个元素  
                }  
            } 
	    }  
		
		operateUpload = function (fileId){
			var operate_id = "operate" + fileId;
			var file = uploader.getFile(fileId);
        	if($('#'+operate_id).children().hasClass('fa fa-pause')) {//则为正在上传，可点击暂停
        		//单个文件暂停有bug    先关闭
        		/*console.log("暂停=>"+fileId);
        		uploader.stop(file);
        		$('#'+operate_id).html('<i class="fa fa-play"></i>');*/
        	} else if($('#'+operate_id).children().hasClass('fa fa-play')) {//否则为正在暂停，可点击继续上传
        		console.log("开始=>"+fileId);
        		uploader.upload(file);
        		$('#'+operate_id).html('<i class="fa fa-pause"></i>');//上传后
        	} else if($('#'+operate_id).children().hasClass('fa fa-refresh')) {//若上传出错，则重新上传
        		uploader.retry(file);
        		$('#'+operate_id).html('<i class="fa fa-pause"></i>');//上传后
        	}
		}
		
		$stopBtn.on('click', function () {
			uploader.stop(true);
		})
		$retryBtn.on('click', function () {
			uploader.retry();
		})
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