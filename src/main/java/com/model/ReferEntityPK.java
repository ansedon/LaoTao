package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/5/8.
 */
public class ReferEntityPK implements Serializable {
    private int referResId;
    private int referArtId;

    @Column(name = "refer_res_id", nullable = false)
    @Id
    public int getReferResId() {
        return referResId;
    }

    public void setReferResId(int referResId) {
        this.referResId = referResId;
    }

    @Column(name = "refer_art_id", nullable = false)
    @Id
    public int getReferArtId() {
        return referArtId;
    }

    public void setReferArtId(int referArtId) {
        this.referArtId = referArtId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReferEntityPK that = (ReferEntityPK) o;

        if (referResId != that.referResId) return false;
        if (referArtId != that.referArtId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = referResId;
        result = 31 * result + referArtId;
        return result;
    }
}
