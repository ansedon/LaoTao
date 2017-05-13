package com.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by ansedon on 2017/5/8.
 */
@Entity
@Table(name = "rou_report", schema = "laotao", catalog = "")
@IdClass(RouReportEntityPK.class)
public class RouReportEntity {
    private int userId;
    private int rouId;
    private Date repTime;
    private int repType;
    private int repStatus;
    private UserEntity userByUserId;
    private RouteEntity routeByRouId;

    @Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Id
    @Column(name = "rou_id", nullable = false)
    public int getRouId() {
        return rouId;
    }

    public void setRouId(int rouId) {
        this.rouId = rouId;
    }

    @Basic
    @Column(name = "rep_time", nullable = false)
    public Date getRepTime() {
        return repTime;
    }

    public void setRepTime(Date repTime) {
        this.repTime = repTime;
    }

    @Basic
    @Column(name = "rep_type", nullable = false)
    public int getRepType() {
        return repType;
    }

    public void setRepType(int repType) {
        this.repType = repType;
    }

    @Basic
    @Column(name = "rep_status", nullable = false)
    public int getRepStatus() {
        return repStatus;
    }

    public void setRepStatus(int repStatus) {
        this.repStatus = repStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RouReportEntity that = (RouReportEntity) o;

        if (userId != that.userId) return false;
        if (rouId != that.rouId) return false;
        if (repType != that.repType) return false;
        if (repStatus != that.repStatus) return false;
        if (repTime != null ? !repTime.equals(that.repTime) : that.repTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + rouId;
        result = 31 * result + (repTime != null ? repTime.hashCode() : 0);
        result = 31 * result + repType;
        result = 31 * result + repStatus;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "rou_id", referencedColumnName = "rou_id", nullable = false,insertable = false,updatable = false)
    public RouteEntity getRouteByRouId() {
        return routeByRouId;
    }

    public void setRouteByRouId(RouteEntity routeByRouId) {
        this.routeByRouId = routeByRouId;
    }
}
