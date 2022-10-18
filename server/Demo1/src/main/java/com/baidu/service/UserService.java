package com.baidu.service;

import com.baidu.entity.User;
import com.baidu.enums.BaseErrorInfo;
import com.baidu.exception.SleepException;
import com.baidu.mapper.UserMapper;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper mapper;
    public List<User> getUser() {
        return mapper.selectAll();
    }

    public User logIn(String userName, String password) {
        if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
            throw new SleepException(BaseErrorInfo.INVALID_REQ,
                    "userName or password can't be null");
        }
        return mapper.logInUser(userName, password);
    }

    public Integer signUp(String userName, String password) {
        int number;
        try {
            number = mapper.signUpUser(userName, password);
        } catch (Exception e) {
            number = 0;
        }
        return number;
    }
}
