<!doctype html>
<html>
<head>
  <title>博客主页</title>
  <!-- 使用 bootstrap4 作为css框架  -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <style>
      .container-fluid {
       background-color: #f5f6f7;
      }
      #cate {
        background-color: white;
     }
     #cate a{
       font-size: 14px;
       color: #757a7e;
       padding: 8px 16px;
     }
      #cate a:hover{
        color: #de686d;
      }
      #cate ul{
        list-style-type: none;
        margin: 0px;
        padding: 0px;
      }
      #cate li {
        display: inline-block;
        padding: 8px 32px;
      }
      .blog-content {
          background-color:white;
      }
      .col-1,.col-8,.col-3 {
          padding-left:8px;
          padding-right:8px;
      }
      .blog-cate {
          list-style-type:none;
          padding:0;
          margin:0;
          text-align:center;
          font-size:small;
      }

      
      .blog-cate li a{
          text-decoration:none;
          color:#938570;
          padding:8px 16px;
          display:block;
      }

      .blog-cate li a:hover:not(.active) {
          background-color:#F44444;
          color:white;
      }
      
      .blog-cate li a.active {
         background-color:#F44444;
         color:white;
      }
      
      .blog-list a {
        text-decoration:none;
        color:#4F4F4F;
      }
      .blog-list a:hover {
        color:#ca0c16;
      }
      .blog-list{
        padding:0;
        margin:0;
        list-style-type:none;
      }
      .blog-list li:hover {
         background-color:#fafafa;
      }
      .blog-list li{
         border-top:1px solid #F3F3F3;
      }
  </style>
</head>
<body>
   <div class="container-fluid">

       <div class="row" id="cate">
       <div class="col">
         <ul >
              <li ><a  href="/viewBolgsWithAuthor?blogAuthorId=${user.id}">我的博客</a></li>
              <li ><a  href="/">博客主页</a></li>
         </ul>
      </div>

      <div class="col">
         <ul style="float:right">
           <li>
             <form class="form-inline">
                  <input class="form-control form-control-sm" type="text" />
                  <button type="submit" style="padding-left:8px" class="btn btn-outline-primary btn-sm">搜索</button>
             </form>
           </li>
           <li> <a href='/editorArtical'>写 博 客</a></li>
         </ul>
       </div>

     </div>


       <div class="container" style="margin-top:16px;">
           <div class="row">
                  <div class="col-2" >
                     <div class="blog-content">
                         <ul class="blog-cate">
                           <#if currentTagCode==''>
                                <li><a href="/" class='active'>推荐</a></li> 
                                <#else>
                                <li><a href="/" >推荐</a></li> 
                           </#if>
                           
                           <#list tags as tag>
                                <#if currentTagCode == tag.tagCode>
                                        <li><a href="/?tagCode=${tag.tagCode}" class="active">${tag.tagName}</a></li>
                                    <#else>
                                        <li><a href="/?tagCode=${tag.tagCode}">${tag.tagName}</a></li>
                                </#if>
                                
                           </#list>
                         </ul>
                     </div>
                  </div>

                  <div class="col-10">
                     <div class="blog-content">
                    <#if currentTagCode=''>
                   
                      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                          <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                          </ol>
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                              <img class="d-block w-100" alt="Third slide [800x400]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22800%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20800%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1621944a31c%20text%20%7B%20fill%3A%23333%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A40pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1621944a31c%22%3E%3Crect%20width%3D%22800%22%20height%3D%22400%22%20fill%3D%22%23555%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22276.9749984741211%22%20y%3D%22218.3%22%3EThird%20slide%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="First slide">
                                   <div class="carousel-caption d-none d-md-block">
                                   <p>Android性能优化：手把手带你全面了解 内存泄露 & 解决方案</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block w-100" alt="Third slide [800x400]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22800%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20800%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1621944a31c%20text%20%7B%20fill%3A%23333%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A40pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1621944a31c%22%3E%3Crect%20width%3D%22800%22%20height%3D%22400%22%20fill%3D%22%23555%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22276.9749984741211%22%20y%3D%22218.3%22%3EThird%20slide%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E">
                            </div>
                            <div class="carousel-item">

                              <img class="d-block w-100" alt="Third slide [800x400]" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22800%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20800%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1621944a31c%20text%20%7B%20fill%3A%23333%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A40pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1621944a31c%22%3E%3Crect%20width%3D%22800%22%20height%3D%22400%22%20fill%3D%22%23555%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22276.9749984741211%22%20y%3D%22218.3%22%3EThird%20slide%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E">
                            </div>
                          </div>

                          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                          </a>

                          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                          </a>
                         </div>

                       </div>
                     </#if>

                     <div class="blog-content" style="margin-top:16px;">
                              <ul  class="blog-list">
                                   <#list recommendBlogs as blog>
                                      <li>
                                           <div style="padding:16px;">
                                                <p style="font-size:large;"><a href="/blog?articalId=${blog.id}" style="font-weight: bold;">${blog.title} </a><span style="float:right;color:#81C8F1;">${blog.viewCount}</span></p>
                                                <div style="font-size:small;color:#999999"><span><a href="/?tagCode=${blog.blogTagCode}" style="color:#007bff;padding-right:32px;">${blog.blogTypeName}</a></span> <span><a href="/viewBolgsWithAuthor?blogAuthorId=${blog.authorUserId}">${blog.authorUserName}</a></span><span style="padding-left:16px;">${blog.createTime?datetime}</span> <span style="float:right">阅读量</span></div>
                                           </div>
                                     </li>
                                   
                                   </#list>    
                              </ul>
                     </div>


                  </div>


           </div>

       </div>
   </div>
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
