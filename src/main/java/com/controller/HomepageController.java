package com.controller;

import com.repository.ArtCommentRepository;
import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by yinjiaming on 17/5/13.
 */
@Controller
public class HomepageController {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    ArtCommentRepository artCommentRepository;
    @Autowired
    RestaurantRepository restaurantRepository;

}
