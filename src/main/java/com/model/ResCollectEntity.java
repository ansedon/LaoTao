package com.model;

import javax.persistence.*;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "res_collect", schema = "laotao", catalog = "")
@IdClass(ResCollectEntityPK.class)
public class ResCollectEntity {
    private int cresId;
    private int collectorId;
    private RestaurantEntity restaurantByCresId;
    private UserEntity userByCollectorId;

    @Id
    @Column(name = "cres_id", nullable = false)
    public int getCresId() {
        return cresId;
    }

    public void setCresId(int cresId) {
        this.cresId = cresId;
    }

    @Id
    @Column(name = "collector_id", nullable = false)
    public int getCollectorId() {
        return collectorId;
    }

    public void setCollectorId(int collectorId) {
        this.collectorId = collectorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResCollectEntity that = (ResCollectEntity) o;

        if (cresId != that.cresId) return false;
        if (collectorId != that.collectorId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cresId;
        result = 31 * result + collectorId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "cres_id", referencedColumnName = "res_id", nullable = false,insertable = false,updatable = false)
    public RestaurantEntity getRestaurantByCresId() {
        return restaurantByCresId;
    }

    public void setRestaurantByCresId(RestaurantEntity restaurantByCresId) {
        this.restaurantByCresId = restaurantByCresId;
    }

    @ManyToOne
    @JoinColumn(name = "collector_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByCollectorId() {
        return userByCollectorId;
    }

    public void setUserByCollectorId(UserEntity userByCollectorId) {
        this.userByCollectorId = userByCollectorId;
    }
}
