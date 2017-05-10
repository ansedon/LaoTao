package com.model;

import javax.persistence.*;

/**
 * Created by ansedon on 2017/5/8.
 */
@Entity
@Table(name = "refer", schema = "laotao", catalog = "")
@IdClass(ReferEntityPK.class)
public class ReferEntity {
    private int referResId;
    private int referArtId;
    private ArticleEntity articleByReferArtId;
    private RestaurantEntity restaurantByReferResId;

    @Id
    @Column(name = "refer_res_id", nullable = false)
    public int getReferResId() {
        return referResId;
    }

    public void setReferResId(int referResId) {
        this.referResId = referResId;
    }

    @Id
    @Column(name = "refer_art_id", nullable = false)
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

        ReferEntity that = (ReferEntity) o;

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

    @ManyToOne
    @JoinColumn(name = "refer_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false)
    public ArticleEntity getArticleByReferArtId() {
        return articleByReferArtId;
    }

    public void setArticleByReferArtId(ArticleEntity articleByReferArtId) {
        this.articleByReferArtId = articleByReferArtId;
    }

    @ManyToOne
    @JoinColumn(name = "refer_res_id", referencedColumnName = "res_id", nullable = false,insertable = false,updatable = false)
    public RestaurantEntity getRestaurantByReferResId() {
        return restaurantByReferResId;
    }

    public void setRestaurantByReferResId(RestaurantEntity restaurantByReferResId) {
        this.restaurantByReferResId = restaurantByReferResId;
    }
}
