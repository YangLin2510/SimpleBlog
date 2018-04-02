<!doctype html>
<html>
<head>
    <title>登录页面</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="js/sample.js"></script>
    <!-- 使用 bootstrap4 作为css框架  -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
        #login_form {
            border: 1px solid black;
            padding: 8px 16px;
            margin: 8px;
        }

        .container {
            margin-top: 50px;
        }

        #login_display_border {
            margin: 8px;
        }
    </style>
</head>


<body>
<div class="container">
    <div class="row">
        <div class="col-md-6" id="login_form">
            <div style="padding:8px 0px;font-weight:bold;font-size:1.2">账号登录</div>
            <form action="/" method="post">
                <div class="form-group">
                    <label for="username">用户名 :</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>

                <div class="form-group">
                    <label for="password">密码 :</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>

                <div class="checkbox">
                    <label><input type="checkbox" id="remember_me">记住密码</label>
                </div>

                <button type="submit" id="submit" class="btn btn-primary btn-block">提交</button>
            </form>

            <hr>
            <div id="register">
                还没有账号? <a href="#">点击注册</a>
            </div>

        </div>

        <div class="col-md-5" id="login_display_border">
            <div class="card">
                <div class="card-header">每日一句</div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p>业精与勤 荒于嬉</p>
                        <footer class="blockquote-footer">朱熹</footer>
                    </blockquote>
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
