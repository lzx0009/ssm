package com.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Equipment implements Serializable {

    private Integer id;

    private String equiName;

    private int equiClass;

    private Integer equiNum;

    private String equiCompany;

    private Integer twoUse;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    private String remark;

    private Description description;

    public Equipment(Integer id, String equiName, int equiClass, Integer equiNum, String equiCompany, Integer twoUse, Date endDate, String remark, Description description) {
        this.id = id;
        this.equiName = equiName;
        this.equiClass = equiClass;
        this.equiNum = equiNum;
        this.equiCompany = equiCompany;
        this.twoUse = twoUse;
        this.endDate = endDate;
        this.remark = remark;
        this.description = description;
    }

    public Equipment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEquiName() {
        return equiName;
    }

    public void setEquiName(String equiName) {
        this.equiName = equiName;
    }

    public int getEquiClass() {
        return equiClass;
    }

    public void setEquiClass(int equiClass) {
        this.equiClass = equiClass;
    }

    public Integer getEquiNum() {
        return equiNum;
    }

    public void setEquiNum(Integer equiNum) {
        this.equiNum = equiNum;
    }

    public String getEquiCompany() {
        return equiCompany;
    }

    public void setEquiCompany(String equiCompany) {
        this.equiCompany = equiCompany;
    }

    public Integer getTwoUse() {
        return twoUse;
    }

    public void setTwoUse(Integer twoUse) {
        this.twoUse = twoUse;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Description getDescription() {
        return description;
    }

    public void setDescription(Description description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "id=" + id +
                ", equiName='" + equiName + '\'' +
                ", equipClass=" + equiClass +
                ", equiNum=" + equiNum +
                ", equiCompany='" + equiCompany + '\'' +
                ", twoUse=" + twoUse +
                ", endDate=" + endDate +
                ", remark='" + remark + '\'' +
                ", description=" + description.toString() +
                '}';
    }
}
