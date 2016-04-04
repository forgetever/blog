<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

<head>
    <title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
    <meta name="description" content="<?php echo ($site_seo_description); ?>">
    	<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
	<?php $portal_index_lastnews="2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta name="author" content="zp">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

   	<!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	<link rel="icon" href="/blog/themes/myblog/Public/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/blog/themes/myblog/Public/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/blog/themes/myblog/Public/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="/blog/themes/myblog/Public/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="/blog/themes/myblog/Public/css/style.css" />
	<!--[if IE 7]>
	<link rel="stylesheet" href="/blog/themes/myblog/Public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
	<style>
		/*html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);-webkit-filter: grayscale(1);}*/
		#backtotop{position: fixed;bottom: 50px;right:20px;display: none;cursor: pointer;font-size: 50px;z-index: 9999;}
		#backtotop:hover{color:#333}
		#main-menu-user li.user{display: none}
	</style>
	
</head>

<body class="body-white">
    <?php echo hook('body_start');?>

<!--
        	作者：791458703@qq.com
        	时间：2016-04-02
        	描述：nav sta
        -->
<nav class="navbar g-navbar-box navbar-inverse" role="navigation" id="Js_page-navbar">
    <!--g-navbar-box 重写默认样式,使导航固定于左侧-->
    <!--nav logo-->
    <div class="navbar-header">
        <!--为了给导航栏添加响应式特性，
				您要折叠的内容必须包裹在带有 classes .collapse、.navbar-collapse 的 <div> 中。
				折叠起来的导航栏实际上是一个带有 class .navbar-toggle 及两个 data- 元素的按钮。
				第一个是 data-toggle，用于告诉 JavaScript 需要对按钮做什么，
				第二个是 data-target，指示要切换到哪一个元素。
				三个带有 class .icon-bar 的 <span> 创建所谓的汉堡按钮。这些会切换为 .nav-collapse <div> 中的元素-->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">My Blog</a>
    </div>
    <!--nav logo-->
    <div class="collapse navbar-collapse">
    <?php
 $effected_id="JS_nav_list"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' >\$label </a>"; $ul_class="dropdown-menu bounceOutDown" ; $li_class="" ; $style="nav navbar-nav navbar-right navbar-inverse"; $showlevel=6; $dropdown='menu-item'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
       <!--  <ul class="nav navbar-nav navbar-right navbar-inverse" id="JS_nav_list">
           <li class="menu-item"><a class="menu-item-link" href="index.html" target="_self">网站首页</a></li>
           <li class="menu-item"><a class="menu-item-link" href="#" target="_self">生活点滴</a>
               <ul class="dropdown-menu bounceOutDown ">
                   <li><a href="#" target="_self">生活琐事</a></li>
                   <li><a href="#" target="_self">生活随笔</a></li>
                   <li><a href="#" target="_self">杂乱文档</a></li>
                   <li><a href="#" target="_self">文章存档</a></li>
               </ul>
           </li>
           <li class="menu-item"><a class="menu-item-link" href="#" target="_self">学习点滴</a>
               <ul class="dropdown-menu bounceOutDown ">
                   <li><a href="#" target="_self">前端积累</a></li>
                   <li><a href="#" target="_self">后端脚本</a></li>
                   <li><a href="#" target="_self">桌面开发</a></li>
                   <li><a href="#" target="_self">系统相关</a></li>
                   <li><a href="#" target="_self">资料收集</a></li>
               </ul>
           </li>
           <li class="menu-item"><a class="menu-item-link" href="#" target="_self">资源分享</a>
               <ul class="dropdown-menu bounceOutDown">
                   <li><a href="#" target="_self">媒体资源</a></li>
                   <li><a href="#" target="_self">实用技巧</a></li>
                   <li><a href="#" target="_self">经典软件</a></li>
                   <li><a href="#" target="_self">休闲一刻</a></li>
                   <li><a href="#" target="_self">历史尘埃</a></li>
               </ul>
           </li>
           <li class="menu-item"><a class="menu-item-link" href="friendLink.html" target="_self">友情链接</a></li>
           <li class="menu-item"><a class="menu-item-link" href="contact.html" target="_self">给我留言</a></li>
           <li class="menu-item"><a class="menu-item-link" href="about.html" target="_self">关于系统</a></li>
       </ul> -->
    </div>
</nav>
<!--
        	作者：791458703@qq.com
        	时间：2016-04-02
        	描述：nav end
        -->

		<!--pic show sta-->
		<div class="feature-cover-container" style="width: 245px; opacity: 1;display: block;">
			<div class="feature-cover-box">
				<h3>新年寄语</h3>
				<p class="feature-cover-content">潜心磨剑，藏器于身。</p>
			</div>
			<div class="feature-cover-bg" style="width: 100%; height: 100%; background-image: url(/blog/themes/myblog/Public/img/feature-cover-leaf.jpg);">

			</div>
		</div>
		<!--pic show end-->

		<!--更新or分类+footer-->
		<div class="container-fluid main-container" id="main-container">
			<!--main con sta-->
			<div class="row">
				<div class="col-md-12">
					<h2 class="page-title">与我联系</h2>
				</div>
				<div class="col-md-12 post-container">
					<h2 class="post-title"><a href="#" rel="bookmark">个人简介</a></h2>
					<div class="post-content">
						<img src="/blog/themes/myblog/Public/img/contact.jpg" class="img-responsive" alt="Responsive image">
						<p>一直有自己写一个blog的想法，但是限于种种原因一直没有完成。现在终于有了雏形，心里很是高兴，愿我们能一直走下去！</p>
						<blockquote>
							<ul>
								<li>有朋自远方来，不亦悦乎。</li>
								<li>既然来了，如果我们有共同兴趣的话，不妨留言讨论，说不定我们会成为朋友。</li>
							</ul>
						</blockquote>
						<p>联系方式:</p>
						<p>
							<a class="btn btn-sm btn-primary" href="mailto:soulteary@qq.com" target="_blank">
								<i class="fa fa-qq"></i>QQ
							</a>
							<a class="btn btn-sm btn-primary" href="mailto:soulteary@gmail.com" target="_blank">
								<i class="fa fa-weibo"></i>微博
							</a>
							<a class="btn btn-sm btn-primary" href="mailto:soulteary@gmail.com" target="_blank">
								<i class="fa fa-facebook"></i>脸书
							</a>
						</p>
						<p>也可以在本网站留言</p>
					</div>

					<div class="hr_25">

					</div>
				</div>
			</div>
			
			<br>
<br>
<br>
<!-- Footer ================================================== -->
<hr> <?php echo hook('footer');?>
<!-- 网站底部 -->
<div class="container-fluid main-container" id="J_footer-container">
    <div class="row">
        <div class="col-md-4">
            <a class="copyright-link" href="#" target="_blank"> © soulteary</a>
        </div>
        <div class="col-md-8">
            <ul class="nav nav-pills navbar-right">
                <li class="menu-item"><a href="#" title="">网站首页</a></li>
                <li class="menu-item"><a href="#" title="">网站首页</a></li>
                <li class="menu-item"><a href="#" title="">网站首页</a></li>
                <li class="menu-item"><a href="#" title="">网站首页</a></li>
                <li class="menu-item"><a href="#" title="">网站首页</a></li>
            </ul>
        </div>
    </div>
</div>
<!--footer end-->
<?php echo ($site_tongji); ?>

    </div>
    <script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/blog/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="/blog/themes/myblog/Public/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="/blog/themes/myblog/Public/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

 <?php echo hook('footer_end');?>
</body>

</html>