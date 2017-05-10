package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/4/26.
 */
public class ArtLikeEntityPK implements Serializable {
    private int likerId;
    private int likeArtId;

    @Column(name = "liker_id", nullable = false)
    @Id
    public int getLikerId() {
        return likerId;
    }

    public void setLikerId(int likerId) {
        this.likerId = likerId;
    }

    @Column(name = "like_art_id", nullable = false)
    @Id
    public int getLikeArtId() {
        return likeArtId;
    }

    public void setLikeArtId(int likeArtId) {
        this.likeArtId = likeArtId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtLikeEntityPK that = (ArtLikeEntityPK) o;

        if (likerId != that.likerId) return false;
        if (likeArtId != that.likeArtId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = likerId;
        result = 31 * result + likeArtId;
        return result;
    }
}
