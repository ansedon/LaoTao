package com.service;

import com.model.RouTradeEntity;
import com.model.RouteEntity;
import com.repository.RouTradeRepository;
import com.repository.RouteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ansedon on 2017/5/15.
 */
@Service
public class RouteService {
    List<RouteEntity>routeEntityList;
    @Autowired
    RouteRepository routeRepository;
    @Autowired
    RouTradeRepository rouTradeRepository;

    public List<RouteEntity> getRouteOderByTime()
    {
        routeEntityList=routeRepository.getRouteOrderByTime();
        return routeEntityList;
    }

    public List<RouteEntity>getRouByCityOrderByTime(String city)
    {
        routeEntityList=routeRepository.getRouteByCityOrderByTime(city);
        return routeEntityList;
    }

    public boolean checkBuyRoute(int rouId,int user_id){
        RouTradeEntity rouTradeEntity = rouTradeRepository.checkBought(rouId,user_id);
        if(rouTradeEntity != null){
            return true;
        }
        else return false;
    }

    public boolean buyConfirm(RouTradeEntity rouTradeEntity){
        rouTradeRepository.saveAndFlush(rouTradeEntity);
        return true;
    }
}
