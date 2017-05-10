package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/5/8.
 */
public class ArtReportEntityPK implements Serializable {
    private int repUserId;
    private int repArtId;

    @Column(name = "rep_user_id", nullable = false)
    @Id
    public int getRepUserId() {
        return repUserId;
    }

    public void setRepUserId(int repUserId) {
        this.repUserId = repUserId;
    }

    @Column(name = "rep_art_id", nullable = false)
    @Id
    public int getRepArtId() {
        return repArtId;
    }

    public void setRepArtId(int repArtId) {
        this.repArtId = repArtId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtReportEntityPK that = (ArtReportEntityPK) o;

        if (repUserId != that.repUserId) return false;
        if (repArtId != that.repArtId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = repUserId;
        result = 31 * result + repArtId;
        return result;
    }
}
