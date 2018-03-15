package lin.project.firstproject2018.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import lin.project.firstproject2018.bean.Blog;
import lin.project.firstproject2018.model.BlogModel;
@Mapper
public interface BlogMapper {
	Blog getBlogById(Long id);
	
	List<Blog> getBlogsWithPage(@Param("queryBlog")Blog queryBlog,@Param("month")String month);
	
	List<Map<String,String>> getAchiveMonthBlog(@Param("blogAuthorId")Long blogAuthorId);
	
	Map<String,String> getBlogCountInfo(@Param("authorId")Long authorId);
	
	void saveBlog(Blog blog);
	
	List<Blog> getRecentBlogs(@Param("size")int size,@Param("blogAuthorId")Long blogAuthorId);
	
	List<BlogModel> getBlogsByViewCountWithPage(@Param("tagCode")String tagCode);
	
	void updateBlog(Blog blog);
}
