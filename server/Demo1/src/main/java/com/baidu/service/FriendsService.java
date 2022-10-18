package com.baidu.service;
import com.baidu.entity.User;
import com.baidu.enums.BaseErrorInfo;
import com.baidu.exception.SleepException;
import com.baidu.mapper.FriendsMapper;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendsService {
    @Autowired
    private FriendsMapper mapper;
    public User findByUserName(String userName) {
        if (StringUtils.isBlank(userName)) {
            throw new SleepException(BaseErrorInfo.INVALID_REQ,
                    "userName or password can't be null");
        }
        return mapper.findByUserName(userName);
    }
}
