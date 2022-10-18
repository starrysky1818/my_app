package com.baidu.base;

import com.baidu.enums.ErrorInfo;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;

@Data
@Slf4j
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Response<T> implements Serializable {
    private static final long serialVersionUID = 5293998241705124964L;

    private T data;
    private Integer size;
    private Integer code;
    private String errMsg;

    private Response() {
    }

    /**
     * 不需要任何返回数据
     *
     * @return
     */
    public static Response<Void> ok() {
        Response<Void> resp = new Response<>();
        resp.setCode(200);
        resp.setSize(0);
        return resp;
    }

    /**
     * 请求成功
     * 如果数据不是可迭代类型, 使用这个
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Response<T> ok(T data) {
        Response<T> resp = new Response<>();
        resp.setCode(200);
        resp.setData(data);
        resp.setSize(1);
        return resp;
    }

    /**
     * 请求成功
     * 如果数据是可迭代类型(list, set), 使用这个方法
     *
     * @param data
     * @param size
     * @param <T>
     * @return
     */
    public static <T> Response<T> ok(T data, Integer size) {
        Response<T> resp = new Response<>();
        resp.setCode(200);
        resp.setData(data);
        resp.setSize(size);
        return resp;
    }


    /**
     * 请求失败
     * 不需要自定义信息
     *
     * @param errorInfo
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static Response fail(ErrorInfo errorInfo) {
        Response<Void> resp = new Response<>();
        resp.setCode(errorInfo.getCode());
        resp.setErrMsg(errorInfo.getMessage());
        return resp;
    }

    /**
     * 请求失败
     * 需要自定义信息
     *
     * @param errorInfo
     * @param msg
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static Response fail(ErrorInfo errorInfo, String msg) {
        Response<Void> resp = new Response<>();
        resp.setCode(errorInfo.getCode());
        resp.setErrMsg(StringUtils.defaultIfBlank(msg, errorInfo.getMessage()));
        return resp;
    }
}
