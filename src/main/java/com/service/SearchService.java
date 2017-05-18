package com.service;

import com.model.ArticleEntity;
import com.model.RestaurantEntity;
import com.model.RouteEntity;
import com.repository.ArticleRepository;
import com.repository.RestaurantRepository;
import com.repository.RouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by yinjiaming on 17/5/13.
 */
@Service
public class SearchService {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    RouteRepository routeRepository;


    public List<ArticleEntity> searchArticleByKey(String key){
        key = "%" + key + "%";
        List<ArticleEntity> artList = articleRepository.findByArtAddrCityLike(key);
        artList.addAll(articleRepository.findByArtAddrProvinceLike(key));
        artList.addAll(articleRepository.findByArtTitleLike(key));

        //去重复
        HashSet h = new HashSet(artList);
        artList.clear();
        artList.addAll(h);
        //排序
        compareArticlesByNumofLikes c = new compareArticlesByNumofLikes();
        Collections.sort(artList, c);

        return artList;
    }

    public List<RestaurantEntity> searchRestaurantByKey(String key) {
        key = "%" + key + "%";
        List<RestaurantEntity> resList = restaurantRepository.findByResAddrCityLike(key);
        resList.addAll(restaurantRepository.findByResNameLike(key));
        resList.addAll(restaurantRepository.findByResStyleLike(key));

        HashSet h = new HashSet(resList);
        resList.clear();
        resList.addAll(h);

        compareRestaurantByScore c = new compareRestaurantByScore();
        Collections.sort(resList, c);

        return  resList;
    }

    public List<RouteEntity> searchRouteByKey(String key){
        key = "%" + key + "%";
        List<RouteEntity> rouList = routeRepository.findByRouAddrCityLike(key);
        rouList.addAll(routeRepository.findByRouAddrProvince(key));
        rouList.addAll(routeRepository.findByRouTitleLike(key));

        HashSet h = new HashSet(rouList);
        rouList.clear();
        rouList.addAll(h);

        List<RouteEntity> newRouList = new ArrayList<RouteEntity>();
        for(RouteEntity rou : rouList) {
            if (Integer.parseInt(rou.getRouStatus()) == 1) {
                newRouList.add(rou);
            }
        }
        return  newRouList;

    }


    private class compareArticlesByNumofLikes implements Comparator<ArticleEntity> {
        public int compare(ArticleEntity a1, ArticleEntity a2) {
            return a2.getArtLikesNum() - a1.getArtLikesNum();
        }
    }

    private class compareRestaurantByScore implements Comparator<RestaurantEntity> {
        public int compare(RestaurantEntity r1, RestaurantEntity r2) {
            double result = r2.getResScore() - r1.getResScore();
            return (int) result;
        }
    }


}