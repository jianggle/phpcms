<?php $show_header = $show_validator = $show_scroll = 1; include $this->admin_tpl('header', 'attachment');?>
<link rel="stylesheet" type="text/css" href="<?php echo JS_PATH?>webuploader/webuploader.css">
<script type="text/javascript" src="<?php echo JS_PATH?>webuploader/webuploader.min.js"></script>
<body class="pad-10">
<div class="col-tab">
	<ul class="tabBut cu-li">
		<li id="tab_swf_1" <?php echo $tab_status?> onclick="SwapTab('swf','on','',5,1);"><?php echo L('upload_attachment')?></li>
		<li id="tab_swf_2" onclick="SwapTab('swf','on','',5,2);"><?php echo L('net_file')?></li>
		<?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
		<li id="tab_swf_3" onclick="SwapTab('swf','on','',5,3);set_iframe('album_list','index.php?m=attachment&c=attachments&a=album_load&args=<?php echo $args?>');"><?php echo L('gallery')?></li>
		<li id="tab_swf_4" onclick="SwapTab('swf','on','',5,4);set_iframe('album_dir','index.php?m=attachment&c=attachments&a=album_dir&args=<?php echo $args?>');"><?php echo L('directory_browse')?></li>
		<?php }?>
		<?php if($att_not_used!='') {?>
		<li id="tab_swf_5" class="on icon" onclick="SwapTab('swf','on','',5,5);"><?php echo L('att_not_used')?></li>
		<?php }?>
	</ul>
	<div id="div_swf_1" class="content pad-10 <?php echo $div_status?>">
		<div>
			<div class="btns">
				<div id="picker">选择文件</div>
				<button id="ctlBtn">开始上传</button>
				<div id="nameTip" class="onShow">
					<?php echo L('upload_up_to')?>
					<font color="red"> <?php echo $file_upload_limit?></font>
					<?php echo L('attachments')?>,<?php echo L('largest')?>
					<font color="red"><?php echo sizecount($file_size_limit*1024)?></font>
				</div>
			</div>
			<div class="bk3"></div>
			<div class="lh24">
				<?php echo L('supported')?>
				<font style="font-family: Arial, Helvetica, sans-serif"><?php echo str_replace(array('.',','),array('','、'),$file_types)?></font>
				<?php echo L('formats')?>
			</div>
			<input type="checkbox" id="watermark_enable" value="1" <?php if(isset($watermark_enable) &&$watermark_enable == 1) echo 'checked'?>>
			<?php echo L('watermark_enable')?>
		</div>
		<div class="bk10"></div>
		<fieldset class="blue pad-10">
			<legend><?php echo L('lists')?></legend>
			<ul class="attachment-list" id="thelist"></ul>
		</fieldset>
	</div>
	<div id="div_swf_2" class="contentList pad-10 hidden">
		<div class="bk10"></div>
			<?php echo L('enter_address')?>
			<div class="bk3"></div>
			<input type="text" name="info[filename]" class="input-text" value=""  style="width:350px;"  onblur="addonlinefile(this)">
			<div class="bk10"></div>
		</div>
		<?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
		<div id="div_swf_3" class="contentList pad-10 hidden">
			<ul class="attachment-list">
				<iframe name="album-list" src="#" frameborder="false" scrolling="no" style="overflow-x:hidden;border:none" width="100%" height="345" allowtransparency="true" id="album_list"></iframe>
			</ul>
		</div>
		<div id="div_swf_4" class="contentList pad-10 hidden">
			<ul class="attachment-list">
				<iframe name="album-dir" src="#" frameborder="false" scrolling="auto" style="overflow-x:hidden;border:none" width="100%" height="330" allowtransparency="true" id="album_dir"></iframe>
			</ul>
		</div>
		<?php }?>
		<?php if($att_not_used!='') {?>
		<div id="div_swf_5" class="contentList pad-10">
			<div class="explain-col"><?php echo L('att_not_used_desc')?></div>
			<ul class="attachment-list" id="album">
			<?php if(is_array($att) && !empty($att)){ foreach ($att as $_v) {?>
			<li>
				<div class="img-wrap">
					<a onclick="javascript:album_cancel(this,<?php echo $_v['aid']?>,'<?php echo $_v['src']?>')" href="javascript:;" class="off"  title="<?php echo $_v['filename']?>">
						<div class="icon"></div>
						<img width="<?php echo $_v['width']?>"  path="<?php echo $_v['src']?>" src="<?php echo $_v['fileimg']?>" title="<?php echo $_v['filename']?>">
					</a>
				</div>
			</li>
			<?php }}?>
			</ul>
		</div>
		<?php }?>
		<div id="att-status" class="hidden"></div>
		<div id="att-status-del" class="hidden"></div>
		<div id="att-name" class="hidden"></div>
	</div>
