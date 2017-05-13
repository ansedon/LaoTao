package com.controller;

import com.model.ArticleEntity;
import com.model.RestaurantEntity;
import com.model.RouteEntity;
import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import com.repository.RouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by yinjiaming on 17/5/13.
 */
@Controller
public class CityController {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    RouteRepository routeRepository;


    @RequestMapping(value="/HomePage/city",method = RequestMethod.GET)
    public String goToCityPage(ModelMap modelMap){
        return "city";
    }

    @RequestMapping(value="cityPage",method = RequestMethod.GET)
    public String getCityPage(@RequestParam("city") String city, ModelMap modelMap)
    {
        String addrName = city;
        System.out.print(addrName);
        List<ArticleEntity> hotArticles = articleRepository.readByArtAddrCityOrderByArtLikesNumDesc(addrName);
        List<ArticleEntity> newArticles = articleRepository.readByArtAddrCityOrderByArtPostTimeDesc(addrName);
        List<RestaurantEntity> restaurantList = restaurantRepository.readByresAddrCityOrderByResReferNumDesc(addrName);
        List<RouteEntity> routeList = routeRepository.readByRouAddrCityOrderByRouPostTimeDesc(addrName);

        System.out.println(hotArticles.size());
        System.out.println(newArticles.size());
        System.out.println(restaurantList.size());
        System.out.println(routeList.size());

        modelMap.addAttribute("hotArticles",hotArticles);
        modelMap.addAttribute("newArticles",newArticles);
        modelMap.addAttribute("restaurantList",restaurantList);
        modelMap.addAttribute("routeList",routeList);
        modelMap.addAttribute("city",addrName);
        return "cityPage";
    }

}
