package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/4/26.
 */
public class ResMarkEntityPK implements Serializable {
    private int mresId;
    private int markerId;

    @Column(name = "mres_id", nullable = false)
    @Id
    public int getMresId() {
        return mresId;
    }

    public void setMresId(int mresId) {
        this.mresId = mresId;
    }

    @Column(name = "marker_id", nullable = false)
    @Id
    public int getMarkerId() {
        return markerId;
    }

    public void setMarkerId(int markerId) {
        this.markerId = markerId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResMarkEntityPK that = (ResMarkEntityPK) o;

        if (mresId != that.mresId) return false;
        if (markerId != that.markerId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mresId;
        result = 31 * result + markerId;
        return result;
    }
}
