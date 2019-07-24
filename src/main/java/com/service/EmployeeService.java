package com.service;

import com.entity.Employee;
import com.entity.PageBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface EmployeeService {
    Employee queryByPassword(String username,String password);

    List queryAll();

    Employee findById(int eid);

    int update(Employee employee);

    int add(Employee employee);

    PageBean<Employee> queryByPage(int currPage);

    List queryBlack();

    int deleteEmpl(int id);
}
