<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

<head>
    <title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
    <meta name="description" content="<?php echo ($site_seo_description); ?>">
    	<?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
	<?php $portal_index_lastnews="9,10,11,12,13,14,15,16,17,18"; $portal_hot_articles="9,10,11,12,13,14,15,16,17,18"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); ?>
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
		#main-menu-user .dropdown-menu{
			top: 42px;
		}
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
        <a class="navbar-brand" href="#">My Blog</a>
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
        <div class="feature-cover-bg" style="width: 100%; height: 100%; background-image: url(http://tu.ihuan.me/api/bing/go);">
        </div>
    </div>
    <!--pic show end-->
    <!--更新or分类+footer-->
    <div class="container-fluid main-container" id="main-container">
        <!--main con sta-->
        <div class="row">
            <div class="col-md-6 col-xs-6">
                <h2 class="page-title"><?php echo ($name); ?></h2>
            </div>
            <!--login sta-->
            <div class="col-md-6 col-xs-6">
                <ul class="nav pull-right" id="main-menu-user">
                    <li class="dropdown user login">
                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" href="#">
                            <img src="/blog/themes/myblog//Public/img/headicon.png" class="headicon" width='26' />
                            <span class="user-nicename"></span><b class="caret"></b></a>
                        <ul class="dropdown-menu
