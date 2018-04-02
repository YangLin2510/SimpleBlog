package lin.project.firstproject2018.mapper;

import org.apache.ibatis.annotations.Mapper;

import lin.project.firstproject2018.bean.User;

@Mapper
public interface UserMapper {
    User getUserById(Long id);

    User getUserByUserName(String username);
}
