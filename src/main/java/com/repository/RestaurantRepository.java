package com.repository;

import com.model.RestaurantEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

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

}