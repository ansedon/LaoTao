package com.controller;

import com.model.*;
import com.repository.ArtCommentRepository;
import com.repository.ArticleRepository;
import com.repository.ReferRepository;
import com.repository.RestaurantRepository;
import com.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tciisxy on 2017/5/7.
 */
@Controller
public class ArticleController {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    ArtCommentRepository artCommentRepository;
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    ArticleService articleService;

    @RequestMapping(value = "/readArticle/{id}", method = RequestMethod.GET)
    public String ShowArticle(@PathVariable("id") Integer articleId, ModelMap modelMap, HttpSession session) {
        //获取帖子
        ArticleEntity articleEntity = articleService.findArticleByArtId(articleId);
        modelMap.addAttribute("article", articleEntity);
        //获取帖子评论
        List<ArtCommentEntity> comList = articleService.findArtComByArtId(articleId);
        modelMap.addAttribute("comList", comList);
        //为帖子增加阅读量
        articleService.updateArtReadNum(articleId);
        //获取当前用户是否点过赞
        UserEntity userEntity = (UserEntity) session.getAttribute("currentUser");
        int userId = 0;
        if (userEntity != null) {
            userId = userEntity.getUserId();
        }
        if (userId != 0) {
            //true--当前用户已点过赞；false--未登录或当前用户没有点过赞
            if (articleService.findArtAgree(userId, articleId) != null) {
                modelMap.addAttribute("ifLike", true);
            } else
                modelMap.addAttribute("ifLike", false);
        }
        //获取当前用户是否收藏
        if (userId != 0) {
            //true--当前用户已收藏；false--未登录或当前用户没有收藏
            if (articleService.findArtLike(userId, articleId) != null) {
                modelMap.addAttribute("ifCollected", true);
            }
            modelMap.addAttribute("ifCollected", false);
        }
        //获取当前用户是否评论过
        if (userId != 0) {
            //true--当前用户已经评论过；false--未登录或当前用户没有评论
            if (articleService.findArtComment(userId, articleId) != null) {
                modelMap.addAttribute("ifComment", true);
            }
            else
                modelMap.addAttribute("ifComment", false);
        }
        //判断是否已举报过
        if (userId != 0) {
            //true--当前用户已举报;false--当前用户尚未举报
            if (articleService.findArtReport(userId, articleId) != null) {
                modelMap.addAttribute("ifReport", true);
            }
            modelMap.addAttribute("ifReport", false);
        }

        //得到帖子提及的餐馆
        List<RestaurantEntity> restaurantEntityList = new ArrayList<RestaurantEntity>();
        List<ReferEntity> referEntityList = articleService.findArtReferRes(articleId);
        for (ReferEntity referEntity : referEntityList) {
            restaurantEntityList.add(referEntity.getRestaurantByReferResId());
        }
        modelMap.addAttribute("restaurant", restaurantEntityList);
        return "viewArticle";
    }
}
