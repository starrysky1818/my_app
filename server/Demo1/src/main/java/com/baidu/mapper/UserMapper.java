package com.baidu.mapper;

import com.baidu.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    List<User> selectAll();
    User logInUser(@Param("userName") String userName, @Param("password") String password);
    Integer signUpUser(@Param("userName") String userName, @Param("password") String password);
}
