package com.controller;


import com.model.UserEntity;
import com.repository.UserRepository;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
/**
 * Created by ansedon on 2017/4/25.
 */


public class LoginController {
    @Autowired
    UserService userService;

    UserEntity user;

    Map<String,String> map;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String index() {
        return "login";
    }

    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public ResponseEntity<Object> checkLogin(@RequestBody Map<String, String> data, HttpSession session) {
        String userName = data.get("userName").trim();
        String ps = data.get("password").trim();
        map= userService.checkLogin(userName,ps);
        if(map.get("msg")=="1")
        {
            user=userService.getUserByName(userName);
            user=userService.updateUserExpAndLevel(user.getUserId(),2);
            session.setAttribute("currentUser",user);
        }
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
