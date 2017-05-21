package com.service;

import com.model.ReferEntity;
import com.model.ResCollectEntity;
import com.model.RestaurantEntity;
import com.repository.ReferRepository;
import com.repository.ResCollectRepository;
import com.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    @Autowired
    ReferRepository referRepository;

    List<RestaurantEntity> restaurantEntityList;

    private Map<String, String> map = new HashMap<>();

    public List<RestaurantEntity> findResOnHot() {
        restaurantEntityList = restaurantRepository.getResOrOrderByResScoreDesc();
        return restaurantEntityList;
    }

    public List<RestaurantEntity> findResByCityOrderByResScore(String city) {
        restaurantEntityList = restaurantRepository.getResByCityOrderByResScoreDesc(city);
        return restaurantEntityList;
    }

    public boolean checkCollectRes(int cresId, int collectorId) {
        ResCollectEntity resCollectEntity = resCollectRepository.checkCollect(cresId, collectorId);
        if (resCollectEntity == null)
            return false;
        return true;
    }

    public boolean collectRes(ResCollectEntity resCollectEntity) {
        resCollectRepository.saveAndFlush(resCollectEntity);
        return true;
    }

    //选出没被提及的餐馆
    public List<RestaurantEntity> selectRes(List<RestaurantEntity> restaurantEntityList, int artId) {
        List<ReferEntity> referEntityList = referRepository.findByReferArtIdIs(artId);
        int size=restaurantEntityList.size();
        List<RestaurantEntity>list=new ArrayList<>();
        for(int i=0;i<size;i++)
        {
            for (ReferEntity referEntity:referEntityList
                 ) {
                if(referEntity.getReferResId()==restaurantEntityList.get(i).getResId())
                {
                    list.add(restaurantEntityList.get(i));
                }
            }

        }
        if(list.size()==0)
            return restaurantEntityList;
        for (RestaurantEntity res:list
             ) {
            restaurantEntityList.remove(res);
        }
        return restaurantEntityList;
    }

    public RestaurantEntity findByResId(int resId) {
        return restaurantRepository.findByResId(resId);
    }

    public void updateResReferNum(int changeNum,int resId)
    {
        restaurantRepository.updateReferNum(changeNum,resId);
    }
}
