package com.baidu.mapper;

import com.baidu.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface FriendsMapper {
    User findByUserName(@Param("userName") String userName);
}
