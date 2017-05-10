package com.controller;

import com.model.UserEntity;
import com.service.UserService;
import com.tool.GetDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
/**
 * Created by ansedon on 2017/5/10.
 */
public class RegisterController {
    private UserEntity userEntity=new UserEntity();

    @Autowired
    UserService userService;

    Map<String,String> map;

    @RequestMapping(value = "/register",method=RequestMethod.GET)
    public String index() {
        return "register";
    }

    @RequestMapping(value = "/register/check",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> register(@RequestBody Map<String,String> data)
    {
        userEntity.setUserName(data.get("userName").trim());
        userEntity.setUserTel(data.get("phone").trim());
        userEntity.setUserBpCity(data.get("bCity").trim());
        userEntity.setUserLpCity(data.get("lCity").trim());
        userEntity.setUserPassword(data.get("password").trim());
        map=userService.register(userEntity);
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
