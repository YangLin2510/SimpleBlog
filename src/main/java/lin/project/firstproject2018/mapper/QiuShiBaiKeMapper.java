package lin.project.firstproject2018.mapper;

import lin.project.firstproject2018.bean.QiuShiBaiKe;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QiuShiBaiKeMapper {
    QiuShiBaiKe selectById(int id);
}
