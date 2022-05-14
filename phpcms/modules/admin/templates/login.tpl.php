<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="<?php echo CHARSET;?>">
<meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1" />
<meta name="robots" content="none"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0"/>
<meta name="renderer" content="webkit" />
<title>后台登录</title>
<style>
*{padding:0;margin:0;box-sizing:border-box}
body{padding:0;margin:0;font-family:"Microsoft YaHei",STHeiti,"Hiragino Sans GB","WenQuanYi Micro Hei","Heiti SC",NSimSun,SimSun,Arial,Helvetica,sans-serif;background:#fff;color:#444;font-size:14px;line-height:20px}
div,form,h1,h2,h3,h4,img,input,label,p,span,textarea,ul{margin:0;padding:0}
table{border-collapse:collapse}
a{text-decoration:none;color:#039}
a:hover{color:#900}
ul{padding:0;margin:0}
li{list-style-type:none}
.clear{clear:both}
img{border:none}
/*=======================================================*/
.bg{position:absolute;top:0;left:0;z-index:-1000;height:260px;width:100%;background:#3a6ea5}
#wrapper{width:100%;padding:0;margin:0 auto}
.logo{margin:170px auto 60px auto;height:70px;line-height:70px;text-align:center;color:#fff;font-size:50px;text-transform:capitalize;}
input{float:left;vertical-align:middle}
input[type=text],input[type=password]{border:1px solid #3a6ea5}
label{line-height:30px;float:left;vertical-align:text-bottom;padding:0 5px 0 5px}
.login{width:600px;height:100px;margin:0 auto;padding-left:0}
.login dl{height:50px;clear:both}
.login dd{width:300px;float:left;margin-bottom:20px}
.login dd.password,.login dd.submit,.login dd.username{overflow:hidden;width:300px}
.login dd.submit img{display:inline-block;height:2.3em;width:auto;cursor:pointer;}
.login label{width:100px;text-align:right;overflow:hidden;text-overflow:clip;white-space:nowrap}
.login input[type=text],.login input[type=password]{float:left;width:200px;height:2.4em;padding:.1em 5px;line-height:2.4em}

.button{float:right;color:#fff;font-size:14px;width:70px;height:32px;background:#3a6ea5;border:1px solid #39C;cursor:pointer}
.button:hover{color:#fff;background:#39c;cursor:pointer}

.loginw{width:700px;margin-bottom:120px}
.loginw .content>div>p{font-weight:700;font-size:1.2em;padding:10px;background:#eee;margin-bottom:10px}
.loginw .content>div{padding-bottom:20px}
.loginw>form>p{padding:10px 10px 50px 10px}
.loginw>form>p>a{font-size:1.1em}
.loginw .content>div>div{padding:0 10px}
#errorTip{text-align:right;color:red}
@media only screen and (max-width:768px) {
.bg{height:160px}
.logo{margin-top:60px}
.login{width:310px}
.login dd{width:300px;float:right;padding:0 10px 0 0;margin-bottom:10px}
.login dd.submit{width:300px;float:right;padding:5px 0;margin-right:10px}
.login dd.submit img{margin-left:15px}
.login dd.password label,.login dd.username label{width:300px;clear:float;text-align:left}
.login input[type=text],.login input[type=password]{float:right;width:285px}
}
</style>
<script src="<?php echo JS_PATH?>jquery.min.js"></script>
</head>
<body>
<div class="bg">
<div id="wrapper">
<div class="logo">admin</div>
<div class="login">
<form action="index.php?m=admin&c=index&a=login&dosubmit=1" method="post" name="myform" onSubmit="return checkSth()">
    <dl>
        <dd class="username">
            <label>用户名</label>
            <input type="text" name="username" tabindex="1"/>
        </dd>
        <dd class="password">
            <label>密码</label>
            <input type="password" name="password" tabindex="2"/>
        </dd>
        <dd class="username">
            <label>验证码</label>
            <input type="text" name="code" tabindex="3"/>
        </dd>
        <dd class="submit">
            <?php echo form::checkcode('code_img')?>
            <span id="errorTip"></span>
            <input type="submit" value="登录" class="button" tabindex="99"/>
        </dd>
    </dl>
</form>
</div>
</div>
</div>
<script type="text/javascript">
if(top!=self)
if(self!=top) top.location=self.location;
var checkSth = function(){
	if(!$.trim($("input[name=username]").val())){
		$("#errorTip").text("请填写用户名");
		return false;
	}else if(!$.trim($("input[name=password]").val())){
		$("#errorTip").text("请填写密码");
		return false;
	}else if(!$.trim($("input[name=code]").val())){
		$("#errorTip").text("请填写验证码");
		return false;
	}
	return true;
};
</script>
</body>
</html>