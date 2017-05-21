package com.controller;

import com.model.UserEntity;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by ansedon on 2017/5/21.
 */
@Controller
public class UserController {
    @Autowired
    UserService userService;

    //充值
    @RequestMapping(value = "/chargePage", method = RequestMethod.GET)
    public String goToChargePage(ModelMap modelMap,HttpSession session) {
        modelMap.addAttribute("user",(UserEntity)session.getAttribute("currentUser"));
        return "recharge";
    }
    //充值
    @RequestMapping(value = "/recharge", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> recharge(@RequestBody Map<String,String>data, ModelMap modelMap, HttpSession session) {
        Map<String,String> map=new HashMap<>();
        int money=Integer.parseInt(data.get("money").trim());
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userService.updateUser(money,50,userEntity.getUserId());
        map.put("msg","success") ;
        userEntity=userService.getUserByName(userEntity.getUserName());
        session.setAttribute("currentUser",userEntity);
        map.put("userMoney",Integer.toString(userEntity.getUserMoney()));
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    //提现
    @RequestMapping(value = "/withdrawPage", method = RequestMethod.GET)
    public String goToWithDrawPage(ModelMap modelMap,HttpSession session) {
        modelMap.addAttribute("user",(UserEntity)session.getAttribute("currentUser"));
        return "withdraw";
    }

    //提现
    @RequestMapping(value = "/withdraw", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> withdraw(@RequestBody Map<String,String>data, ModelMap modelMap, HttpSession session) {
        Map<String,String> map=new HashMap<>();
        int coin=Integer.parseInt(data.get("money").trim());
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.getUserByName(userEntity.getUserName());
        if(userEntity.getUserMoney()<coin)
        {
            map.put("msg","余额不足");
            return new ResponseEntity<Object>(map, HttpStatus.OK);
        }
        userService.updateUser(-1*coin,0,userEntity.getUserId());
        map.put("msg","success") ;
        userEntity=userService.getUserByName(userEntity.getUserName());
        session.setAttribute("currentUser",userEntity);
        map.put("userMoney",Integer.toString(userEntity.getUserMoney()));
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
