package com.controller;

import com.model.*;
import com.repository.RouTradeRepository;
import com.repository.RouteRepository;
import com.repository.UserRepository;
import com.service.RouteService;
import com.service.UserService;
import com.tool.GetDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tciisxy on 2017/5/16.
 */
@Controller
public class RouteController {
    @Autowired
    RouteRepository routeRepository;
    @Autowired
    RouTradeRepository rouTradeRepository;
    @Autowired
    RouteService routeService;
    @Autowired
    UserService userService;
    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/readRoute/{id}", method = RequestMethod.GET)
    public String ShowRoute(@PathVariable("id") Integer routeId, ModelMap modelMap, HttpSession session)
    {
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        RouteEntity routeEntity = routeRepository.findOne(routeId);
        List<RouTradeEntity> rouTradeEntities = rouTradeRepository.findByTradeRouId(routeId);
        boolean IfBought = false;
        boolean IfPoster = false;
        if(user!=null) {
            RouTradeEntity rouTradeEntity = rouTradeRepository.findByTradeRouIdAndTradeUserId(routeId, user.getUserId());
            if (rouTradeEntity != null) {
                IfBought = true;
            }
            if(user.getUserId() == routeEntity.getRouUserId()){
                IfPoster = true;
            }
        }
        modelMap.addAttribute("route",routeEntity);
        modelMap.addAttribute("comment",rouTradeEntities);
        modelMap.addAttribute("IfBought",IfBought);
        modelMap.addAttribute("IfPoster",IfPoster);
        return "viewRoute";
    }
    @RequestMapping(value = "/buyRoute/{id}", method = RequestMethod.GET)
    public String BuyRoute(@PathVariable("id") Integer routeId, ModelMap modelMap, HttpSession session){
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        RouteEntity routeEntity = routeRepository.findOne(routeId);
        modelMap.addAttribute("route",routeEntity);
        modelMap.addAttribute("user",user);
        return "buyRoute";
    }

    @RequestMapping(value = "/buyConfirm/{id}", method = RequestMethod.GET)
    public String BuyConfirm(@PathVariable("id") Integer routeId, ModelMap modelMap, HttpSession session){
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        RouteEntity routeEntity = routeRepository.findOne(routeId);
        modelMap.addAttribute("route",routeEntity);
        modelMap.addAttribute("user",user);
        return "buyConfirm";
    }

    @RequestMapping(value = "/finishBuy/{id}", method = RequestMethod.POST)
    public String rouOp(@PathVariable("id") Integer routeId, ModelMap modelMap, HttpSession session,@RequestParam("comment")String comment){
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        RouteEntity routeEntity = routeRepository.findOne(routeId);
        if (user == null) {
            return "login";
        } else {
            int userId = user.getUserId();
            //检查用户是否已经购买该路线
            boolean msg =  routeService.checkBuyRoute(routeId, userId);
            if (msg == false) {
                RouTradeEntity rouTradeEntity = new RouTradeEntity();
                rouTradeEntity.setTradeRouId(routeId);
                rouTradeEntity.setTradeUserId(userId);
                rouTradeEntity.setRouComment(comment);
                GetDate getTime = new GetDate();
                java.sql.Date reg_time = null;
                reg_time = getTime.getNetworkTime("http://www.baidu.com");
                if(reg_time==null)
                    reg_time= new java.sql.Date(new java.util.Date().getTime());
                rouTradeEntity.setRouTradeTime(reg_time);
                rouTradeEntity.setRouTradeStatus("1");
                routeService.buyConfirm(rouTradeEntity);
                userService.updateMoney(user,routeEntity);
                user = userRepository.findOne(user.getUserId());
                session.setAttribute("currentUser",user);
            }
        }
        return "myPage";
    }
}
