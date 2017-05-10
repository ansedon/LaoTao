package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/4/26.
 */
public class ResCollectEntityPK implements Serializable {
    private int cresId;
    private int collectorId;

    @Column(name = "cres_id", nullable = false)
    @Id
    public int getCresId() {
        return cresId;
    }

    public void setCresId(int cresId) {
        this.cresId = cresId;
    }

    @Column(name = "collector_id", nullable = false)
    @Id
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

        ResCollectEntityPK that = (ResCollectEntityPK) o;

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
}