</div>
<script type="text/javascript">
if ($.browser.mozilla) {
	window.onload=function(){
		if (location.href.indexOf("&rand=")<0) {
			location.href=location.href+"&rand="+Math.random();
		}
	}
}
function imgWrap(obj){
	$(obj).hasClass('on') ? $(obj).removeClass("on") : $(obj).addClass("on");
}

function SwapTab(name,cls_show,cls_hide,cnt,cur) {
	for(i=1;i<=cnt;i++){
		if(i==cur){
				$('#div_'+name+'_'+i).show();
				$('#tab_'+name+'_'+i).addClass(cls_show);
				$('#tab_'+name+'_'+i).removeClass(cls_hide);
		}else{
				$('#div_'+name+'_'+i).hide();
				$('#tab_'+name+'_'+i).removeClass(cls_show);
				$('#tab_'+name+'_'+i).addClass(cls_hide);
		}
	}
}

function addonlinefile(obj) {
	var strs = $(obj).val() ? '|'+ $(obj).val() :'';
	$('#att-status').html(strs);
}

function set_iframe(id,src){
	$("#"+id).attr("src",src);
}
function album_cancel(obj,id,source){
	var src = $(obj).children("img").attr("path");
	var filename = $(obj).attr('title');
	if($(obj).hasClass('on')){
		$(obj).removeClass("on");
		var imgstr = $("#att-status").html();
		var length = $("a[class='on']").children("img").length;
		var strs = filenames = '';
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json_del&aid='+id+'&src='+source+'&filename='+filename);
		for(var i=0;i<length;i++){
			strs += '|'+$("a[class='on']").children("img").eq(i).attr('path');
			filenames += '|'+$("a[class='on']").children("img").eq(i).attr('title');
		}
		$('#att-status').html(strs);
		$('#att-status').html(filenames);
	} else {
		var num = $('#att-status').html().split('|').length;
		var file_upload_limit = '<?php echo $file_upload_limit?>';
		if(num > file_upload_limit) {alert('<?php echo L('attachment_tip1')?>'+file_upload_limit+'<?php echo L('attachment_tip2')?>'); return false;}
		$(obj).addClass("on");
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json&aid='+id+'&src='+source+'&filename='+filename);
		$('#att-status').append('|'+src);
		$('#att-name').append('|'+filename);
	}
}

