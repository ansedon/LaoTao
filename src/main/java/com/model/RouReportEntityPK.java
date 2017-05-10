package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/5/8.
 */
public class RouReportEntityPK implements Serializable {
    private int userId;
    private int rouId;

    @Column(name = "user_id", nullable = false)
    @Id
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Column(name = "rou_id", nullable = false)
    @Id
    public int getRouId() {
        return rouId;
    }

    public void setRouId(int rouId) {
        this.rouId = rouId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RouReportEntityPK that = (RouReportEntityPK) o;

        if (userId != that.userId) return false;
        if (rouId != that.rouId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + rouId;
        return result;
    }
}
