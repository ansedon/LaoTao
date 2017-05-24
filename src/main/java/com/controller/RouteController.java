package com.controller;

import com.model.*;
import com.repository.RouTradeRepository;
import com.repository.RouteRepository;
import com.repository.UserRepository;
import com.service.RouteService;
import com.service.UserPageService;
import com.service.UserService;
import com.tool.GetDate;
import com.tool.ImgUtil;
import com.tool.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    UserPageService userPageService;

    @RequestMapping(value = "/readRoute", method = RequestMethod.GET)
    public String ShowRoute(@RequestParam("id") Integer routeId, ModelMap modelMap, HttpSession session)
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

    @RequestMapping(value = "/markRoute/{id}", method = RequestMethod.GET)
    public String BuyConfirm(@PathVariable("id") Integer routeId, ModelMap modelMap, HttpSession session){
        UserEntity user = (UserEntity) session.getAttribute("currentUser");
        RouteEntity routeEntity = routeRepository.findOne(routeId);
        modelMap.addAttribute("route",routeEntity);
        modelMap.addAttribute("user",user);
        return "markRoute";
    }

    @RequestMapping(value = "/routeFinish/{id}", method = RequestMethod.POST)
    public String routeFinish(@PathVariable("id")Integer routeId,@RequestParam("comment")String comment, HttpSession session)
    {
        UserEntity user = (UserEntity)session.getAttribute("currentUser");
        int userId = user.getUserId();
        userPageService.confirmTrade(userId,routeId,comment);
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),5);
        session.setAttribute("currentUser",userEntity);
        return "redirect:/myPage";
    }

    @RequestMapping(value = "/finishBuy/{id}", method = RequestMethod.GET)
    public String rouOp(@PathVariable("id") Integer routeId, ModelMap modelMap, HttpSession session){
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
                GetDate getTime = new GetDate();
                java.sql.Date reg_time = null;
                reg_time = getTime.getNetworkTime("http://www.baidu.com");
                if(reg_time==null)
                    reg_time= new java.sql.Date(new java.util.Date().getTime());
                rouTradeEntity.setRouTradeTime(reg_time);
                rouTradeEntity.setRouTradeStatus("0");
                routeService.buyConfirm(rouTradeEntity);
                userService.updateUser(-1*routeEntity.getRouPrice(),10,user.getUserId());
                //更新经验和等级
                UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
                userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),50);
                session.setAttribute("currentUser",userEntity);
                user = userRepository.findOne(user.getUserId());
                session.setAttribute("currentUser",user);
            }
        }
        return "redirect:/myPage";
    }

    @RequestMapping(value = "/writeRoute", method=RequestMethod.GET)
    public String writeRoute()
    {
        return "writeRoute";
    }


    @RequestMapping(value = "/postRoute", method=RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Object> postRoute(@RequestBody Map<String,String> data,HttpSession session)
    {
        Map<String,String >map=new HashMap<>();
        RouteEntity routeEntity=new RouteEntity();
        routeEntity.setRouAddrProvince(data.get("rouAddrProvince").trim());
        routeEntity.setRouAddrCity(data.get("rouAddrCity").trim());
        routeEntity.setRouPrice(Integer.parseInt(data.get("rouPrice").trim()));
        routeEntity.setRouUserId(Integer.parseInt(data.get("userId").trim()));
        routeEntity.setRouContent(data.get("content").trim());
        GetDate getDate=new GetDate();
        java.sql.Date time=null;
        time=getDate.getNetworkTime("http://www.baidu.com");
        if(time==null)
            time=new java.sql.Date(new java.util.Date().getTime());
        routeEntity.setRouPostTime(time);
        routeEntity.setRouTitle(data.get("rouTitle").trim());
        routeEntity.setRouStatus("0");
        List list = ImgUtil.getImageSrc(data.get("content").trim());
        String picturePath=null;
        if(list.size()>0)picturePath = StringUtil.listToString(list, ',');
        else picturePath="images/1482598428903086856.png";
        routeEntity.setRouTitlePic(picturePath);
        routeRepository.saveAndFlush(routeEntity);
        //更新经验和等级
        UserEntity userEntity=(UserEntity)session.getAttribute("currentUser");
        userEntity=userService.updateUserExpAndLevel(userEntity.getUserId(),50);
        session.setAttribute("currentUser",userEntity);
        map.put("msg","success");
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }


}