jQuery(function() {
	var $ = jQuery,
		$watermark_enable = $('#watermark_enable'),
		$list = $('#thelist'),
		$btn = $('#ctlBtn'),
		state = 'pending',
		uploader;

	// 初始化
	uploader = WebUploader.create({
		resize: false,
		swf: '<?php echo JS_PATH;?>js/Uploader.swf',
		server: '<?php echo $upload_path;?>index.php?m=attachment&c=attachments&a=webuploader',
		pick: '#picker',
		accept: {
			extensions: '<?php echo $file_types_post;?>',
			mimeTypes: '<?php echo $file_types;?>'
		},
		fileNumLimit: '<?php echo $file_upload_limit;?>',
		fileSingleSizeLimit: '<?php echo $file_size_limit*1024;?>',
		duplicate: false, //可以重复上传
		formData: {
			'SWFUPLOADSESSID': '<?php echo $sess_id;?>',
			'module': '<?php echo $_GET['module'];?>',
			'catid': '<?php echo $_GET['catid'];?>',
			'userid': '<?php echo $this->userid;?>',
			'siteid': '<?php echo $siteid;?>',
			'thumb_width': '<?php echo $thumb_width;?>',
			'thumb_height': '<?php echo $thumb_height;?>',
			'watermark_enable': '<?php echo $watermark_enable;?>',
			'swf_auth_key': '<?php echo $swf_auth_key;?>',
			'isadmin': '<?php echo $this->isadmin;?>',
			'groupid': '<?php echo $this->groupid;?>',
			'userid_flash': '<?php echo $userid_flash;?>',
			'dosubmit': '1'
		},
	});

	// 当有文件添加进来的时候
	uploader.on( 'fileQueued', function( file ) {
		$list.append('<div class="progressWrapper" id="' + file.id + '"><div class="progressContainer">' +
			'<a class="progressCancel cancel" href="#" style="visibility: visible;"> </a>' +
			'<div class="progressName">' + file.name + '</div>' +
			'<div class="progressBarStatus">&nbsp;</div>' +
			'<div class="progressBarInProgress"></div>' +
			'</div></div>');
	});

	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progressBarInProgress'),
			$percentage = percentage * 100;

		$li.find('.progressContainer').addClass('green');
		$li.find('.progressBarStatus').text('正在上传(' + $percentage +' %)请稍后...');
		$percent.css( 'width', $percentage + '%' );
	});

	//删除
	$list.on("click", ".cancel", function () {
		var $item = $(this).parent().parent(),
			$file = uploader.getFile($item.attr('id'));

		uploader.removeFile($file, true);
		$($item).fadeOut();
	});

	// 上传成功
	uploader.on( 'uploadSuccess', function( file, ret ) {
		// console.log(ret);
		if(ret.id === 0) {
			alert(ret.src);
			return false;
		}
		if(ret.ext === 1) {
			var img = '<a href="javascript:;" onclick="javascript:att_cancel(this,'+ret.id+',\'upload\')" class="on"><div class="icon"></div><img src="'+ret.src+'" width="80" imgid="'+ret.id+'" path="'+ret.src+'" title="'+ret.filename+'"/></a>';
		} else {
			var img = '<a href="javascript:;" onclick="javascript:att_cancel(this,'+ret.id+',\'upload\')" class="on"><div class="icon"></div><img src="statics/images/ext/'+ret.ext+'.png" width="80" imgid="'+ret.id+'" path="'+ret.src+'" title="'+ret.filename+'"/></a>';
		}
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json&aid='+ret.id+'&src='+ret.src+'&filename='+ret.filename);
		$list.append('<li><div id="attachment_'+ret.id+'" class="img-wrap"></div></li>');
		$('#attachment_'+ret.id).html(img);
		$('#att-status').append('|'+ret.src);
		$('#att-name').append('|'+ret.filename);
		$( '#'+file.id ).find('.progressBarStatus').text('文件上传成功');
	});

	// 上传失败
	uploader.on('uploadError', function (file) {
		$('#' + file.id).find('.progressBarStatus').text('上传出错');
	});

	// 上传完成
	uploader.on('uploadComplete', function (file) {
		$('#' + file.id).find('.progressContainer').fadeOut();
	});

	uploader.on( 'all', function( type ) {
		if ( type === 'startUpload' ) {
			state = 'uploading';
		} else if ( type === 'stopUpload' ) {
			state = 'paused';
		} else if ( type === 'uploadFinished' ) {
			state = 'done';
		}

		if ( state === 'uploading' ) {
			$btn.text('暂停上传');
		} else {
			$btn.text('开始上传');
		}
	});

	// 错误提示
	uploader.on('error', function (err) {
		switch (err) {
			case 'Q_EXCEED_NUM_LIMIT':
				alert("最多只能上传 <?php echo $file_upload_limit;?> 个附件");
				break;
			case 'F_DUPLICATE':
				alert("文件已在队列中");
				break;
			case 'Q_TYPE_DENIED':
				alert("文件类型不允许");
				break;
			case 'F_EXCEED_SIZE':
				alert("文件大小不能超过<?php echo sizecount($file_size_limit*1024)?>");
				break;
			default:
				alert(err);
				break;
		}
	});

	// 添加水印
	$watermark_enable.on( 'click', function() {
		uploader.on('uploadBeforeSend', function (obj, data) {
			data.watermark_enable = $watermark_enable.attr('checked') ? 1 : 0;
		});
	});

	// 开始上传
	$btn.on( 'click', function() {
		if ( state === 'uploading' ) {
			uploader.stop();
		} else {
			uploader.upload();
		}
	});
});
</script>
</body>
</html>