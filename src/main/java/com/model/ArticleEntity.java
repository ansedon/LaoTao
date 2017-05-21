package com.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "article", schema = "laotao", catalog = "")
public class ArticleEntity {
    private int artId;
    private String artTitle;
    private String artTitlePic;
    private String artContent;
    private String artAddrProvince;
    private String artAddrCity;
    private Integer artAgreeNum;
    private Integer artLikesNum;
    private Integer artReadNum;
    private Date artPostTime;
    private Collection<ArtAgreeEntity> artAgreesByArtId;
    private Collection<ArtCommentEntity> artCommentsByArtId;
    private Collection<ArtLikeEntity> artLikesByArtId;
    private Collection<ArtReportEntity> artReportsByArtId;
    private UserEntity userByArtUserId;
    private UserEntity userByArtUserId_0;
    private Collection<ReferEntity> refersByArtId;
    private Collection<ReportEntity> reportsByArtId;
    private Integer artUserId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "art_id", nullable = false)
    public int getArtId() {
        return artId;
    }

    public void setArtId(int artId) {
        this.artId = artId;
    }

    @Basic
    @Column(name = "art_title", nullable = true, length = 30)
    public String getArtTitle() {
        return artTitle;
    }

    public void setArtTitle(String artTitle) {
        this.artTitle = artTitle;
    }

    @Basic
    @Column(name = "art_title_pic", nullable = true, length = 100)
    public String getArtTitlePic() {
        return artTitlePic;
    }

    public void setArtTitlePic(String artTitlePic) {
        this.artTitlePic = artTitlePic;
    }

    @Basic
    @Column(name = "art_content", nullable = true, length = -1)
    public String getArtContent() {
        return artContent;
    }

    public void setArtContent(String artContent) {
        this.artContent = artContent;
    }

    @Basic
    @Column(name = "art_addr_province", nullable = true, length = 20)
    public String getArtAddrProvince() {
        return artAddrProvince;
    }

    public void setArtAddrProvince(String artAddrProvince) {
        this.artAddrProvince = artAddrProvince;
    }

    @Basic
    @Column(name = "art_addr_city", nullable = true, length = 20)
    public String getArtAddrCity() {
        return artAddrCity;
    }

    public void setArtAddrCity(String artAddrCity) {
        this.artAddrCity = artAddrCity;
    }

    @Basic
    @Column(name = "art_agree_num", nullable = true)
    public Integer getArtAgreeNum() {
        return artAgreeNum;
    }

    public void setArtAgreeNum(Integer artAgreeNum) {
        this.artAgreeNum = artAgreeNum;
    }

    @Basic
    @Column(name = "art_likes_num", nullable = true)
    public Integer getArtLikesNum() {
        return artLikesNum;
    }

    public void setArtLikesNum(Integer artLikesNum) {
        this.artLikesNum = artLikesNum;
    }

    @Basic
    @Column(name = "art_read_num", nullable = true)
    public Integer getArtReadNum() {
        return artReadNum;
    }

    public void setArtReadNum(Integer artReadNum) {
        this.artReadNum = artReadNum;
    }

    @Basic
    @Column(name = "art_post_time", nullable = true)
    public Date getArtPostTime() {
        return artPostTime;
    }

    public void setArtPostTime(Date artPostTime) {
        this.artPostTime = artPostTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArticleEntity that = (ArticleEntity) o;

        if (artId != that.artId) return false;
        if (artTitle != null ? !artTitle.equals(that.artTitle) : that.artTitle != null) return false;
        if (artTitlePic != null ? !artTitlePic.equals(that.artTitlePic) : that.artTitlePic != null) return false;
        if (artContent != null ? !artContent.equals(that.artContent) : that.artContent != null) return false;
        if (artAddrProvince != null ? !artAddrProvince.equals(that.artAddrProvince) : that.artAddrProvince != null)
            return false;
        if (artAddrCity != null ? !artAddrCity.equals(that.artAddrCity) : that.artAddrCity != null) return false;
        if (artAgreeNum != null ? !artAgreeNum.equals(that.artAgreeNum) : that.artAgreeNum != null) return false;
        if (artLikesNum != null ? !artLikesNum.equals(that.artLikesNum) : that.artLikesNum != null) return false;
        if (artReadNum != null ? !artReadNum.equals(that.artReadNum) : that.artReadNum != null) return false;
        if (artPostTime != null ? !artPostTime.equals(that.artPostTime) : that.artPostTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = artId;
        result = 31 * result + (artTitle != null ? artTitle.hashCode() : 0);
        result = 31 * result + (artTitlePic != null ? artTitlePic.hashCode() : 0);
        result = 31 * result + (artContent != null ? artContent.hashCode() : 0);
        result = 31 * result + (artAddrProvince != null ? artAddrProvince.hashCode() : 0);
        result = 31 * result + (artAddrCity != null ? artAddrCity.hashCode() : 0);
        result = 31 * result + (artAgreeNum != null ? artAgreeNum.hashCode() : 0);
        result = 31 * result + (artLikesNum != null ? artLikesNum.hashCode() : 0);
        result = 31 * result + (artReadNum != null ? artReadNum.hashCode() : 0);
        result = 31 * result + (artPostTime != null ? artPostTime.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "articleByAgreeArtId")
    public Collection<ArtAgreeEntity> getArtAgreesByArtId() {
        return artAgreesByArtId;
    }

    public void setArtAgreesByArtId(Collection<ArtAgreeEntity> artAgreesByArtId) {
        this.artAgreesByArtId = artAgreesByArtId;
    }

    @OneToMany(mappedBy = "articleByComArtId")
    public Collection<ArtCommentEntity> getArtCommentsByArtId() {
        return artCommentsByArtId;
    }

    public void setArtCommentsByArtId(Collection<ArtCommentEntity> artCommentsByArtId) {
        this.artCommentsByArtId = artCommentsByArtId;
    }

    @OneToMany(mappedBy = "articleByLikeArtId")
    public Collection<ArtLikeEntity> getArtLikesByArtId() {
        return artLikesByArtId;
    }

    public void setArtLikesByArtId(Collection<ArtLikeEntity> artLikesByArtId) {
        this.artLikesByArtId = artLikesByArtId;
    }

    @OneToMany(mappedBy = "articleByRepArtId")
    public Collection<ArtReportEntity> getArtReportsByArtId() {
        return artReportsByArtId;
    }

    public void setArtReportsByArtId(Collection<ArtReportEntity> artReportsByArtId) {
        this.artReportsByArtId = artReportsByArtId;
    }

    @ManyToOne
    @JoinColumn(name = "art_user_id", referencedColumnName = "user_id",insertable = false,updatable = false)
    public UserEntity getUserByArtUserId() {
        return userByArtUserId;
    }

    public void setUserByArtUserId(UserEntity userByArtUserId) {
        this.userByArtUserId = userByArtUserId;
    }

    @ManyToOne
    @JoinColumn(name = "art_user_id", referencedColumnName = "user_id",insertable = false,updatable = false)
    public UserEntity getUserByArtUserId_0() {
        return userByArtUserId_0;
    }

    public void setUserByArtUserId_0(UserEntity userByArtUserId_0) {
        this.userByArtUserId_0 = userByArtUserId_0;
    }

    @OneToMany(mappedBy = "articleByReferArtId")
    public Collection<ReferEntity> getRefersByArtId() {
        return refersByArtId;
    }

    public void setRefersByArtId(Collection<ReferEntity> refersByArtId) {
        this.refersByArtId = refersByArtId;
    }

    @OneToMany(mappedBy = "articleByRepArtId")
    public Collection<ReportEntity> getReportsByArtId() {
        return reportsByArtId;
    }

    public void setReportsByArtId(Collection<ReportEntity> reportsByArtId) {
        this.reportsByArtId = reportsByArtId;
    }

    @Basic
    @Column(name = "art_user_id", nullable = true)
    public Integer getArtUserId() {
        return artUserId;
    }

    public void setArtUserId(Integer artUserId) {
        this.artUserId = artUserId;
    }
}
