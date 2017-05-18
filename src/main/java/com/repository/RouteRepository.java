package com.repository;

import com.model.RouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yinjiaming on 17/5/13.
 */
@Repository
public interface RouteRepository extends JpaRepository<RouteEntity,Integer> {

    List<RouteEntity> readByRouAddrCityOrderByRouPostTimeDesc(String cityName);
    @Query("select r from RouteEntity r where r.rouStatus='1' order by r.rouPostTime Desc")
    List<RouteEntity> getRouteOrderByTime();

    @Query("select r from RouteEntity r where r.rouStatus='1'and r.rouAddrCity=?1 order by r.rouPostTime Desc")
    List<RouteEntity> getRouteByCityOrderByTime(String city);

    List<RouteEntity> findByRouAddrCityLike(String key);

    List<RouteEntity> findByRouTitleLike(String key);

    List<RouteEntity> findByRouAddrProvince(String key);
}