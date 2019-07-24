package com.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Description implements Serializable {

    private int descid;
    private String descname;
    private String remark;
    private Set<Equipment> equipSet = new HashSet<Equipment>();

    public Description() {
    }

    public Description(int descid, String descname, String remark, Set<Equipment> equipSet) {
        this.descid = descid;
        this.descname = descname;
        this.remark = remark;
        this.equipSet = equipSet;
    }

    public int getDescid() {
        return descid;
    }

    public void setDescid(int descid) {
        this.descid = descid;
    }

    public String getDescname() {
        return descname;
    }

    public void setDescname(String descname) {
        this.descname = descname;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Set<Equipment> getEquipSet() {
        return equipSet;
    }

    public void setEquipSet(Set<Equipment> equipSet) {
        this.equipSet = equipSet;
    }

    @Override
    public String toString() {
        return "DescriptionDao{" +
                "descid=" + descid +
                ", descname='" + descname + '\'' +
                ", remark='" + remark + '\'' +
                ", equipSet=" + equipSet +
                '}';
    }
}
