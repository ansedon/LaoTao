package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/4/26.
 */
public class RouTradeEntityPK implements Serializable {
    private int tradeUserId;
    private int tradeRouId;

    @Column(name = "trade_user_id", nullable = false)
    @Id
    public int getTradeUserId() {
        return tradeUserId;
    }

    public void setTradeUserId(int tradeUserId) {
        this.tradeUserId = tradeUserId;
    }

    @Column(name = "trade_rou_id", nullable = false)
    @Id
    public int getTradeRouId() {
        return tradeRouId;
    }

    public void setTradeRouId(int tradeRouId) {
        this.tradeRouId = tradeRouId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RouTradeEntityPK that = (RouTradeEntityPK) o;

        if (tradeUserId != that.tradeUserId) return false;
        if (tradeRouId != that.tradeRouId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = tradeUserId;
        result = 31 * result + tradeRouId;
        return result;
    }
}
