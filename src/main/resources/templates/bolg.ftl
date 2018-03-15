<!doctype html>
<html>
<head>
  <title>博客文章浏览页面</title>
  <!-- Required meta tags -->
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- 使用 bootstrap4 作为css框架  -->
 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
   #artical-title h2{
       font-weight: bold;
   }
   .container-fluid {
       background-color: #f5f6f7;
   }
   #artical,#comments{
     background-color: white;
     margin:8px;
     padding: 8px;
   }

  #comments {
    padding: 8px;
    font-size:small;
  }
   .artical-content {
     padding:8px;
   }
   .artical-content img{
     max-width: 100%;
   }

   .comment-content {
      border-bottom:1px dashed rgba(0,0,0,.1);
      padding: 8px;
   }
   .comment-content a,span{
     padding-right: 8px;
   }

   #user {
     background-color: white;
     margin: 8px;
   }

   #user-info-number {
     text-align:center;
   }

   .user-artials {
     padding:16px;
   }

   .user-artials a{
      text-decoration: none;
      color: #757a7e;
      font-size: 14px;
   }

   .user-artials a:hover{
      text-decoration: none;
      color: #de686d;
   }

   .small-font{
     font-size: small;
     color:#bbb;
   }

   .comment-reply {
      margin:8px;
      padding:8px;
      border-top: 1px dashed rgba(0,0,0,.1);
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
      
</style>
</head>
<body>
<div class="container-fluid">
   <div class="row" id="cate">
       <div class="col">
         <ul >
              <li ><a  href="/viewBolgsWithAuthor?blogAuthorId=${currentUser.id}">我的博客</a></li>
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
     
     <div class="container">
      <div class="row">
              <div class="col-md-7" id="artical">
                  <div class="artical-content">
                      <div id="artical-title">
                          <h2>${blog.title}</h2>
                          <div style="font-size:14px"><span>转载</span> <span style="padding-left:18px">${blog.lastUpdateTime?datetime}</span> <span style="float:right">阅读量: ${blog.viewCount}</span></div>
                      </div>
                      <hr/>

                      <div>
                          ${blog.blogText}
                      </div>
                  </div>

              </div>

              <div class="col-md-4" id="user">

                   <div id="user-info">
                     <div>
                       <img src="3_dqcfkyqdxym3f8rb0.jpg" class="img-thumbnail"/>
                       <span>博主: ${author.displayName}</span>
                     </div>
                     <hr/>

                     <div id="user-info-number" class="row">
                         <div class="col">发布文章<br> <span style="font-weight:bold">${blogsCountInfo.blog_sum}</span></div>
                         <div class="col">浏览数<br> <span style="font-weight:bold">${blogsCountInfo.view_sum}</span></div>
                         <div class="col">评论<br> <span style="font-weight:bold">${blogsCountInfo.comment_sum}</span></div>
                     </div>

                   </div>

                   <div class="user-artials">
                      <h5 style="border-left:5px solid red;padding-left: 8px;">文章存档</h5>
                      
                      <ul class="list-group">
                         <#list blogMonthAchive as achive>
                            <li class="list-group-item"><a href="/viewBolgsWithAuthor?blogAuthorId=${author.id}&month=${achive.month}" >${achive.month}</a> <span style="float:right" class="small-font">${achive.blog_count}篇</span></li>
                        </#list>
                          <li class="list-group-item" style="text-align:center"><a href="#">展开</a></li>
                      </ul>
                      
                   </div>

                   <div class="user-artials">
                     <h5 style="border-left:5px solid red;padding-left: 8px;">最近发表<a href="/viewBolgsWithAuthor?blogAuthorId=${author.id}" style="float:right"> 更多文章 </a></h5>
                     <ul class="list-group">
                          <#list recentBlogs as recentBlog>
                             <li class="list-group-item"><a href="/blog?articalId=${recentBlog.id}" >${recentBlog.title}</a> </span></li>
                         </#list>
                     </ul>
                   </div>

              </div>
      </div>

      <div class="row">
        <div class="col-md-7" id="comments">

               <form id="public-comment" action="/publishComment?blogId=${blog.id}" method="post">
                   <div class="form-group">
                      <textarea placeholder="输入你的评论..." class="form-control" rows="4" id="comment" name="comment"></textarea>
                   </div>
                   <div>
                      <span>还能输入<i id="commentLimit">200</i>字</span><button class="btn btn-outline-primary btn-sm" type="submit">发表评论</button>
                   </div>
               </form>

               <hr/>

               <div id="comment-list">
                    <#list comments as commentModel>
                      <div class="comment-content">
                       <div><a href="#">${commentModel.comment.userName}</a> <span>${commentModel.comment.dateTime?datetime}</span> <span style="float:right"><a href="#" >回复</a> <span>${comments?size - commentModel_index}楼</span></span></div>
                       <p>${commentModel.comment.comment}</p>
                       
                       <#list commentModel.commentReply as reply>
                             <div class="comment-reply">
                                 <div><a href="#">${reply.userName}</a> <span>${reply.dateTime?datetime}</span> <span style="float:right"></span> </div>
                                 <p>${reply.comment}</p>
                            </div>
                       </#list>
                     </div>
                   </#list>
               </div>
      </div>
      </div>
  </div>
</div>
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script>
    $(function(){
	$("#comment").keydown(function(){
		comment = $("#comment").val();
		commentlength = comment.length;
		if(200 - commentlength >= 0){
			$("#commentLimit").html(200 - commentlength);
		}else{
			$("#comment").val(comment.substring(0,200));
		}
	});
});
  </script>
</body>
</html>
