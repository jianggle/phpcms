<?php include PHPCMS_PATH.'install/step/header.tpl.php';?>
	<div class="body_box">
        <div class="main_box">
            <div class="hd">
            	<div class="bz a3"><div class="jj_bg"></div></div>
            </div>
            <div class="ct">
            	<div class="bg_t"></div>
                <div class="clr">
                    <div class="l"></div>
                    <div class="ct_box nobrd i6v">
                    <div class="nr">
					<form id="install" action="install.php?" method="post">
					<input type="hidden" name="step" value="4">				
<fieldset>
	<legend>必选模块</legend>
	<div class="content">
    	<label><input type="checkbox" name="admin" value="admin" checked disabled>后台管理模块</label>
        <label><input type="checkbox" name="content" value="content" checked disabled>内容模块</label>
        <label><input type="checkbox" name="member" value="member" checked  disabled>会员模型</label>
       <label><input type="checkbox" name="pay" value="pay" checked  disabled>财务模块</label>
       <label><input type="checkbox" name="special" value="special" checked  disabled>专题模块</label>
       <label><input type="checkbox" name="search" value="search" checked  disabled>全文搜索</label>
    </div>
</fieldset>
		
<fieldset>
	<legend>可选模块</legend>
	<div class="content"> 
<?php
	$count = count($PHPCMS_MODULES['name']);
	$j = 0;
	foreach($PHPCMS_MODULES['name'] as  $i=>$module)
	{
		if($j%5==0) echo "<tr >";
	?>
	<label><input type="checkbox" name="selectmod[]" value="<?php echo $module?>"><?php echo $PHPCMS_MODULES['modulename'][$i]?>模块</label>
	<?php
		if($j%5==4) echo "</tr>";
	$j++;
	}
?>
    </div>
</fieldset>
					</form>
					</div>
                    </div>
                </div>
                <div class="bg_b"></div>
            </div>
            <div class="btn_box"><a href="javascript:history.go(-1);" class="s_btn pre">上一步</a><a href="javascript:void(0);"  onClick="$('#install').submit();return false;" class="x_btn">下一步</a></div>
        </div>
    </div>
</body>
</html>