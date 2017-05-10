package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/4/26.
 */
public class ArtAgreeEntityPK implements Serializable {
    private int agreeUserId;
    private int agreeArtId;

    @Column(name = "agree_user_id", nullable = false)
    @Id
    public int getAgreeUserId() {
        return agreeUserId;
    }

    public void setAgreeUserId(int agreeUserId) {
        this.agreeUserId = agreeUserId;
    }

    @Column(name = "agree_art_id", nullable = false)
    @Id
    public int getAgreeArtId() {
        return agreeArtId;
    }

    public void setAgreeArtId(int agreeArtId) {
        this.agreeArtId = agreeArtId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtAgreeEntityPK that = (ArtAgreeEntityPK) o;

        if (agreeUserId != that.agreeUserId) return false;
        if (agreeArtId != that.agreeArtId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = agreeUserId;
        result = 31 * result + agreeArtId;
        return result;
    }
}
