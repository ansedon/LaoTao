package com.controller;

import com.model.*;
import com.service.RestaurantService;
import com.service.UserPageService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yinjiaming on 17/5/15.
 */
@Controller
public class UserPageController {
    @Autowired
    UserPageService userPageService;
    @Autowired
    RestaurantService restaurantService;
    @Autowired
    UserService userService;

    //loading...
    @RequestMapping(value = "/myPage", method = RequestMethod.GET)
    public String loadUserPage(ModelMap modelMap, HttpSession httpSession) {
        UserEntity user = (UserEntity) httpSession.getAttribute("currentUser");
        int userId = user.getUserId();

        List<RestaurantEntity> restaurantList = userPageService.restaurantCollection(userId);
        List<ArticleEntity> articleList = userPageService.articleCollection(userId);
        List<RouteEntity> routeList = userPageService.routeBought(userId);
        List<RouteEntity> routeList2 = userPageService.routePublish(userId);

        modelMap.addAttribute("retaurantCollection", restaurantList);
        modelMap.addAttribute("articleCollection", articleList);
        modelMap.addAttribute("routeBought", routeList);
        modelMap.addAttribute("routePublish", routeList2);

        httpSession.setAttribute("resSize", restaurantList.size());
        httpSession.setAttribute("artSize", articleList.size());
        httpSession.setAttribute("rouBuySize", routeList.size());
        httpSession.setAttribute("rouPubSize", routeList2.size());

        return "userPage";
    }

    //餐馆打分
    @RequestMapping(value = "/markRestaurant", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> marRestaurant(@RequestBody Map<String, String> data, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        ResMarkEntity resMark = new ResMarkEntity();
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        resMark.setMresId(Integer.parseInt(data.get("resId").trim()));
        resMark.setMarkerId(user.getUserId());
        resMark.setResMark(Integer.parseInt(data.get("mark").trim()));
        userPageService.markRestaurant(resMark);
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),5);
        session.setAttribute("currentUser",userEntity);
        double userMark=restaurantService.findByResId(Integer.parseInt(data.get("resId").trim())).getResScore();
        map.put("msg", "success");
        map.put("userMark", Double.toString(userMark));
        return new ResponseEntity<Object>(map,HttpStatus.OK);
}

    //申请认证
    @RequestMapping(value = "/applyForCertification", method = RequestMethod.GET)
    public String certification(@RequestParam("userId") int userId, ModelMap modelMap,HttpSession session) {
        userPageService.applyForCertification(userId);
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userService.getUserByName(userEntity.getUserName());
        session.setAttribute("currentUser",userEntity);
        return "userPage";
    }

    //撤销路线
    @RequestMapping(value = "/cancelRoute", method = RequestMethod.GET)
    public String cancelRoute(@RequestParam("routeId") int routeId) {
        userPageService.cancelRoute(routeId);
        return "redirect:/myPage";
    }

    //发布路线

    //退出登录
    @RequestMapping(value = "/myPage/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

}