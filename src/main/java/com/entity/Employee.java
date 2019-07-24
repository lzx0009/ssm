package com.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable {

    private Integer eid;

    private Department department;

    private String ename;

    private String sex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date joinDate;

    private String eno;

    private String username;

    private String password;

    private int user_type;

    private int dno;

    private int tag;

    public Employee(Integer tag,Integer eid, Department department, String ename, String sex, Date birthday, Date joinDate, String eno, String username, String password, int user_type, int dno) {
        this.tag = tag;
        this.eid = eid;
        this.department = department;
        this.ename = ename;
        this.sex = sex;
        this.birthday = birthday;
        this.joinDate = joinDate;
        this.eno = eno;
        this.username = username;
        this.password = password;
        this.user_type = user_type;
        this.dno = dno;
    }

//    public Employee(String ename, String sex, Date birthday,String username, String password, int dno) {
//        this.ename = ename;
//        this.sex = sex;
//        this.birthday = birthday;
//        this.username = username;
//        this.password = password;
//        this.dno = dno;
//    }

    public Employee() {
    }

    public int getTag() {
        return tag;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public int getDno() {
        return dno;
    }

    public void setDno(int dno) {
        this.dno = dno;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "eid=" + eid +
//                ", department=" + department.toString() +
                ", ename='" + ename + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", joinDate=" + joinDate +
                ", eno='" + eno + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", user_type=" + user_type +
                ", dno=" + dno +
                '}';
    }
}
