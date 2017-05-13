package com.repository;

import com.model.RestaurantEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/8.
 */
@Repository
public interface RestaurantRepository extends JpaRepository<RestaurantEntity,Integer> {

    List<RestaurantEntity> readByresAddrCityOrderByResReferNumDesc(String addrCity);


}
