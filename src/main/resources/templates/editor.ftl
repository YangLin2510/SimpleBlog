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

    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="bootstrap-wysiwyg-master/external/jquery.hotkeys.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
    <script src="bootstrap-wysiwyg-master/external/google-code-prettify/prettify.js"></script>
    <script src="bootstrap-wysiwyg-master/bootstrap-wysiwyg.js"></script>


    <style>
        #editor {
            max-height: 500px;
            overflow: scroll;
            border: 1px solid black;
            padding: 8px;
            height: 500px;
        }

        #editor_container {
            margin-top: 32px;
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

    </style>
    <!-- bootstrap-wysihtml5    HTML5 所见即所得编辑器-->
</head>
<body>
<div class="container-fluid">

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

    <div class="container">

        <h3>编辑博客</h3>


        <div class="row">
            <div class="col-2">
                <div class="menu-item">内容</div>
                <ul class="blog-cate">
                    <li><a href="manager_blog?userId=${user.id}" class="active">文章管理</a></li>
                    <li><a href="#">评论管理</a></li>
                </ul>
            </div>
            <div id="editor_container" class="col-10">
                <div class="row">
                    <div class="col-sm-2">
                        <select class="form-control form-control" name="blogType">
                            <option>原创</option>
                            <option>转载</option>
                            <option>翻译</option>
                        </select>
                    </div>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" placeholder="文章标题" style="height:38px;" id="title"/>
                    </div>
                </div>

                <div id="alerts"></div>
                <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" title="字体" id="Font"><i
                                class="icon-font"></i></a>
                        <ul class="dropdown-menu">
                        </ul>
                    </div>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" title="字体大小"><i
                                class="icon-text-height"></i>&nbsp;</a>
                        <ul class="dropdown-menu">
                            <li><a data-edit="fontSize 5"><font size="5">大</font></a></li>
                            <li><a data-edit="fontSize 3"><font size="3">中</font></a></li>
                            <li><a data-edit="fontSize 1"><font size="1">小</font></a></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <a class="btn" data-edit="bold" title="粗体 (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
                        <a class="btn" data-edit="italic" title="斜体 (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
                        <a class="btn" data-edit="strikethrough" title="删除线"><i class="icon-strikethrough"></i></a>
                        <a class="btn" data-edit="underline" title="下划线 (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
                    </div>
                    <div class="btn-group">
                        <a class="btn" data-edit="insertunorderedlist" title="点列表"><i class="icon-list-ul"></i></a>
                        <a class="btn" data-edit="insertorderedlist" title="数字列表"><i class="icon-list-ol"></i></a>
                        <a class="btn" data-edit="outdent" title="去掉缩进 (Shift+Tab)"><i class="icon-indent-left"></i></a>
                        <a class="btn" data-edit="indent" title="缩进 (Tab)"><i class="icon-indent-right"></i></a>
                    </div>
                    <div class="btn-group">
                        <a class="btn" data-edit="justifyleft" title="左对齐(Ctrl/Cmd+L)"><i
                                class="icon-align-left"></i></a>
                        <a class="btn" data-edit="justifycenter" title="居中对齐 (Ctrl/Cmd+E)"><i
                                class="icon-align-center"></i></a>
                        <a class="btn" data-edit="justifyright" title="右对齐 (Ctrl/Cmd+R)"><i
                                class="icon-align-right"></i></a>
                        <a class="btn" data-edit="justifyfull" title="整理版面 (Ctrl/Cmd+J)"><i
                                class="icon-align-justify"></i></a>
                    </div>
                    <div class="btn-group">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" title="超链接"><i class="icon-link"></i></a>
                        <div class="dropdown-menu input-append">
                            <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                            <button class="btn" type="button">Add</button>
                        </div>
                        <a class="btn" data-edit="unlink" title="移除超链接"><i class="icon-cut"></i></a>

                    </div>

                    <div class="btn-group">
                        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i
                                class="icon-picture"></i></a>
                        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage"/>
                    </div>
                    <div class="btn-group">
                        <a class="btn" data-edit="undo" title="撤销 (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                        <a class="btn" data-edit="redo" title="重做 (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
                    </div>
                    <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
                </div>

                <div id="editor">

                </div>

                <div style="padding-top:32px">
                    <button class="btn btn-outline-primary" id="publishBlog">发布博客</button>
                    <button class="btn btn-outline-danger" style="margin-left:32px;">保存草稿</button>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<script>
    $(function () {

        function initToolbarBootstrapBindings() {
            var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                        'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                        'Times New Roman', 'Verdana'],
                    fontTarget = $('[id=Font]').siblings('.dropdown-menu');
            $.each(fonts, function (idx, fontName) {
                fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
            });
            $('a[title]').tooltip({container: 'body'});
            $('.dropdown-menu input').click(function () {
                return false;
            })
                    .change(function () {
                        $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
                    })
                    .keydown('esc', function () {
                        this.value = '';
                        $(this).change();
                    });

            $('[data-role=magic-overlay]').each(function () {
                var overlay = $(this), target = $(overlay.data('target'));
                overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
            });
            if ("onwebkitspeechchange" in document.createElement("input")) {
                var editorOffset = $('#editor').offset();
                $('#voiceBtn').css('position', 'absolute').offset({
                    top: editorOffset.top,
                    left: editorOffset.left + $('#editor').innerWidth() - 35
                });
            } else {
                $('#voiceBtn').hide();
            }
        };

        function showErrorAlert(reason, detail) {
            var msg = '';
            if (reason === 'unsupported-file-type') {
                msg = "Unsupported format " + detail;
            }
            else {
                console.log("error uploading file", reason, detail);
            }
            $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                    '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
        };
        initToolbarBootstrapBindings();

        $('#editor').wysiwyg({fileUploadError: showErrorAlert});
        window.prettyPrint && prettyPrint();

        //--
        function publishBlog(blogTitle, authorId, blogText) {
            $.ajax({
                "url": "/publishBlog",
                "method": "post",
                "data": {"authorId": authorId, "title": blogTitle, "blogText": blogText},
                "success": function (data) {

                    alert("发布成功");
                    window.location.href = "/blog?articalId=" + data.id;
                }
            });
        }

        $("#publishBlog").click(function () {

            var blogTitle = $("#title").val();
            var blogText = $("#editor").html();
            var authorId = ${user.id};
            publishBlog(blogTitle, authorId, blogText);

        });
    });

</script>
</html>
