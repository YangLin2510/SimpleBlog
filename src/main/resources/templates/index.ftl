<!doctype html>
<html>
<head>
    <title>主页</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 使用 bootstrap4 作为css框架  -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .container-fluid {
            background-color: #f5f6f7;
            min-height: 1000px;
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

        #bolg-list, #user-info {
            background-color: white;
            margin: 8px;
        }

        .bolg {
            border-bottom: 1px dashed rgba(0, 0, 0, .1);
            padding: 8px;
        }

        .bolg a {
            text-decoration: none;
            color: black;
        }

        .bolg a:hover {
            text-decoration: none;
            color: #de686d;
        }

        .bolg-infos {
            font-size: 14px;
        }

        .bolg-infos span {
            padding-right: 8px;
        }

        #user {
            background-color: white;
            margin: 8px;
        }

        #user-info-number {
            text-align: center;
        }

        .user-artials {
            padding: 16px;
        }

        .user-artials a {
            text-decoration: none;
            color: #757a7e;
            font-size: 14px;
        }

        .user-artials a:hover {
            text-decoration: none;
            color: #de686d;
        }

        .small-font {
            font-size: small;
            color: #bbb;
        }

        .page {
            text-align: center;
            padding-top: 16px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row" id="cate">
        <div class="col">
            <ul>
                <li><a href="/viewBolgsWithAuthor?blogAuthorId=${currentUser.id}">我的博客</a></li>
                <li><a href="/">博客主页</a></li>
            </ul>
        </div>

        <div class="col">
            <ul style="float:right">
                <li>
                    <form class="form-inline">
                        <input class="form-control form-control-sm" type="text"/>
                        <button type="submit" style="padding-left:8px" class="btn btn-outline-primary btn-sm">搜索
                        </button>
                    </form>
                </li>
                <li><a href='/editorArtical'>写 博 客</a></li>
            </ul>
        </div>

    </div>

    <div class="container">
        <div class="row" style="padding:8px;">
            <h1>${author.blogTitle}</h1>
        </div>
        <p>${author.blogDesc}</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-7" id="bolg-list">
            <#list blogsPage.getList() as blog>
                <div class="bolg">
                    <a href='/blog?articalId=${blog.id}'>
                        <h5>${blog.title}</h5>
                        <p>${blog.blogText}...</p>
                        <div class="bolg-infos"><span
                                class="bolg-type">原创</span><span>${blog.createTime?datetime}</span> <span
                                style="float:right">阅读: ${blog.viewCount}</span> <span
                                style="float:right">评论: ${blog.commentCount}</span></div>
                    </a>
                </div>
            </#list>


                <div class="page">
                    <nav>
                        <ul class="pagination pagination-sm justify-content-center">
                        <#if blogsPage.isHasPreviousPage()>
                            <li class="page-item"><a
                                    href="/viewBolgsWithAuthor?blogAuthorId=${author.id}&startPage=${blogsPage.getPrePage()}"
                                    class="page-link">上一页</a></li>
                        </#if>
                        <#list blogsPage.getNavigatepageNums() as pageNum>
                            <#if blogsPage.getPageNum() == pageNum>
                                <li class="page-item active"><a
                                        href="/viewBolgsWithAuthor?blogAuthorId=${author.id}&startPage=${pageNum}"
                                        class="page-link">${pageNum}</a></li>
                            <#else>
                                <li class="page-item"><a
                                        href="/viewBolgsWithAuthor?blogAuthorId=${author.id}&startPage=${pageNum}"
                                        class="page-link">${pageNum}</a></li>
                            </#if>
                        </#list>
                        <#if blogsPage.isHasNextPage()>
                            <li class="page-item"><a
                                    href="/viewBolgsWithAuthor?blogAuthorId=${author.id}&startPage=${blogsPage.getNextPage()}"
                                    class="page-link">下一页</a></li>
                        </#if>
                        </ul>
                    </nav>
                </div>

            </div>
            <div class="col-md-4" id="user">

                <div id="user-info">
                    <div>
                        <img src="3_dqcfkyqdxym3f8rb0.jpg" class="img-thumbnail"/>
                        <span>${author.displayName}</span>
                    </div>
                    <hr/>

                    <div id="user-info-number" class="row">
                    <#if blogsCountInfo??>
                        <div class="col">发布文章<br> <span style="font-weight:bold">${blogsCountInfo.blog_sum!"0"}</span>
                        </div>
                        <div class="col">浏览数<br> <span style="font-weight:bold">${blogsCountInfo.view_sum!"0"}</span>
                        </div>
                        <div class="col">评论<br> <span style="font-weight:bold">${blogsCountInfo.comment_sum!"0"}</span>
                        </div>
                    <#else>
                        <div class="col">发布文章<br> <span style="font-weight:bold">0</span></div>
                        <div class="col">浏览数<br> <span style="font-weight:bold">0</span></div>
                        <div class="col">评论<br> <span style="font-weight:bold">0</span></div>
                    </#if>

                    </div>
                </div>

                <div class="user-artials">
                    <h5 style="border-left:5px solid red;padding-left: 8px;">文章存档</h5>
                    <ul class="list-group">
                    <#list blogMonthAchive as achive>
                        <li class="list-group-item"><a
                                href="/viewBolgsWithAuthor?blogAuthorId=${author.id}&month=${achive.month}">${achive.month}</a>
                            <span style="float:right" class="small-font">${achive.blog_count}篇</span></li>
                    </#list>
                        <li class="list-group-item" style="text-align:center"><a href="#">展开</a></li>
                    </ul>
                </div>

                <div class="user-artials">
                    <h5 style="border-left:5px solid red;padding-left: 8px;">最近发表<a
                            href="/viewBolgsWithAuthor?blogAuthorId=${author.id}" style="float:right"> 更多文章 </a></h5>
                    <ul class="list-group">
                    <#list recentBlogs as recentBlog>
                        <li class="list-group-item"><a
                                href="/blog?articalId=${recentBlog.id}">${recentBlog.title}</a> </span></li>
                    </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
