package lin.project.firstproject2018.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import lin.project.firstproject2018.bean.Blog;
import lin.project.firstproject2018.bean.Comment;
import lin.project.firstproject2018.bean.User;
import lin.project.firstproject2018.model.CommentModel;
import lin.project.firstproject2018.service.BolgService;
import lin.project.firstproject2018.utils.HtmlHelper;

@Controller
public class BolgController {
	
	@Autowired
	BolgService blogService;
	
	
    @RequestMapping("/user_login")
    public String userLogin(){
        return "login";
    }

    @RequestMapping("/")
    public String login(String username,String password,String tagCode,Integer pageNum,HttpServletRequest  request,Model model){  	
    	User user = null;
    	HttpSession session = request.getSession();
    	if(username!=null && password != null){
    		 user = blogService.getUserByName(username);
    		 if(user == null || !user.getPassword().equals(password)){
    			 return "redirect:user_login";
    		 }
        	 session.setAttribute("user", user);//把用户信息发到回话
        }
    	if(session.getAttribute("user") == null) {
    		 return "redirect:user_login";
    	}
    	model.addAttribute("user", user);
    	if(pageNum == null) {
    		pageNum = 1;
    	}
    	model.addAttribute("recommendBlogs", blogService.getRecommedBlogsByTagWithPage(tagCode, pageNum, 10));
    	model.addAttribute("tags", blogService.getAllBlogTags());
    	if(tagCode == null) {
    		tagCode="";
    	}
    	model.addAttribute("currentTagCode", tagCode);
    	return "hello";
    }
    
    @RequestMapping("/viewBolgsWithAuthor")
    public String viewMyBlogs(HttpServletRequest request,Long blogAuthorId,Integer startPage,Date startDate,Date endDate,String month,Model model) {
    	HttpSession session= request.getSession();
    	if(startPage == null) {
    		startPage = 1;
    	}
    	User currentUser = (User)session.getAttribute("user");
    	User author = blogService.getUserById(blogAuthorId);
    	if(author == null) {
    		
    	}
    	Blog queryBlog = new Blog();
    	queryBlog.setAuthorUserId(author.getId());
    	List<Blog> blogs = blogService.getBlogsWithPage(queryBlog, startPage, 5,startDate,endDate,month);
    	trasferBlogContentDesc(blogs);
    	PageInfo<Blog> blogsPage = new PageInfo<Blog>(blogs);
    	
    	List<Blog> recentBlogs =  blogService.getRecentBlog(3,blogAuthorId);
    	List<Map<String,String>> blogMonthAchive = getAchiveBlogCount(blogAuthorId);
    	Map<String,String> blogsCountInfo = blogService.getBlogsCountInfoByAuthor(blogAuthorId);
    	model.addAttribute("recentBlogs",recentBlogs);
    	model.addAttribute("author", author);
    	model.addAttribute("blogsPage", blogsPage);
    	model.addAttribute("blogMonthAchive", blogMonthAchive);
    	model.addAttribute("blogsCountInfo",blogsCountInfo);
    	model.addAttribute("currentUser", currentUser);
    	return "index";
    }
    
    /**
     * 获取所有，有发表文章的月份和文章发布数量
     * @return
     */
    private List<Map<String,String>> getAchiveBlogCount(Long blogAuthorId){
    	return blogService.getAchiveBlogCount(blogAuthorId);
    } 
    
    //生成博客的简要
    private void trasferBlogContentDesc(List<Blog> blogs){
    	for(Blog blog:blogs) {
    		String blogDesc = HtmlHelper.getDescFromHtml(blog.getBlogText(), 100);
    		blog.setBlogText(blogDesc);
    	}
    }

    @RequestMapping("editorArtical")
    public String toEditorPage(String articalId,HttpServletRequest request,Model model){
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("user");
    	model.addAttribute("user",user);
        return "editor";
    }
    
    @RequestMapping("blog")
    public String viewArtical(String articalId,Model modle,HttpServletRequest request){
    	HttpSession session= request.getSession();
    	User currentUser = (User)session.getAttribute("user");
    	Long id = null;
    	try {
    		id = Long.valueOf(articalId);
    	}catch (Exception e) {
			return "redirect:/";
		}
    	Blog blog = blogService.getBlogWithId(id);
    	List<CommentModel> comments = blogService.getCommentsByBlogId(id);
    	modle.addAttribute("blog", blog);
    	modle.addAttribute("comments", comments);
    	//更新浏览数，浏览自己的博客不增加浏览量
    	if(currentUser.getId().longValue() != blog.getAuthorUserId().longValue())
    	     blog.setViewCount(blog.getViewCount()+1);
    	blogService.updateBlog(blog);
    	
    	Blog queryBlog = new Blog();
    	queryBlog.setAuthorUserId(blog.getAuthorUserId());
    	List<Blog> recentBlogs = blogService.getRecentBlog(3,blog.getAuthorUserId());
    	List<Map<String,String>> blogMonthAchive = getAchiveBlogCount(blog.getAuthorUserId());
    	Map<String,String> blogsCountInfo = blogService.getBlogsCountInfoByAuthor(blog.getAuthorUserId());
    	modle.addAttribute("recentBlogs",recentBlogs);
    	modle.addAttribute("blogMonthAchive", blogMonthAchive);
    	modle.addAttribute("blogsCountInfo",blogsCountInfo);
    	modle.addAttribute("author", blogService.getUserById(blog.getAuthorUserId()));
    	modle.addAttribute("currentUser", currentUser);
    	return "bolg";
    }
    
    //发表评论
    @RequestMapping("/publishComment")
    public String publishComment(String comment,Long blogId,Long parantCommentId,HttpServletRequest request){
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("user");
    	Comment commentObj = new Comment();
    	commentObj.setBlogId(blogId);
    	commentObj.setComment(comment);
    	commentObj.setDateTime(new Date());
    	if(parantCommentId != null){
    		commentObj.setParentCommentId(parantCommentId);;
    	}
    	commentObj.setUserId(user.getId());
    	commentObj.setUserName(user.getDisplayName());
    	
    	//更新Blog的评论数
    	Blog blog = blogService.getBlogWithId(blogId);
    	blog.setCommentCount(blog.getCommentCount()+1);
    	blogService.updateBlog(blog);
    	blogService.saveComment(commentObj);
    	return "redirect:blog/?articalId="+blogId;
    }
    
    @RequestMapping("/publishBlog")
    @ResponseBody
    public Blog publishBlog(Long authorId,String title,String blogText) {
    	Blog blog = new Blog();
    	blog.setAuthorUserId(authorId);
    	blog.setBlogText(blogText);
    	blog.setTitle(title);
    	blog.setCreateTime(new Date());
    	blog.setLastUpdateTime(new Date());
    	blog.setViewCount(0);
    	blog.setCommentCount(0);
    	blogService.saveBlog(blog);
    	return blog;
    }

}
