package com.baidu.entity;
import lombok.Data;

@Data
public class User {
    private int id;
    private String userName;
    private String password;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + userName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
