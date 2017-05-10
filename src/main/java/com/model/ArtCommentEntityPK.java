package com.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ansedon on 2017/4/26.
 */
public class ArtCommentEntityPK implements Serializable {
    private int commentatorId;
    private int comArtId;

    @Column(name = "commentator_id", nullable = false)
    @Id
    public int getCommentatorId() {
        return commentatorId;
    }

    public void setCommentatorId(int commentatorId) {
        this.commentatorId = commentatorId;
    }

    @Column(name = "com_art_id", nullable = false)
    @Id
    public int getComArtId() {
        return comArtId;
    }

    public void setComArtId(int comArtId) {
        this.comArtId = comArtId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtCommentEntityPK that = (ArtCommentEntityPK) o;

        if (commentatorId != that.commentatorId) return false;
        if (comArtId != that.comArtId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commentatorId;
        result = 31 * result + comArtId;
        return result;
    }
}
