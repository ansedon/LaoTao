package com.controller;

import com.model.ArticleEntity;
import com.model.RestaurantEntity;
import com.model.RouteEntity;
import com.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by yinjiaming on 17/5/15.
 */

@Controller
public class SearchController {
    @Autowired
    SearchService searchService;

    @RequestMapping(value="search",method = RequestMethod.GET)
    public String search(@RequestParam("key") String key, ModelMap modelMap){
        //String key1 = "海";
        List<ArticleEntity> artList = searchService.searchArticleByKey(key);
        List<RestaurantEntity> resList = searchService.searchRestaurantByKey(key);
        List<RouteEntity> rouList = searchService.searchRouteByKey(key);

        modelMap.addAttribute("key",key);
        modelMap.addAttribute("searchArticles",artList);
        modelMap.addAttribute("searchRestaurants",resList);
        modelMap.addAttribute("searchRoutes",rouList);

        return "searchPage";
    }

}
