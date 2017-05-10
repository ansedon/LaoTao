package com.model;

import javax.persistence.*;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "art_agree", schema = "laotao", catalog = "")
@IdClass(ArtAgreeEntityPK.class)
public class ArtAgreeEntity {
    private int agreeUserId;
    private int agreeArtId;
    private UserEntity userByAgreeUserId;
    private ArticleEntity articleByAgreeArtId;

    @Id
    @Column(name = "agree_user_id", nullable = false)
    public int getAgreeUserId() {
        return agreeUserId;
    }

    public void setAgreeUserId(int agreeUserId) {
        this.agreeUserId = agreeUserId;
    }

    @Id
    @Column(name = "agree_art_id", nullable = false)
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

        ArtAgreeEntity that = (ArtAgreeEntity) o;

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

    @ManyToOne
    @JoinColumn(name = "agree_user_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByAgreeUserId() {
        return userByAgreeUserId;
    }

    public void setUserByAgreeUserId(UserEntity userByAgreeUserId) {
        this.userByAgreeUserId = userByAgreeUserId;
    }

    @ManyToOne
    @JoinColumn(name = "agree_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false)
    public ArticleEntity getArticleByAgreeArtId() {
        return articleByAgreeArtId;
    }

    public void setArticleByAgreeArtId(ArticleEntity articleByAgreeArtId) {
        this.articleByAgreeArtId = articleByAgreeArtId;
    }
}
