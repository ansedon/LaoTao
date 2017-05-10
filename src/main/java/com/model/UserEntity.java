package com.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by ansedon on 2017/4/26.
 */
@Entity
@Table(name = "user", schema = "laotao", catalog = "")
public class UserEntity {
    private int userId;
    private String userName;
    private String userTel;
    private String userPassword;
    private Integer userLevel;
    private Integer userExperience;
    private Integer userMoney;
    private String userCertStatus;
    private String userGender;
    private Integer userBirthYear;
    private Date userRegTime;
    private String userBpCity;
    private String userBpProvince;
    private String userLpCity;
    private String userLpProvince;
    private Collection<ArtAgreeEntity> artAgreesByUserId;
    private Collection<ArtCommentEntity> artCommentsByUserId;
    private Collection<ArtLikeEntity> artLikesByUserId;
    private Collection<ArtReportEntity> artReportsByUserId;
    private Collection<ArticleEntity> articlesByUserId;
    private Collection<ArticleEntity> articlesByUserId_0;
    private Collection<ResCollectEntity> resCollectsByUserId;
    private Collection<ResMarkEntity> resMarksByUserId;
    private Collection<RouReportEntity> rouReportsByUserId;
    private Collection<RouTradeEntity> rouTradesByUserId;
    private Collection<RouteEntity> routesByUserId;
    private Collection<RouteEntity> routesByUserId_0;

