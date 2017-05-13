package com.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by ansedon on 2017/5/8.
 */
@Entity
@Table(name = "art_report", schema = "laotao", catalog = "")
@IdClass(ArtReportEntityPK.class)
public class ArtReportEntity {
    private int repUserId;
    private int repArtId;
    private Date repTime;
    private Integer repType;
    private Integer repStatus;
    private UserEntity userByRepUserId;
    private ArticleEntity articleByRepArtId;

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

    @Basic
    @Column(name = "rep_type", nullable = true)
    public Integer getRepType() {
        return repType;
    }

    public void setRepType(Integer repType) {
        this.repType = repType;
    }

    @Basic
    @Column(name = "rep_status", nullable = true)
    public Integer getRepStatus() {
        return repStatus;
    }

    public void setRepStatus(Integer repStatus) {
        this.repStatus = repStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtReportEntity that = (ArtReportEntity) o;

        if (repUserId != that.repUserId) return false;
        if (repArtId != that.repArtId) return false;
        if (repTime != null ? !repTime.equals(that.repTime) : that.repTime != null) return false;
        if (repType != null ? !repType.equals(that.repType) : that.repType != null) return false;
        if (repStatus != null ? !repStatus.equals(that.repStatus) : that.repStatus != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = repUserId;
        result = 31 * result + repArtId;
        result = 31 * result + (repTime != null ? repTime.hashCode() : 0);
        result = 31 * result + (repType != null ? repType.hashCode() : 0);
        result = 31 * result + (repStatus != null ? repStatus.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "rep_user_id", referencedColumnName = "user_id", nullable = false,insertable = false,updatable = false)
    public UserEntity getUserByRepUserId() {
        return userByRepUserId;
    }

    public void setUserByRepUserId(UserEntity userByRepUserId) {
        this.userByRepUserId = userByRepUserId;
    }

    @ManyToOne
    @JoinColumn(name = "rep_art_id", referencedColumnName = "art_id", nullable = false,insertable = false,updatable = false)
    public ArticleEntity getArticleByRepArtId() {
        return articleByRepArtId;
    }

    public void setArticleByRepArtId(ArticleEntity articleByRepArtId) {
        this.articleByRepArtId = articleByRepArtId;
    }
}
