package com.model;

import javax.persistence.*;

/**
 * Created by yinjiaming on 17/6/18.
 */
@Entity
@Table(name = "dish", schema = "laotao", catalog = "")
public class DishEntity {
    private int dishId;
    private String dishName;
    private int restaurantId;
    private Double dishPrice;
    private String dishPic;

    @Id
    @Column(name = "dish_id", nullable = false)
    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    @Basic
    @Column(name = "dish_name", nullable = false, length = 45)
    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    @Basic
    @Column(name = "restaurant_id", nullable = false)
    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    @Basic
    @Column(name = "dish_price", nullable = true, length = 45)
    public Double getDishPrice() {
        return dishPrice;
    }

    public void setDishPrice(Double dishPrice) {
        this.dishPrice = dishPrice;
    }

    @Basic
    @Column(name = "dish_pic", nullable = true, length = 45)
    public String getDishPic() {
        return dishPic;
    }

    public void setDishPic(String dishPic) {
        this.dishPic = dishPic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DishEntity that = (DishEntity) o;

        if (dishId != that.dishId) return false;
        if (restaurantId != that.restaurantId) return false;
        if (dishPrice!=that.dishPrice) return false;
        if (dishName != null ? !dishName.equals(that.dishName) : that.dishName != null) return false;
        if (dishPic != null ? !dishPic.equals(that.dishPic) : that.dishPic != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = dishId;
        result = 31 * result + (dishName != null ? dishName.hashCode() : 0);
        result = 31 * result + restaurantId;
        result = 31 * result + (dishPrice != null ? dishPrice.hashCode() : 0);
        result = 31 * result + (dishPic != null ? dishPic.hashCode() : 0);
        return result;
    }
}