">
                            <li><a href="<?php echo U('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a></li>
                            <li class="divider"></li>
                            <li><a href="<?php echo U('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a></li>
                        </ul>
                    </li>
                    <li class="dropdown user offline">
                        <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
                            <img src="/blog/themes/myblog//Public/img/headicon.png" class="headicon" width='26' />登录<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="<?php echo U('api/oauth/login',array('type'=>'sina'));?>"><i class="fa fa-weibo"></i> &nbsp;微博登录</a></li>
                            <li><a href="<?php echo U('api/oauth/login',array('type'=>'qq'));?>"><i class="fa fa-qq"></i> &nbsp;QQ登录</a></li>
                            <li><a href="<?php echo leuu('user/login/index');?>"><i class="fa fa-sign-in"></i> &nbsp;登录</a></li>
                            <li class="divider"></li>
                            <li><a href="<?php echo leuu('user/register/index');?>"><i class="fa fa-user"></i> &nbsp;注册</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--login end-->
        </div>
        <?php $result=sp_sql_posts_paged_bycatid($cat_id,"",20); ?>
        <?php if(is_array($result['posts'])): $i = 0; $__LIST__ = $result['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); $term=sp_get_term($vo['term_id'] ); ?>
            <!--更新文章-->
            <div class="row">
                <div class="col-md-12 post-container">
                    <h2 class="post-title">
						<a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" rel="bookmark"><?php echo ($vo["post_title"]); ?></a>
					</h2>
                    <div class="meta-box">
                        <span class="m-post-date">
							<i class="fa fa-calendar-o"></i><!--  2016年3月13日 -->
							<?php echo date("Y年m月d",strtotime($vo['post_date']));?>
						</span>
                        <span class="comments-link">
							<a href="javascript:;"><i class="fa fa-eye"></i><span><?php echo ($vo["post_hits"]); ?></span></a>
                        <a href="<?php echo U('article/do_like',array('id'=>$object_id));?>" class="js-count-btn"><i class="fa fa-thumbs-up"></i><span class="count"><?php echo ($vo["post_like"]); ?></span></a>
                        <a href="<?php echo U('user/favorite/do_favorite',array('id'=>$object_id));?>" class="js-favorite-btn" data-title="<?php echo ($post_title); ?>" data-url="<?php echo leuu('article/index',array('id'=>$tid,'cid'=>$term_id));?>" data-key="<?php echo sp_get_favorite_key('posts',$object_id);?>">
                            <i class="fa fa-star-o"></i></a>
                        </span>
                    </div>
                    <div class="post-content post-expect">
                        <p><?php echo ($vo["post_excerpt"]); ?>
                            <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" class="btn btn-primary btn-xs" style="text-indent: 0;">阅读全文</a>
                        </p>
                    </div>
                    <div class="meta-box">
                        <span class="cat-links">
							<i class="fa fa-navicon"></i>
							<b>分类:</b>
							<a href="<?php echo leuu('list/index',array('id'=>$vo['term_id']));?>" rel="category tag" target="_self"><?php echo ($term["name"]); ?></a>
						</span>
                        <span class="tag-links">
							<i class="fa fa-tags"></i><b>标签:</b>
							<a href="#" rel="tag" target="_self"><?php echo ($vo["post_keywords"]); ?></a>
						</span>
                    </div>
                </div>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
        <div class="pagination">
            <ul>
                <?php echo ($result['page']); ?>
            </ul>
        </div>
        <!--main con end-->
        <br>
<br>
<br>
<!-- Footer ================================================== -->
<hr> <?php echo hook('footer');?>
<!-- 网站底部 -->
<div class="container-fluid main-container" id="J_footer-container">
    <div class="row">
        <div class="col-md-4">
            <a class="copyright-link" href="#" target="_blank">&copy;冀ICP备15018356号</a>
        </div>
        <div class="col-md-8">
            <ul class="nav nav-pills navbar-right">
                <li class="menu-item"><a href="/blog/" title="">网站首页</a></li>
                <li class="menu-item"><a href="/blog/index.php?m=list&a=index&id=3" title="">生活点滴</a></li>
                <li class="menu-item"><a href="/blog/index.php?m=list&a=index&id=4" title="">学习点滴</a></li>
                <li class="menu-item"><a href="/blog/index.php?m=list&a=index&id=5" title="">资源分享</a></li>
                <li class="menu-item"><a href="/blog/index.php?m=list&a=index&id=6" title="">给我留言</a></li>
                <li class="menu-item"><a href="/blog/index.php?m=list&a=index&id=7" title="">关于系统</a></li>
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
	<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> -->
	<script src="/blog/themes/myblog/Public/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="/blog/themes/myblog/Public/js/jquery-migrate-1.2.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="/blog/public/js/wind.js"></script>
	<script src="/blog/themes/myblog/Public/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	 
    <script src="/blog/public/js/frontend.js"></script>
<script>
	$(function(){
		$('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { e.stopPropagation(); });
		
		$("#main-menu li.dropdown").hover(function(){
			$(this).addClass("open");
		},function(){
			$(this).removeClass("open");
		});
		
		$.post("<?php echo U('user/index/is_login');?>",{},function(data){
			if(data.status==1){
				if(data.user.avatar){
					$("#main-menu-user .headicon").attr("src",data.user.avatar.indexOf("http")==0?data.user.avatar:"/blog/data/upload/avatar/"+data.user.avatar);
				}
				
				$("#main-menu-user .user-nicename").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
				$("#main-menu-user li.login").show();
				
			}
			if(data.status==0){
				$("#main-menu-user li.offline").show();
			}
			
		});	
		;(function($){
			$.fn.totop=function(opt){
				var scrolling=false;
				return this.each(function(){
					var $this=$(this);
					$(window).scroll(function(){
						if(!scrolling){
							var sd=$(window).scrollTop();
							if(sd>100){
								$this.fadeIn();
							}else{
								$this.fadeOut();
							}
						}
					});
					
					$this.click(function(){
						scrolling=true;
						$('html, body').animate({
							scrollTop : 0
						}, 500,function(){
							scrolling=false;
							$this.fadeOut();
						});
					});
				});
			};
		})(jQuery); 
		
		$("#backtotop").totop();
		
		
	});
	</script>
	 <script>    
$('#main-menu-user li.dropdown,#main-menu-user .dropdown-menu').mouseover(function() {   
     $(this).addClass('open');    }).mouseout(function() {        $(this).removeClass('open');    }); 
</script> <?php echo hook('footer_end');?>
</body>

</html>