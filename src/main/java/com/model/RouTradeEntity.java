package com.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "rou_trade", schema = "laotao", catalog = "")
@IdClass(RouTradeEntityPK.class)
public class RouTradeEntity {
    private int tradeUserId;
    private int tradeRouId;
    private Date rouTradeTime;
    private String rouTradeStatus;
    private String rouComment;
    private UserEntity userByTradeUserId;
    private RouteEntity routeByTradeRouId;

    @Id
    @Column(name = "trade_user_id", nullable = false)
    public int getTradeUserId() {
        return tradeUserId;
    }

    public void setTradeUserId(int tradeUserId) {
        this.tradeUserId = tradeUserId;
    }

    @Id
    @Column(name = "trade_rou_id", nullable = false)
    public int getTradeRouId() {
        return tradeRouId;
    }

    public void setTradeRouId(int tradeRouId) {
        this.tradeRouId = tradeRouId;
    }

    @Basic
    @Column(name = "rou_trade_time", nullable = true)
    public Date getRouTradeTime() {
        return rouTradeTime;
    }

    public void setRouTradeTime(Date rouTradeTime) {
        this.rouTradeTime = rouTradeTime;
    }

    @Basic
    @Column(name = "rou_trade_status", nullable = true, length = 1)
    public String getRouTradeStatus() {
        return rouTradeStatus;
    }

    public void setRouTradeStatus(String rouTradeStatus) {
        this.rouTradeStatus = rouTradeStatus;
    }

    @Basic
    @Column(name = "rou_comment", nullable = true, length = 200)
    public String getRouComment() {
        return rouComment;
    }

    public void setRouComment(String rouComment) {
        this.rouComment = rouComment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RouTradeEntity that = (RouTradeEntity) o;

        if (tradeUserId != that.tradeUserId) return false;
        if (tradeRouId != that.tradeRouId) return false;
        if (rouTradeTime != null ? !rouTradeTime.equals(that.rouTradeTime) : that.rouTradeTime != null) return false;
        if (rouTradeStatus != null ? !rouTradeStatus.equals(that.rouTradeStatus) : that.rouTradeStatus != null)
            return false;
        if (rouComment != null ? !rouComment.equals(that.rouComment) : that.rouComment != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = tradeUserId;
        result = 31 * result + tradeRouId;
        result = 31 * result + (rouTradeTime != null ? rouTradeTime.hashCode() : 0);
        result = 31 * result + (rouTradeStatus != null ? rouTradeStatus.hashCode() : 0);
        result = 31 * result + (rouComment != null ? rouComment.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "trade_user_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByTradeUserId() {
        return userByTradeUserId;
    }

    public void setUserByTradeUserId(UserEntity userByTradeUserId) {
        this.userByTradeUserId = userByTradeUserId;
    }

    @ManyToOne
    @JoinColumn(name = "trade_rou_id", referencedColumnName = "rou_id", nullable = false,insertable = false,updatable = false)
    public RouteEntity getRouteByTradeRouId() {
        return routeByTradeRouId;
    }

    public void setRouteByTradeRouId(RouteEntity routeByTradeRouId) {
        this.routeByTradeRouId = routeByTradeRouId;
    }
}
