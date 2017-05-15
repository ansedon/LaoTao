package com.repository;

import com.model.RouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yinjiaming on 17/5/13.
 */
@Repository
public interface RouteRepository extends JpaRepository<RouteEntity,Integer> {

    List<RouteEntity> readByRouAddrCityOrderByRouPostTimeDesc(String cityName);

    List<RouteEntity> findByRouAddrCityLike(String key);

    List<RouteEntity> findByRouTitleLike(String key);

    List<RouteEntity> findByRouAddrProvince(String key);

}
