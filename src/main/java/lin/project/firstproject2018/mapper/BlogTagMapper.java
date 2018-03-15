package lin.project.firstproject2018.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import lin.project.firstproject2018.bean.BlogTag;

@Mapper
public interface BlogTagMapper {
	List<BlogTag> getBlogTags();

}
