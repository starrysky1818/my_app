package com.baidu.controller;
import com.baidu.base.Response;
import com.baidu.entity.Sleep;
import com.baidu.service.SleepService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("sleep/")
public class SleepController {
    @Autowired
    private SleepService sleepService;

    @ApiOperation("check whether the username and password is right")
    @GetMapping("findTime")
    public Response<List<Sleep>> findTime(@RequestParam("userName") String userName){
        List<Sleep> user = sleepService.findSleepTime(userName);
        return Response.ok(user);
    }
    public Response<Void> inserTime(@RequestParam("userName") String userName){
        List<Sleep> user = sleepService.findSleepTime(userName);
        return Response.ok();
    }
}
