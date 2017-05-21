package com.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by ansedon on 2017/5/8.
 */
@Entity
@Table(name = "admin", schema = "laotao", catalog = "")
public class AdminEntity {
    private int adminId;
    private String adminName;
    private String adminPassword;
    private Integer adminTel;
    private Integer adminGender;
    private Date adminRegTime;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_id", nullable = false)
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    @Basic
    @Column(name = "admin_name", nullable = true, length = 45)
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Basic
    @Column(name = "admin_password", nullable = true, length = 8)
    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    @Basic
    @Column(name = "admin_tel", nullable = true)
    public Integer getAdminTel() {
        return adminTel;
    }

    public void setAdminTel(Integer adminTel) {
        this.adminTel = adminTel;
    }

    @Basic
    @Column(name = "admin_gender", nullable = true)
    public Integer getAdminGender() {
        return adminGender;
    }

    public void setAdminGender(Integer adminGender) {
        this.adminGender = adminGender;
    }

    @Basic
    @Column(name = "admin_reg_time", nullable = true)
    public Date getAdminRegTime() {
        return adminRegTime;
    }

    public void setAdminRegTime(Date adminRegTime) {
        this.adminRegTime = adminRegTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminEntity that = (AdminEntity) o;

        if (adminId != that.adminId) return false;
        if (adminName != null ? !adminName.equals(that.adminName) : that.adminName != null) return false;
        if (adminPassword != null ? !adminPassword.equals(that.adminPassword) : that.adminPassword != null)
            return false;
        if (adminTel != null ? !adminTel.equals(that.adminTel) : that.adminTel != null) return false;
        if (adminGender != null ? !adminGender.equals(that.adminGender) : that.adminGender != null) return false;
        if (adminRegTime != null ? !adminRegTime.equals(that.adminRegTime) : that.adminRegTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = adminId;
        result = 31 * result + (adminName != null ? adminName.hashCode() : 0);
        result = 31 * result + (adminPassword != null ? adminPassword.hashCode() : 0);
        result = 31 * result + (adminTel != null ? adminTel.hashCode() : 0);
        result = 31 * result + (adminGender != null ? adminGender.hashCode() : 0);
        result = 31 * result + (adminRegTime != null ? adminRegTime.hashCode() : 0);
        return result;
    }
}
