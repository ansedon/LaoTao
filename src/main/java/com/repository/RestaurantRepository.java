package com.repository;

import com.model.RestaurantEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/8.
 */
@Repository
public interface RestaurantRepository extends JpaRepository<RestaurantEntity,Integer> {

    List<RestaurantEntity> readByresAddrCityOrderByResReferNumDesc(String addrCity);

    @Query("select r from RestaurantEntity r order by r.resScore desc")
    List<RestaurantEntity> getResOrOrderByResScoreDesc();

    @Query("select r from RestaurantEntity r where r.resAddrCity=?1 order by r.resScore desc ")
    List<RestaurantEntity> getResByCityOrderByResScoreDesc(String city);

    List<RestaurantEntity> findByResAddrCityLike(String key);

    List<RestaurantEntity> findByResNameLike(String key);

    List<RestaurantEntity> findByResStyleLike(String key);

    RestaurantEntity findByResId(int resId);

    @Transactional
    @Modifying
    @Query("update RestaurantEntity r set r.resReferNum=r.resReferNum+?1 where r.resId=?2")
    void updateReferNum(int changeNum,int resId);


    @Modifying
    @Transactional
    @Query("update RestaurantEntity res set res.resScore=:resScore where res.resId=:resId")
    void updateResScore(@Param("resScore") double resScore, @Param("resId") int resId);
}