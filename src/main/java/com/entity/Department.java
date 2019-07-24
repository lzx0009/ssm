package com.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Department implements Serializable {

    private Integer did;

    private String dname;

    private String ddesc;

    private Set<Employee> employees = new HashSet<Employee>();

    public Department() {
    }

    public Department(Integer did, String dname, String ddesc, Set<Employee> employees) {
        this.did = did;
        this.dname = dname;
        this.ddesc = ddesc;
        this.employees = employees;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDdesc() {
        return ddesc;
    }

    public void setDdesc(String ddesc) {
        this.ddesc = ddesc;
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    @Override
    public String toString() {
        return "Department{" +
                "did=" + did +
                ", dname='" + dname + '\'' +
                ", ddesc='" + ddesc + '\'' +
                ", employees=" + employees +
                '}';
    }
}
