package com.service;

import com.model.ResCollectEntity;
import com.model.RestaurantEntity;
import com.repository.ResCollectRepository;
import com.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ansedon on 2017/5/15.
 */
@Service
public class RestaurantService {
    @Autowired
    RestaurantRepository restaurantRepository;
    @Autowired
    ResCollectRepository resCollectRepository;

    List<RestaurantEntity> restaurantEntityList;

    private Map<String, String> map=new HashMap<>();

    public List<RestaurantEntity>findResOnHot()
    {
        restaurantEntityList=restaurantRepository.getResOrOrderByResScoreDesc();
        return restaurantEntityList;
    }

    public List<RestaurantEntity>findResByCityOrderByResScore(String city)
    {
        restaurantEntityList=restaurantRepository.getResByCityOrderByResScoreDesc(city);
        return restaurantEntityList;
    }

    public boolean checkCollectRes(int cresId,int collectorId)
    {
        ResCollectEntity resCollectEntity=resCollectRepository.checkCollect(cresId,collectorId);
        if(resCollectEntity==null)
           return false;
        return true;
    }

    public boolean collectRes(ResCollectEntity resCollectEntity)
    {
       resCollectRepository.saveAndFlush(resCollectEntity);
       return true;
    }
}
