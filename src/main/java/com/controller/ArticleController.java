package com.controller;

import com.model.ArtCommentEntity;
import com.model.ArticleEntity;
import com.repository.ArtCommentRepository;
import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/Home", method = RequestMethod.GET)
    public String GetAllArticle(ModelMap modelMap)
    {
        List<ArticleEntity> articleList = articleRepository.findAll();
        modelMap.addAttribute("articles",articleList);
        return "homePage";
    }

    @RequestMapping(value = "/readArticle/{id}", method = RequestMethod.GET)
    public String ShowArticle(@PathVariable("id") Integer articleId,ModelMap modelMap)
    {
        ArticleEntity articleEntity = articleRepository.findOne(articleId);
        List<ArtCommentEntity> artCommentList = artCommentRepository.findByComArtIdIs(articleId);
        modelMap.addAttribute("article",articleEntity);
        modelMap.addAttribute("comments",artCommentList);
        return "viewArticle";
    }
}
