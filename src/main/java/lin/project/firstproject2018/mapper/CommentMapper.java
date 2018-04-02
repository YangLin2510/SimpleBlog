package lin.project.firstproject2018.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import lin.project.firstproject2018.bean.Comment;

@Mapper
public interface CommentMapper {
    List<Comment> getCommentsByBlogId(Long id);

    Long seveComment(@Param("comment") Comment comment);
}
