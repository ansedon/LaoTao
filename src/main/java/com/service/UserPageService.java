package com.service;

import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import com.repository.RouteRepository;
import com.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yinjiaming on 17/5/15.
 */
@Service
public class UserPageService {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    RouteRepository routeRepository;
    @Autowired
    UserRepository userRepository;
    //@Autowired



    //想吃(餐馆收藏)


    //收藏(帖子收藏)


    //购买(路线)


    //发布(路线)


    //餐馆打分

    //充值

    //提现

    //申请认证




}