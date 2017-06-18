package com.repository;

import com.model.DishEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by yinjiaming on 17/6/17.
 */
@Repository
public interface DishRepository extends JpaRepository<DishEntity,Integer> {
    public List<DishEntity> findByRestaurantId(int resId);
    public DishEntity findByDishId(int dishId);

    @Modifying
    @Transactional
    @Query("update DishEntity de set de.dishName=:dishName, de.dishPrice=:dishPrice, de.dishPic=:dishPic where de.dishId=:dishId")
    public void updateDish(@Param("dishName") String dishname, @Param("dishPrice") Double dishprice,
                           @Param("dishPic") String dishPic,@Param("dishId") int dishId);
}
