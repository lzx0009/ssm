package com.entity;

import java.io.Serializable;
import java.util.Date;

public class equipout implements Serializable {
    private int id;
    private int equipId;
    private int equipOutNum;
    private Date outDate;
    private String userName;
    private String equipName;
    private int tag;

    public int getTag() {
        return tag;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEquipId() {
        return equipId;
    }

    public void setEquipId(int equipId) {
        this.equipId = equipId;
    }

    public int getEquipOutNum() {
        return equipOutNum;
    }

    public void setEquipOutNum(int equipOutNum) {
        this.equipOutNum = equipOutNum;
    }

    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEquipName() {
        return equipName;
    }

    public void setEquipName(String equipName) {
        this.equipName = equipName;
    }
}
