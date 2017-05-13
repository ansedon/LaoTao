package com.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "art_comment", schema = "laotao", catalog = "")
@IdClass(ArtCommentEntityPK.class)
public class ArtCommentEntity {
    private int commentatorId;
    private int comArtId;
    private Date artComTime;
    private String artComContent;
    private UserEntity userByCommentatorId;
    private ArticleEntity articleByComArtId;

    @Id
    @Column(name = "commentator_id", nullable = false)
    public int getCommentatorId() {
        return commentatorId;
    }

    public void setCommentatorId(int commentatorId) {
        this.commentatorId = commentatorId;
    }

    @Id
    @Column(name = "com_art_id", nullable = false)
    public int getComArtId() {
        return comArtId;
    }

    public void setComArtId(int comArtId) {
        this.comArtId = comArtId;
    }

    @Basic
    @Column(name = "art_com_time", nullable = true)
    public Date getArtComTime() {
        return artComTime;
    }

    public void setArtComTime(Date artComTime) {
        this.artComTime = artComTime;
    }

    @Basic
    @Column(name = "art_com_content", nullable = true, length = 200)
    public String getArtComContent() {
        return artComContent;
    }

    public void setArtComContent(String artComContent) {
        this.artComContent = artComContent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtCommentEntity that = (ArtCommentEntity) o;

        if (commentatorId != that.commentatorId) return false;
        if (comArtId != that.comArtId) return false;
        if (artComTime != null ? !artComTime.equals(that.artComTime) : that.artComTime != null) return false;
        if (artComContent != null ? !artComContent.equals(that.artComContent) : that.artComContent != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commentatorId;
        result = 31 * result + comArtId;
        result = 31 * result + (artComTime != null ? artComTime.hashCode() : 0);
        result = 31 * result + (artComContent != null ? artComContent.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "commentator_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByCommentatorId() {
        return userByCommentatorId;
    }

    public void setUserByCommentatorId(UserEntity userByCommentatorId) {
        this.userByCommentatorId = userByCommentatorId;
    }

    @ManyToOne
    @JoinColumn(name = "com_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false)
    public ArticleEntity getArticleByComArtId() {
        return articleByComArtId;
    }

    public void setArticleByComArtId(ArticleEntity articleByComArtId) {
        this.articleByComArtId = articleByComArtId;
    }
}
