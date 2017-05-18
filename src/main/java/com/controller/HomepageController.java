package com.controller;

import com.model.ArticleEntity;
import com.model.RestaurantEntity;
import com.model.RouteEntity;
import com.model.UserEntity;
import com.repository.ArtCommentRepository;
import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import com.service.ArticleService;
import com.service.RestaurantService;
import com.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by ansedon on 2017/5/11.
 */
@Controller
public class HomePageController {
    @Autowired
    ArticleService articleService;
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    ArtCommentRepository artCommentRepository;
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    RestaurantService restaurantService;
    @Autowired
    RouteService routeService;

    @RequestMapping(value="/",method = RequestMethod.GET)
    public String start(ModelMap modelMap, HttpSession session)
    {
        UserEntity user= (UserEntity) session.getAttribute("currentUserName");
        //用户已登录，个性化推荐
        if(user!=null)
        {
            String city = user.getUserLpCity();
            if(city != null && !"".equals(city))
            {
                List<ArticleEntity> article;
                List<RouteEntity> route;
                List<RestaurantEntity> res;
                article = articleService.findArticleByCityOrderByReadNum(city);
                modelMap.addAttribute("article",article);
                route=routeService.getRouByCityOrderByTime(city);
                modelMap.addAttribute("route",route);
                res=restaurantService.findResByCityOrderByResScore(city);
                modelMap.addAttribute("res",res);
                session.setAttribute("num",article.size());
            }
        }
        else
        {
            //寻找最热美食帖
            List<ArticleEntity> articleList = articleService.findArticleOnHot();
            modelMap.addAttribute("article",articleList);
            //寻找最热餐馆
            List<RestaurantEntity> restaurantEntityList=restaurantService.findResOnHot();
            modelMap.addAttribute("res",restaurantEntityList);
            //路线推荐
            List<RouteEntity>routeEntityList=routeService.getRouteOderByTime();
            modelMap.addAttribute("route",routeEntityList);
            session.setAttribute("num",articleList.size());
        }
        return "homePage";
    }
}
