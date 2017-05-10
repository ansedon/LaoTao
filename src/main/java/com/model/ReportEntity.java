package com.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "report", schema = "laotao", catalog = "")
@IdClass(ReportEntityPK.class)
public class ReportEntity {
    private int repUserId;
    private int repArtId;
    private Date repTime;
    private ArticleEntity articleByRepArtId;
    private ArticleEntity articleByRepArtId_0;

    @Id
    @Column(name = "rep_user_id", nullable = false)
    public int getRepUserId() {
        return repUserId;
    }

    public void setRepUserId(int repUserId) {
        this.repUserId = repUserId;
    }

    @Id
    @Column(name = "rep_art_id", nullable = false)
    public int getRepArtId() {
        return repArtId;
    }

    public void setRepArtId(int repArtId) {
        this.repArtId = repArtId;
    }

    @Basic
    @Column(name = "rep_time", nullable = true)
    public Date getRepTime() {
        return repTime;
    }

    public void setRepTime(Date repTime) {
        this.repTime = repTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReportEntity that = (ReportEntity) o;

        if (repUserId != that.repUserId) return false;
        if (repArtId != that.repArtId) return false;
        if (repTime != null ? !repTime.equals(that.repTime) : that.repTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = repUserId;
        result = 31 * result + repArtId;
        result = 31 * result + (repTime != null ? repTime.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumns(@JoinColumn(name = "rep_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false))
    public ArticleEntity getArticleByRepArtId() {
        return articleByRepArtId;
    }

    public void setArticleByRepArtId(ArticleEntity articleByRepArtId) {
        this.articleByRepArtId = articleByRepArtId;
    }

    @ManyToOne
    @JoinColumn(name = "rep_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false)
    public ArticleEntity getArticleByRepArtId_0() {
        return articleByRepArtId_0;
    }

    public void setArticleByRepArtId_0(ArticleEntity articleByRepArtId_0) {
        this.articleByRepArtId_0 = articleByRepArtId_0;
    }
}
