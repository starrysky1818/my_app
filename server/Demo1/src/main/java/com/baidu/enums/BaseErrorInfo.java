package com.baidu.enums;

public enum BaseErrorInfo implements ErrorInfo{
    INVALID_REQ(400, "请求参数异常"),
    USERNAME_WRONG(450, "请求参数异常"),
    FORBIDDEN(403, "无权限"),
    BIZ_FAILED(500, "业务异常");
    private final Integer code;
    private final String message;

    BaseErrorInfo(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
