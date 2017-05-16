package com.controller;

import com.service.UserPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by yinjiaming on 17/5/15.
 */
@Controller
public class UserPageController {
    @Autowired
    UserPageService userPageService;




    //loading...
    @RequestMapping(value="UserPage",method = RequestMethod.GET)
    public String loadUserPage(@RequestParam("userId") int userId,ModelMap modelMap){

        return "userPage";
    }


    //充值

    //提现

    //申请认证

    //发布路线

}
