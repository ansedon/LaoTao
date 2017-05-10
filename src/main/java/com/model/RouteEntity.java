package com.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "route", schema = "laotao", catalog = "")
public class RouteEntity {
    private int rouId;
    private String rouTitle;
    private String rouTitlePic;
    private String rouContent;
    private String rouAddrProvince;
    private String rouAddrCity;
    private Integer rouPrice;
    private Date rouPostTime;
    private String rouStatus;
    private Collection<RouReportEntity> rouReportsByRouId;
    private Collection<RouTradeEntity> rouTradesByRouId;
    private UserEntity userByRouUserId;
    private UserEntity userByRouUserId_0;
    private Integer rouUserId;

    @Id
    @Column(name = "rou_id", nullable = false)
    public int getRouId() {
        return rouId;
    }

    public void setRouId(int rouId) {
        this.rouId = rouId;
    }

    @Basic
    @Column(name = "rou_title", nullable = true, length = 30)
    public String getRouTitle() {
        return rouTitle;
    }

    public void setRouTitle(String rouTitle) {
        this.rouTitle = rouTitle;
    }

    @Basic
    @Column(name = "rou_title_pic", nullable = true, length = 100)
    public String getRouTitlePic() {
        return rouTitlePic;
    }

    public void setRouTitlePic(String rouTitlePic) {
        this.rouTitlePic = rouTitlePic;
    }

    @Basic
    @Column(name = "rou_content", nullable = true, length = -1)
    public String getRouContent() {
        return rouContent;
    }

    public void setRouContent(String rouContent) {
        this.rouContent = rouContent;
    }

    @Basic
    @Column(name = "rou_addr_province", nullable = true, length = 20)
    public String getRouAddrProvince() {
        return rouAddrProvince;
    }

    public void setRouAddrProvince(String rouAddrProvince) {
        this.rouAddrProvince = rouAddrProvince;
    }

    @Basic
    @Column(name = "rou_addr_city", nullable = true, length = 20)
    public String getRouAddrCity() {
        return rouAddrCity;
    }

    public void setRouAddrCity(String rouAddrCity) {
        this.rouAddrCity = rouAddrCity;
    }

    @Basic
    @Column(name = "rou_price", nullable = true)
    public Integer getRouPrice() {
        return rouPrice;
    }

    public void setRouPrice(Integer rouPrice) {
        this.rouPrice = rouPrice;
    }

    @Basic
    @Column(name = "rou_post_time", nullable = true)
    public Date getRouPostTime() {
        return rouPostTime;
    }

    public void setRouPostTime(Date rouPostTime) {
        this.rouPostTime = rouPostTime;
    }

    @Basic
    @Column(name = "rou_status", nullable = true, length = 1)
    public String getRouStatus() {
        return rouStatus;
    }

    public void setRouStatus(String rouStatus) {
        this.rouStatus = rouStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RouteEntity that = (RouteEntity) o;

        if (rouId != that.rouId) return false;
        if (rouTitle != null ? !rouTitle.equals(that.rouTitle) : that.rouTitle != null) return false;
        if (rouTitlePic != null ? !rouTitlePic.equals(that.rouTitlePic) : that.rouTitlePic != null) return false;
        if (rouContent != null ? !rouContent.equals(that.rouContent) : that.rouContent != null) return false;
        if (rouAddrProvince != null ? !rouAddrProvince.equals(that.rouAddrProvince) : that.rouAddrProvince != null)
            return false;
        if (rouAddrCity != null ? !rouAddrCity.equals(that.rouAddrCity) : that.rouAddrCity != null) return false;
        if (rouPrice != null ? !rouPrice.equals(that.rouPrice) : that.rouPrice != null) return false;
        if (rouPostTime != null ? !rouPostTime.equals(that.rouPostTime) : that.rouPostTime != null) return false;
        if (rouStatus != null ? !rouStatus.equals(that.rouStatus) : that.rouStatus != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rouId;
        result = 31 * result + (rouTitle != null ? rouTitle.hashCode() : 0);
        result = 31 * result + (rouTitlePic != null ? rouTitlePic.hashCode() : 0);
        result = 31 * result + (rouContent != null ? rouContent.hashCode() : 0);
        result = 31 * result + (rouAddrProvince != null ? rouAddrProvince.hashCode() : 0);
        result = 31 * result + (rouAddrCity != null ? rouAddrCity.hashCode() : 0);
        result = 31 * result + (rouPrice != null ? rouPrice.hashCode() : 0);
        result = 31 * result + (rouPostTime != null ? rouPostTime.hashCode() : 0);
        result = 31 * result + (rouStatus != null ? rouStatus.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "routeByRouId")
    public Collection<RouReportEntity> getRouReportsByRouId() {
        return rouReportsByRouId;
    }

    public void setRouReportsByRouId(Collection<RouReportEntity> rouReportsByRouId) {
        this.rouReportsByRouId = rouReportsByRouId;
    }

    @OneToMany(mappedBy = "routeByTradeRouId")
    public Collection<RouTradeEntity> getRouTradesByRouId() {
        return rouTradesByRouId;
    }

    public void setRouTradesByRouId(Collection<RouTradeEntity> rouTradesByRouId) {
        this.rouTradesByRouId = rouTradesByRouId;
    }

    @ManyToOne
    @JoinColumn(name = "rou_user_id", referencedColumnName = "user_id",insertable = false,updatable = false)
    public UserEntity getUserByRouUserId() {
        return userByRouUserId;
    }

    public void setUserByRouUserId(UserEntity userByRouUserId) {
        this.userByRouUserId = userByRouUserId;
    }

    @ManyToOne
    @JoinColumn(name = "rou_user_id", referencedColumnName = "user_id",insertable = false,updatable = false)
    public UserEntity getUserByRouUserId_0() {
        return userByRouUserId_0;
    }

    public void setUserByRouUserId_0(UserEntity userByRouUserId_0) {
        this.userByRouUserId_0 = userByRouUserId_0;
    }

    @Basic
    @Column(name = "rou_user_id", nullable = true,insertable = false,updatable = false)
    public Integer getRouUserId() {
        return rouUserId;
    }

    public void setRouUserId(Integer rouUserId) {
        this.rouUserId = rouUserId;
    }
}
