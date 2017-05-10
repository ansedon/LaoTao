package com.model;

import javax.persistence.*;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "art_like", schema = "laotao", catalog = "")
@IdClass(ArtLikeEntityPK.class)
public class ArtLikeEntity {
    private int likerId;
    private int likeArtId;
    private UserEntity userByLikerId;
    private ArticleEntity articleByLikeArtId;

    @Id
    @Column(name = "liker_id", nullable = false)
    public int getLikerId() {
        return likerId;
    }

    public void setLikerId(int likerId) {
        this.likerId = likerId;
    }

    @Id
    @Column(name = "like_art_id", nullable = false)
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

        ArtLikeEntity that = (ArtLikeEntity) o;

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

    @ManyToOne
    @JoinColumn(name = "liker_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByLikerId() {
        return userByLikerId;
    }

    public void setUserByLikerId(UserEntity userByLikerId) {
        this.userByLikerId = userByLikerId;
    }

    @ManyToOne
    @JoinColumn(name = "like_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false)
    public ArticleEntity getArticleByLikeArtId() {
        return articleByLikeArtId;
    }

    public void setArticleByLikeArtId(ArticleEntity articleByLikeArtId) {
        this.articleByLikeArtId = articleByLikeArtId;
    }
}
