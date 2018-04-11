package lin.project.firstproject2018.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import lin.project.firstproject2018.bean.Blog;
import lin.project.firstproject2018.bean.BlogTag;
import lin.project.firstproject2018.bean.Comment;
import lin.project.firstproject2018.bean.User;
import lin.project.firstproject2018.mapper.BlogMapper;
import lin.project.firstproject2018.mapper.BlogTagMapper;
import lin.project.firstproject2018.mapper.CommentMapper;
import lin.project.firstproject2018.mapper.UserMapper;
import lin.project.firstproject2018.model.BlogModel;
import lin.project.firstproject2018.model.CommentModel;

@Service
public class BolgService {

    @Autowired
    BlogMapper blogMapper;

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    BlogTagMapper blogTagMapper;

    @Autowired
    UserMapper userMapper;

    public Blog getBlogWithId(Long id) {
        return blogMapper.getBlogById(id);
    }

    public User getUserByName(String name) {
        return userMapper.getUserByUserName(name);
    }

    public User getUserById(Long userId) {
        return userMapper.getUserById(userId);
    }

    public Long saveComment(Comment comment) {
        return commentMapper.seveComment(comment);
    }

    public List<CommentModel> getCommentsByBlogId(Long id) {
        List<Comment> comments = commentMapper.getCommentsByBlogId(id);
        List<CommentModel> commentModels = new ArrayList<CommentModel>();
        for (Comment c : comments) {
            if (c.getParentCommentId() == null) {
                CommentModel cm = new CommentModel();
                cm.setComment(c);
                cm.setCommentReply(getSubComments(comments, c.getId()));
                commentModels.add(cm);
            }
        }
        return commentModels;
    }

    private List<Comment> getSubComments(List<Comment> comments, Long commentId) {
        List<Comment> cs = new ArrayList<Comment>();
        for (Comment c : comments) {
            if (c.getParentCommentId() != null && c.getParentCommentId().longValue() == commentId.longValue()) {
                cs.add(c);
            }
        }
        return cs;
    }

    public List<Blog> getBlogsWithPage(Blog queryBlog, int startPage, int pageSize, Date startDate, Date endDate, String month) {
        PageHelper.startPage(startPage, pageSize);
        List<Blog> blogList = blogMapper.getBlogsWithPage(queryBlog, month);
        return blogList;
    }

    public List<Map<String, String>> getAchiveBlogCount(Long blogAuthorId) {
        return blogMapper.getAchiveMonthBlog(blogAuthorId);
    }

    public Map<String, String> getBlogsCountInfoByAuthor(Long authorId) {
        return blogMapper.getBlogCountInfo(authorId);
    }

    public void saveBlog(Blog blog) {
        blogMapper.saveBlog(blog);
    }

    public void updateBlog(Blog blog) {
        blogMapper.updateBlog(blog);
    }

    public List<Blog> getRecentBlog(int size, Long blogAuthorId) {
        return blogMapper.getRecentBlogs(size, blogAuthorId);
    }

    /**
     * 根据标签，获取推荐博客
     *
     * @param tag
     * @return
     */
    public List<BlogModel> getRecommedBlogsByTagWithPage(String tagCode, int pageNum, int pageSize) {
        //暂时简单按阅读量排序靠前的推荐，个性化推荐算法后续改进
        if (pageNum <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("参数错误");
        }
        PageHelper.startPage(pageNum, pageSize);
        List<BlogModel> blogs = blogMapper.getBlogsByViewCountWithPage(tagCode);
        return blogs;
    }

    public List<BlogTag> getAllBlogTags() {
        return blogTagMapper.getBlogTags();
    }

    public void deleteBlog(Long blogId){
        if(blogId == null) throw new IllegalArgumentException("blogId 不能为空");
        blogMapper.deleteBlog(blogId);
    }
}
