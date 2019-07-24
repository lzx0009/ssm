package com.dao;

import com.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
    Employee queryByPassword(@Param("username")String username,@Param("password")String password);

    Employee queryById(@Param("eid")int eid);

    int queryAll();

    List<Employee> queryByPage(@Param("first")int first,@Param("offerset")int offerset);

    int addEmployee(Employee employee);

    int deleteEmployee(@Param("eid") int eid);

    List<Employee> queryBlack();

    int updateEmployee(Employee employee);
}
