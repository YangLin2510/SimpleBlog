<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑博客页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="keywords" content="opensource rich wysiwyg text editor jquery bootstrap execCommand html5"/>
    <meta name="description"
          content="This tiny jQuery Bootstrap WYSIWYG plugin turns any DIV into a HTML5 rich text editor"/>
    <link rel="apple-touch-icon" href="//mindmup.s3.amazonaws.com/lib/img/apple-touch-icon.png"/>
    <link rel="shortcut icon" href="http://mindmup.s3.amazonaws.com/lib/img/favicon.ico">
    <link href="bootstrap-wysiwyg-master/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css"
          rel="stylesheet">

    <!-- 使用 bootstrap4 作为css框架  -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!--font awesome 图标 -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">



    <style>
        #editor {
            max-height: 500px;
            overflow: scroll;
            border: 1px solid black;
            padding: 8px;
            height: 500px;
        }

        #editor_container {
            background-color: #fff;
            border-left: 1px solid #e9e9e9;
        }

        #cate {
            background-color: white;
        }

        #cate a {
            font-size: 14px;
            color: #757a7e;
            padding: 8px 16px;
        }

        #cate a:hover {
            color: #de686d;
        }

        #cate ul {
            list-style-type: none;
            margin: 0px;
            padding: 0px;
        }

        #cate li {
            display: inline-block;
            padding: 8px 32px;
        }

        .blog-cate {
            list-style-type: none;
            padding: 0;
            margin: 0;
            font-size: small;
        }

        .active {
            background-color: #F44444;
            color: white;
        }

        .blog-cate li a {
            text-decoration: none;
            text-align: center;
            padding: 8px 16px;
            display: block;
            border-top: 1px solid #F3F3F3;
        }

        .blog-cate li a:hover {
            background-color: #F44444;
            color: white;
        }

        .menu-item {
            padding: 8px 16px;
            color: #BBBBBB;
            font-size: small;
        }
        .title {
            border-left: 4px solid #F44444;
            margin-top: 8px;
            padding-left: 8px;
        }

        .blog_manager_cates {
            list-style-type: none;
            padding: 0px;
            margin: 0px;
        }
        .blog_manager_cates li {
            display: inline;
        }
        .blog_manager_cates a{
            text-decoration: none;
            display: inline-block;
            padding: 8px;
            font-size: small;
            color: #999;
            border-bottom: 2px solid white;
        }
        .blog_manager_cates a.cate_active {
            border-bottom: 2px solid #F44444;
            color: #4f4f4f;
        }
        .blog_manager_cates a:hover:not(.cate_active){
            border-bottom: 2px solid #F44444;
            color: #4f4f4f;
        }

        .manager_blog {
            padding: 16px 0;
            border-bottom: 1px dotted #ddd;
        }
        .manager_blog span {
            padding-right: 16px;
            font-size: small;
            color: #999;
        }
        .manager_blog a {
            text-decoration: none;
            color: black;
        }

        .manager_blog a:hover {
            text-decoration: none;
            color: #de686d;
        }
        .manager_blog_op {
            float: right;
        }
        .manager_blog_op a {
            font-size: small;
            padding: 0 8px;
            color: #999;
            text-decoration: none;
        }
        .manager_blog_op a:hover {
            color: #de686d;
        }

    </style>
    <!-- bootstrap-wysihtml5    HTML5 所见即所得编辑器-->
</head>
<body>
<div class="container-fluid" style="background-color: #f4f4f4;min-height: 1000px;">

    <div class="row" id="cate">
        <div class="col">
            <ul>
                <li><a href="/viewBolgsWithAuthor?blogAuthorId=${user.id}">我的博客</a></li>
                <li><a href="/">博客主页</a></li>
            </ul>
        </div>

        <div class="col">
            <ul style="float:right">
                <li>
                    <form class="form-inline">
                        <input class="form-control form-control-sm" style="height:31px" type="text"/>
                        <button type="submit" style="padding-left:8px;" class="btn btn-outline-primary btn-sm">搜索
                        </button>
                    </form>
                </li>
                <li><a href='/editorArtical'>写 博 客</a></li>
            </ul>
        </div>

    </div>

    <div class="container" style="margin-top: 32px;">

        <div class="row">
            <div class="col-2" style="background-color: #fff;padding: 0px;">
                <div class="menu-item">内容</div>
                <ul class="blog-cate">
                    <li><a href="manage_blog" class="active">文章管理</a></li>
                    <li><a href="#">评论管理</a></li>
                </ul>
            </div>
            <div id="editor_container" class="col-10">
                <p class="title">文章管理</p>
                <div style="border-bottom: 1px solid #e9e9e9 ">
                    <ul class="blog_manager_cates">
                        <#if status == '0'>
                            <li><a href="/manager_blog?userId=${userId}&blogStatus=0" class="cate_active">全部(${blogPage.total})</a></li>
                            <#else >
                            <li><a href="/manager_blog?userId=${userId}&blogStatus=0">全部</a></li>
                        </#if>
                        <#if status == '1'>
                            <li><a href="/manager_blog?userId=${userId}&blogStatus=1" class="cate_active">回收站(${blogPage.total})</a></li>
                            <#else>
                            <li><a href="/manager_blog?userId=${userId}&blogStatus=1">回收站</a></li>
                        </#if>
                    </ul>
                </div>

                <#list blogPage.getList() as blog>
                   <div class="manager_blog">
                       <a href="/blog?articalId=${blog.id}">${blog.title}</a>
                       <div>
                           <span><#if blog.blogType??>${blog.blogType}<#else >原创</#if></span><span>${blog.createTime?string("yyyy年MM月dd日 hh:mm:ss")}</span><span>阅读:${blog.viewCount}</span><span><i class="fa fa-comment-o" style="margin-right: 4px"></i>${blog.commentCount}</span>
                           <span class="manager_blog_op">
                               <#if status =='0'>
                                   <a href="/blog?articalId=${blog.id}">查看</a>|<a href="#" onclick="javascript:return del(${blog.id})" style="color: #CA0C16">删除</a>|<a href="#">置顶</a>|<a href="#">禁止评论</a>
                                   <#elseif status=='1'>
                                   <a href="/blog?articalId=${blog.id}">查看</a>|<a href="#" style="color: #CA0C16" onclick="javascript:return del(${blog.id})">删除</a>|<a href="#">恢复</a></a>
                               </#if>
                           </span>
                       </div>
                   </div>
                </#list>
            </div>
        </div>
    </div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="bootstrap-wysiwyg-master/external/jquery.hotkeys.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script src="bootstrap-wysiwyg-master/external/google-code-prettify/prettify.js"></script>
<script src="bootstrap-wysiwyg-master/bootstrap-wysiwyg.js"></script>
<script>
    
    function del(id) {
        var msg = "确定要删除这条博客吗?";
        if(confirm(msg)===true){
            //ajax删除 & 重新加载页面
            $.ajax({
               url:"/delBlog",
               data:{"blogId":id},
               success:function (data) {
                   if(data==='success'){
                       document.location.reload();//重新加载页面
                   }else if(data==='fail'){
                       alert("删除失败!");
                   }
               }
            });
        }
        return false;
    }
</script>
</body>
</html>
