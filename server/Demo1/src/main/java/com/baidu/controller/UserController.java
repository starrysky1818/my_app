package com.baidu.controller;

import com.baidu.base.Response;
import com.baidu.entity.User;
import com.baidu.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("user/")
public class UserController {
    @Autowired
    private UserService service;
    @GetMapping("getUser")
    public List<User> getUser () {
        List<User> list = service.getUser();
        return list;
    }

    @ApiOperation("check whether the username and password is right")
    @GetMapping("logInCheck")
    public Boolean logIn(@RequestParam("userName") String userName,
                                @RequestParam("password") String password){
        System.out.println(userName);
        System.out.println(password);
        User user = service.logIn(userName, password);
        return user != null;
//        return Response.ok();
    }

    @ApiOperation("check whether the username and password is right")
    @GetMapping("signUpCheck")
    public Boolean signUp(@RequestParam("userName") String userName,
                         @RequestParam("password") String password){
        System.out.println(userName);
        System.out.println(password);
        int number = service.signUp(userName, password);
        return number != 0;
    }
}
