package com.baidu.exception;

import com.baidu.enums.ErrorInfo;

import static java.util.Objects.requireNonNull;

public class SleepException extends RuntimeException{
    private static final long serialVersionUID = 4535991092018757629L;

    public static final String BIZ_ERROR_INFO_IS_NULL_MSG = "biz error info must not be empty";

    private final ErrorInfo bizErrorInfo;

    public SleepException(ErrorInfo bizErrorInfo) {
        super(requireNonNull(bizErrorInfo, BIZ_ERROR_INFO_IS_NULL_MSG).getMessage());
        this.bizErrorInfo = bizErrorInfo;
    }

    public SleepException(ErrorInfo bizErrorInfo, String message) {
        super(message);
        requireNonNull(bizErrorInfo, BIZ_ERROR_INFO_IS_NULL_MSG);
        this.bizErrorInfo = bizErrorInfo;
    }

    public SleepException(ErrorInfo bizErrorInfo, String message, Throwable throwable) {
        super(message, throwable);
        requireNonNull(bizErrorInfo, BIZ_ERROR_INFO_IS_NULL_MSG);
        this.bizErrorInfo = bizErrorInfo;
    }
}
