package com.repository;

import com.model.ArtCommentEntity;
import com.model.RestaurantEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/8.
 */
public interface RestaurantRepository extends JpaRepository<RestaurantEntity,Integer> {
}
