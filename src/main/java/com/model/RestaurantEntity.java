package com.model;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "restaurant", schema = "laotao", catalog = "")
public class RestaurantEntity {
    private int resId;
    private String resName;
    private String resAddrProvince;
    private String resAddrCity;
    private String resAddrStreet;
    private String resStyle;
    private Integer resAverageCost;
    private Double resScore;
    private String resPic;
    private Integer resReferNum;
    private Collection<ReferEntity> refersByResId;
    private Collection<ResCollectEntity> resCollectsByResId;
    private Collection<ResMarkEntity> resMarksByResId;

    @Id
    @Column(name = "res_id", nullable = false)
    public int getResId() {
        return resId;
    }

    public void setResId(int resId) {
        this.resId = resId;
    }

    @Basic
    @Column(name = "res_name", nullable = true, length = 20)
    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName;
    }

    @Basic
    @Column(name = "res_addr_province", nullable = true, length = 20)
    public String getResAddrProvince() {
        return resAddrProvince;
    }

    public void setResAddrProvince(String resAddrProvince) {
        this.resAddrProvince = resAddrProvince;
    }

    @Basic
    @Column(name = "res_addr_city", nullable = true, length = 20)
    public String getResAddrCity() {
        return resAddrCity;
    }

    public void setResAddrCity(String resAddrCity) {
        this.resAddrCity = resAddrCity;
    }

    @Basic
    @Column(name = "res_addr_street", nullable = true, length = 50)
    public String getResAddrStreet() {
        return resAddrStreet;
    }

    public void setResAddrStreet(String resAddrStreet) {
        this.resAddrStreet = resAddrStreet;
    }

    @Basic
    @Column(name = "res_style", nullable = true, length = 20)
    public String getResStyle() {
        return resStyle;
    }

    public void setResStyle(String resStyle) {
        this.resStyle = resStyle;
    }

    @Basic
    @Column(name = "res_average_cost", nullable = true)
    public Integer getResAverageCost() {
        return resAverageCost;
    }

    public void setResAverageCost(Integer resAverageCost) {
        this.resAverageCost = resAverageCost;
    }

    @Basic
    @Column(name = "res_score", nullable = true, precision = 0)
    public Double getResScore() {
        return resScore;
    }

    public void setResScore(Double resScore) {
        this.resScore = resScore;
    }

    @Basic
    @Column(name = "res_pic", nullable = true, length = 100)
    public String getResPic() {
        return resPic;
    }

    public void setResPic(String resPic) {
        this.resPic = resPic;
    }

    @Basic
    @Column(name = "res_refer_num", nullable = true)
    public Integer getResReferNum() {
        return resReferNum;
    }

    public void setResReferNum(Integer resReferNum) {
        this.resReferNum = resReferNum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RestaurantEntity that = (RestaurantEntity) o;

        if (resId != that.resId) return false;
        if (resName != null ? !resName.equals(that.resName) : that.resName != null) return false;
        if (resAddrProvince != null ? !resAddrProvince.equals(that.resAddrProvince) : that.resAddrProvince != null)
            return false;
        if (resAddrCity != null ? !resAddrCity.equals(that.resAddrCity) : that.resAddrCity != null) return false;
        if (resAddrStreet != null ? !resAddrStreet.equals(that.resAddrStreet) : that.resAddrStreet != null)
            return false;
        if (resStyle != null ? !resStyle.equals(that.resStyle) : that.resStyle != null) return false;
        if (resAverageCost != null ? !resAverageCost.equals(that.resAverageCost) : that.resAverageCost != null)
            return false;
        if (resScore != null ? !resScore.equals(that.resScore) : that.resScore != null) return false;
        if (resPic != null ? !resPic.equals(that.resPic) : that.resPic != null) return false;
        if (resReferNum != null ? !resReferNum.equals(that.resReferNum) : that.resReferNum != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = resId;
        result = 31 * result + (resName != null ? resName.hashCode() : 0);
        result = 31 * result + (resAddrProvince != null ? resAddrProvince.hashCode() : 0);
        result = 31 * result + (resAddrCity != null ? resAddrCity.hashCode() : 0);
        result = 31 * result + (resAddrStreet != null ? resAddrStreet.hashCode() : 0);
        result = 31 * result + (resStyle != null ? resStyle.hashCode() : 0);
        result = 31 * result + (resAverageCost != null ? resAverageCost.hashCode() : 0);
        result = 31 * result + (resScore != null ? resScore.hashCode() : 0);
        result = 31 * result + (resPic != null ? resPic.hashCode() : 0);
        result = 31 * result + (resReferNum != null ? resReferNum.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "restaurantByReferResId")
    public Collection<ReferEntity> getRefersByResId() {
        return refersByResId;
    }

    public void setRefersByResId(Collection<ReferEntity> refersByResId) {
        this.refersByResId = refersByResId;
    }

    @OneToMany(mappedBy = "restaurantByCresId")
    public Collection<ResCollectEntity> getResCollectsByResId() {
        return resCollectsByResId;
    }

    public void setResCollectsByResId(Collection<ResCollectEntity> resCollectsByResId) {
        this.resCollectsByResId = resCollectsByResId;
    }

    @OneToMany(mappedBy = "restaurantByMresId")
    public Collection<ResMarkEntity> getResMarksByResId() {
        return resMarksByResId;
    }

    public void setResMarksByResId(Collection<ResMarkEntity> resMarksByResId) {
        this.resMarksByResId = resMarksByResId;
    }
}