    @Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "user_name", nullable = true, length = 20)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "user_tel", nullable = true, length = 11)
    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    @Basic
    @Column(name = "user_password", nullable = true, length = 20)
    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Basic
    @Column(name = "user_level", nullable = true)
    public Integer getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(Integer userLevel) {
        this.userLevel = userLevel;
    }

    @Basic
    @Column(name = "user_experience", nullable = true)
    public Integer getUserExperience() {
        return userExperience;
    }

    public void setUserExperience(Integer userExperience) {
        this.userExperience = userExperience;
    }

    @Basic
    @Column(name = "user_money", nullable = true)
    public Integer getUserMoney() {
        return userMoney;
    }

    public void setUserMoney(Integer userMoney) {
        this.userMoney = userMoney;
    }

    @Basic
    @Column(name = "user_cert_status", nullable = true, length = 1)
    public String getUserCertStatus() {
        return userCertStatus;
    }

    public void setUserCertStatus(String userCertStatus) {
        this.userCertStatus = userCertStatus;
    }

    @Basic
    @Column(name = "user_gender", nullable = true, length = 1)
    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    @Basic
    @Column(name = "user_birth_year", nullable = true)
    public Integer getUserBirthYear() {
        return userBirthYear;
    }

    public void setUserBirthYear(Integer userBirthYear) {
        this.userBirthYear = userBirthYear;
    }

    @Basic
    @Column(name = "user_reg_time", nullable = true)
    public Date getUserRegTime() {
        return userRegTime;
    }

    public void setUserRegTime(Date userRegTime) {
        this.userRegTime = userRegTime;
    }

    @Basic
    @Column(name = "user_bp_city", nullable = true, length = 20)
    public String getUserBpCity() {
        return userBpCity;
    }

    public void setUserBpCity(String userBpCity) {
        this.userBpCity = userBpCity;
    }

    @Basic
    @Column(name = "user_bp_province", nullable = true, length = 20)
    public String getUserBpProvince() {
        return userBpProvince;
    }

    public void setUserBpProvince(String userBpProvince) {
        this.userBpProvince = userBpProvince;
    }

    @Basic
    @Column(name = "user_lp_city", nullable = true, length = 20)
    public String getUserLpCity() {
        return userLpCity;
    }

    public void setUserLpCity(String userLpCity) {
        this.userLpCity = userLpCity;
    }

    @Basic
    @Column(name = "user_lp_province", nullable = true, length = 20)
    public String getUserLpProvince() {
        return userLpProvince;
    }

    public void setUserLpProvince(String userLpProvince) {
        this.userLpProvince = userLpProvince;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (userId != that.userId) return false;
        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
        if (userTel != null ? !userTel.equals(that.userTel) : that.userTel != null) return false;
        if (userPassword != null ? !userPassword.equals(that.userPassword) : that.userPassword != null) return false;
        if (userLevel != null ? !userLevel.equals(that.userLevel) : that.userLevel != null) return false;
        if (userExperience != null ? !userExperience.equals(that.userExperience) : that.userExperience != null)
            return false;
        if (userMoney != null ? !userMoney.equals(that.userMoney) : that.userMoney != null) return false;
        if (userCertStatus != null ? !userCertStatus.equals(that.userCertStatus) : that.userCertStatus != null)
            return false;
        if (userGender != null ? !userGender.equals(that.userGender) : that.userGender != null) return false;
        if (userBirthYear != null ? !userBirthYear.equals(that.userBirthYear) : that.userBirthYear != null)
            return false;
        if (userRegTime != null ? !userRegTime.equals(that.userRegTime) : that.userRegTime != null) return false;
        if (userBpCity != null ? !userBpCity.equals(that.userBpCity) : that.userBpCity != null) return false;
        if (userBpProvince != null ? !userBpProvince.equals(that.userBpProvince) : that.userBpProvince != null)
            return false;
        if (userLpCity != null ? !userLpCity.equals(that.userLpCity) : that.userLpCity != null) return false;
        if (userLpProvince != null ? !userLpProvince.equals(that.userLpProvince) : that.userLpProvince != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userTel != null ? userTel.hashCode() : 0);
        result = 31 * result + (userPassword != null ? userPassword.hashCode() : 0);
        result = 31 * result + (userLevel != null ? userLevel.hashCode() : 0);
        result = 31 * result + (userExperience != null ? userExperience.hashCode() : 0);
        result = 31 * result + (userMoney != null ? userMoney.hashCode() : 0);
        result = 31 * result + (userCertStatus != null ? userCertStatus.hashCode() : 0);
        result = 31 * result + (userGender != null ? userGender.hashCode() : 0);
        result = 31 * result + (userBirthYear != null ? userBirthYear.hashCode() : 0);
        result = 31 * result + (userRegTime != null ? userRegTime.hashCode() : 0);
        result = 31 * result + (userBpCity != null ? userBpCity.hashCode() : 0);
        result = 31 * result + (userBpProvince != null ? userBpProvince.hashCode() : 0);
        result = 31 * result + (userLpCity != null ? userLpCity.hashCode() : 0);
        result = 31 * result + (userLpProvince != null ? userLpProvince.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "userByAgreeUserId")
    public Collection<ArtAgreeEntity> getArtAgreesByUserId() {
        return artAgreesByUserId;
    }

    public void setArtAgreesByUserId(Collection<ArtAgreeEntity> artAgreesByUserId) {
        this.artAgreesByUserId = artAgreesByUserId;
    }

    @OneToMany(mappedBy = "userByCommentatorId")
    public Collection<ArtCommentEntity> getArtCommentsByUserId() {
        return artCommentsByUserId;
    }

    public void setArtCommentsByUserId(Collection<ArtCommentEntity> artCommentsByUserId) {
        this.artCommentsByUserId = artCommentsByUserId;
    }

    @OneToMany(mappedBy = "userByLikerId")
    public Collection<ArtLikeEntity> getArtLikesByUserId() {
        return artLikesByUserId;
    }

    public void setArtLikesByUserId(Collection<ArtLikeEntity> artLikesByUserId) {
        this.artLikesByUserId = artLikesByUserId;
    }

    @OneToMany(mappedBy = "userByRepUserId")
    public Collection<ArtReportEntity> getArtReportsByUserId() {
        return artReportsByUserId;
    }

    public void setArtReportsByUserId(Collection<ArtReportEntity> artReportsByUserId) {
        this.artReportsByUserId = artReportsByUserId;
    }

    @OneToMany(mappedBy = "userByArtUserId")
    public Collection<ArticleEntity> getArticlesByUserId() {
        return articlesByUserId;
    }

    public void setArticlesByUserId(Collection<ArticleEntity> articlesByUserId) {
        this.articlesByUserId = articlesByUserId;
    }

    @OneToMany(mappedBy = "userByArtUserId_0")
    public Collection<ArticleEntity> getArticlesByUserId_0() {
        return articlesByUserId_0;
    }

    public void setArticlesByUserId_0(Collection<ArticleEntity> articlesByUserId_0) {
        this.articlesByUserId_0 = articlesByUserId_0;
    }

    @OneToMany(mappedBy = "userByCollectorId")
    public Collection<ResCollectEntity> getResCollectsByUserId() {
        return resCollectsByUserId;
    }

    public void setResCollectsByUserId(Collection<ResCollectEntity> resCollectsByUserId) {
        this.resCollectsByUserId = resCollectsByUserId;
    }

    @OneToMany(mappedBy = "userByMarkerId")
    public Collection<ResMarkEntity> getResMarksByUserId() {
        return resMarksByUserId;
    }

    public void setResMarksByUserId(Collection<ResMarkEntity> resMarksByUserId) {
        this.resMarksByUserId = resMarksByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<RouReportEntity> getRouReportsByUserId() {
        return rouReportsByUserId;
    }

    public void setRouReportsByUserId(Collection<RouReportEntity> rouReportsByUserId) {
        this.rouReportsByUserId = rouReportsByUserId;
    }

    @OneToMany(mappedBy = "userByTradeUserId")
    public Collection<RouTradeEntity> getRouTradesByUserId() {
        return rouTradesByUserId;
    }

    public void setRouTradesByUserId(Collection<RouTradeEntity> rouTradesByUserId) {
        this.rouTradesByUserId = rouTradesByUserId;
    }

    @OneToMany(mappedBy = "userByRouUserId")
    public Collection<RouteEntity> getRoutesByUserId() {
        return routesByUserId;
    }

    public void setRoutesByUserId(Collection<RouteEntity> routesByUserId) {
        this.routesByUserId = routesByUserId;
    }

    @OneToMany(mappedBy = "userByRouUserId_0")
    public Collection<RouteEntity> getRoutesByUserId_0() {
        return routesByUserId_0;
    }

    public void setRoutesByUserId_0(Collection<RouteEntity> routesByUserId_0) {
        this.routesByUserId_0 = routesByUserId_0;
    }
}
