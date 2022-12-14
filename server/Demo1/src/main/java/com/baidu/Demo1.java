package com.baidu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.baidu.mapper")
public class Demo1 {
    public static void main(String[] args) {
        SpringApplication.run(Demo1.class, args);
    }
}
