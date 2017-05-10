package com.controller;


import com.repository.UserRepository;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@Controller
/**
 * Created by ansedon on 2017/4/25.
 */


public class LoginController {
    @Autowired
    UserService userService;

    Map<String,String> map;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "login";
    }

    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public ResponseEntity<Object> checkLogin(@RequestBody Map<String, String> data) {
        String username = data.get("username").trim();
        String ps = data.get("password").trim();
        map= userService.checkLogin(username,ps);
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
