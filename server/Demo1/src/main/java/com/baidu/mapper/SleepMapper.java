package com.baidu.mapper;

import com.baidu.entity.Sleep;
import com.baidu.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface SleepMapper {
    List<Sleep> findSleepTime(@Param("userName") String userName);
}
