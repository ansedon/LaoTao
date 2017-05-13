package com.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "res_mark", schema = "laotao", catalog = "")
@IdClass(ResMarkEntityPK.class)
public class ResMarkEntity {
    private int mresId;
    private int markerId;
    private Date resMarkTime;
    private Integer resMark;
    private RestaurantEntity restaurantByMresId;
    private UserEntity userByMarkerId;

    @Id
    @Column(name = "mres_id", nullable = false)
    public int getMresId() {
        return mresId;
    }

    public void setMresId(int mresId) {
        this.mresId = mresId;
    }

    @Id
    @Column(name = "marker_id", nullable = false)
    public int getMarkerId() {
        return markerId;
    }

    public void setMarkerId(int markerId) {
        this.markerId = markerId;
    }

    @Basic
    @Column(name = "res_mark_time", nullable = true)
    public Date getResMarkTime() {
        return resMarkTime;
    }

    public void setResMarkTime(Date resMarkTime) {
        this.resMarkTime = resMarkTime;
    }

    @Basic
    @Column(name = "res_mark", nullable = true)
    public Integer getResMark() {
        return resMark;
    }

    public void setResMark(Integer resMark) {
        this.resMark = resMark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResMarkEntity that = (ResMarkEntity) o;

        if (mresId != that.mresId) return false;
        if (markerId != that.markerId) return false;
        if (resMarkTime != null ? !resMarkTime.equals(that.resMarkTime) : that.resMarkTime != null) return false;
        if (resMark != null ? !resMark.equals(that.resMark) : that.resMark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mresId;
        result = 31 * result + markerId;
        result = 31 * result + (resMarkTime != null ? resMarkTime.hashCode() : 0);
        result = 31 * result + (resMark != null ? resMark.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "mres_id", referencedColumnName = "res_id", nullable = false,insertable = false,updatable = false)
    public RestaurantEntity getRestaurantByMresId() {
        return restaurantByMresId;
    }

    public void setRestaurantByMresId(RestaurantEntity restaurantByMresId) {
        this.restaurantByMresId = restaurantByMresId;
    }

    @ManyToOne
    @JoinColumn(name = "marker_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByMarkerId() {
        return userByMarkerId;
    }

    public void setUserByMarkerId(UserEntity userByMarkerId) {
        this.userByMarkerId = userByMarkerId;
    }
}
