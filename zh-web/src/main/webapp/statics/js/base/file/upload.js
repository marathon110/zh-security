/**
 * upload文件上传js
 */
/*init webuploader*/
var $list = $("#thelist"); 
var $btn =$("#ctlBtn");   //开始上传

var uploader = WebUploader.create({

    // swf文件路径
    swf: '../../../plugins/webuploader/Uploader.swf',

    // 文件接收服务端。
    server: '../../sys/file/upload',

    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#picker',

    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false
});


//当有文件被添加进队列的时候
uploader.on( 'fileQueued', function( file ) {
    $list.append( '<div id="' + file.id + '" class="item">' +
        '<h4 class="info">' + file.name + '</h4>' +
        '<p class="state">等待上传...</p>' +
    '</div>' );
});

//文件上传过程中创建进度条实时显示。
uploader.on( 'uploadProgress', function( file, percentage ) {
    var $li = $( '#'+file.id ),
        $percent = $li.find('.progress .progress-bar');

    // 避免重复创建
    if ( !$percent.length ) {
        $percent = $('<div class="progress progress-striped active">' +
          '<div class="progress-bar" role="progressbar" style="width: 0%">' +
          '</div>' +
        '</div>').appendTo( $li ).find('.progress-bar');
    }

    $li.find('p.state').text('上传中');

    $percent.css( 'width', percentage * 100 + '%' );
});


uploader.on( 'uploadSuccess', function( file ) {
    $( '#'+file.id ).find('p.state').text('已上传');
});

//文件成功、失败处理
uploader.on( 'uploadError', function( file ) {
    $( '#'+file.id ).find('p.state').text('上传出错');
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