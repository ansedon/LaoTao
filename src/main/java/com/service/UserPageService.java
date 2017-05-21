package com.service;

import com.model.*;
import com.repository.*;
import com.tool.GetDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    @Autowired
    ResCollectRepository resCollectRepository;
    @Autowired
    ArtLikeRepository artLikeRepository;
    @Autowired
    RouTradeRepository rouTradeRepository;
    @Autowired
    ResMarkRepository resMarkRepository;

    //想吃(餐馆收藏)
    public List<RestaurantEntity> restaurantCollection(int userId){
        List<RestaurantEntity> res = new ArrayList<RestaurantEntity>();
        List<ResCollectEntity> collect = resCollectRepository.readByCollectorId(userId);
        for(ResCollectEntity resC : collect) {
            RestaurantEntity r = restaurantRepository.findOne(resC.getCresId());
            //查找用户打分
            ResMarkEntity rm = resMarkRepository.findByMarkerIdAndMresId(userId,resC.getCresId());
            if(rm==null) r.setUserMark(0);
            else
                r.setUserMark(rm.getResMark());
            res.add(r);
        }

        for(RestaurantEntity r : res){
            System.out.println(r.getUserMark());
        }
        return res;
    }

    //收藏(帖子收藏)
    public List<ArticleEntity> articleCollection(int userId) {
        List<ArticleEntity> art = new ArrayList<ArticleEntity>();
        List<ArtLikeEntity> collect = artLikeRepository.readByLikerId(userId);
        for(ArtLikeEntity artL : collect) {
            art.add(articleRepository.findOne(artL.getLikeArtId()));
        }
        return art;
    }

    //购买的路线
    public List<RouteEntity> routeBought(int userId) {
        List<RouteEntity> rou = new ArrayList<RouteEntity>();
        List<RouTradeEntity> bought = rouTradeRepository.readByTradeUserId(userId);
        for (RouTradeEntity rouT : bought) {
            RouteEntity r = routeRepository.findOne(rouT.getTradeRouId());
            RouTradeEntity rt = rouTradeRepository.findByTradeRouIdAndTradeUserId(r.getRouId(),userId);
            r.setTradeStatus(rt.getRouTradeStatus());
            r.setTradeTime(rt.getRouTradeTime());
            rou.add(r);
        }
        return rou;
    }

    //发布的路线
    public List<RouteEntity> routePublish(int userId){
        List<RouteEntity> rou = routeRepository.findByRouUserId(userId);

        for(RouteEntity r :rou){
            System.out.println(r.getRouTitle());
        }
        return rou;
    }

    //餐馆打分
    public void markRestaurant(ResMarkEntity resM){
        //获取当前时间
        GetDate getTime = new GetDate();
        java.sql.Date time = null;
        time = getTime.getNetworkTime("http://www.baidu.com");
        if (time == null)
            time = new java.sql.Date(new java.util.Date().getTime());
        //插入打分记录
        resM.setResMarkTime(time);
        resMarkRepository.saveAndFlush(resM);

        //重新计算餐馆分数
        double newMark = calculateMark(resM.getMresId());

        //更新餐馆分数
        restaurantRepository.updateResScore(newMark, resM.getMresId());
        restaurantRepository.flush();
    }

    //计算餐馆分数
    private double calculateMark(int resId){
        double score = 0.0;
        int base = 1;

        List<ResMarkEntity> resMarkList = resMarkRepository.findByMresId(resId);

        for(ResMarkEntity rM : resMarkList){
            UserEntity user = userRepository.findOne(rM.getMarkerId());
            score += rM.getResMark()*user.getUserLevel();
            base += user.getUserLevel();
        }

        score = score/base;
        NumberFormat nf = NumberFormat.getNumberInstance();
        nf.setMaximumFractionDigits(2);
        score = Double.parseDouble(nf.format(score));
        return score;
    }

    //申请认证
    public void applyForCertification(int userId){
        userRepository.updateUserCertStatus(1,userId);
        userRepository.flush();
    }

    //撤销路线
    public void cancelRoute(int rouId){
        routeRepository.cancelRoute("0",rouId);
        routeRepository.flush();
    }

    //确认交易
    public void confirmTrade(int userId, int routeId,String comment){
        rouTradeRepository.confirmTrade("1",comment, routeId,userId);
        rouTradeRepository.flush();
    }
}
