package com.baidu.controller;
import com.baidu.base.Response;
import com.baidu.entity.User;
import com.baidu.service.FriendsService;
import com.baidu.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("friends/")
public class FriendsController {
    @Autowired
    private FriendsService friendsService;

    @ApiOperation("check whether the username and password is right")
    @GetMapping("addFriends")
    public Response<User> addFriends(@RequestParam("userName") String userName){
        User user = friendsService.findByUserName(userName);
        return Response.ok(user);
    }
}
