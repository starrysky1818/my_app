package com.baidu.service;

import com.baidu.entity.Sleep;
import com.baidu.enums.BaseErrorInfo;
import com.baidu.exception.SleepException;
import com.baidu.mapper.SleepMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SleepService {
    @Autowired
    private SleepMapper sleepMapper;
    public List<Sleep> findSleepTime(String userName) {
        if (StringUtils.isBlank(userName)) {
            throw new SleepException(BaseErrorInfo.INVALID_REQ,
                    "userName or password can't be null");
        }
        return sleepMapper.findSleepTime(userName);
    }
}
