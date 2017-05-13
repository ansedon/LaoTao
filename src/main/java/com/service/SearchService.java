package com.service;

import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yinjiaming on 17/5/13.
 */
@Service
public class SearchService {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    RestaurantRepository restaurantRepository;







}
