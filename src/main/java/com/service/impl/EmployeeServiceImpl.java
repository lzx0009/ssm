package com.service.impl;

import com.dao.EmployeeDao;
import com.entity.Employee;
import com.entity.PageBean;
import com.service.EmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public Employee queryByPassword(String username, String password) {
        Employee employee = employeeDao.queryByPassword(username, password);
        if (employee!=null){
            logger.debug("service层信息，当前用户："+employee.getEname());
        }
        return employee;
    }

    @Override
    public List queryAll() {
        return null;
    }

    @Override
    public Employee findById(int eid) {
        return employeeDao.queryById(eid);
    }

    @Override
    public int update(Employee employee) {
        return employeeDao.updateEmployee(employee);
    }

    @Override
    public int add(Employee employee) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ; //使用了默认的格式创建了一个日期格式化对象。
        String time = dateFormat.format(employee.getBirthday());
        employee.setEno(time+String.valueOf((int)((Math.random()+1)*100)) );
        employee.setUser_type(0);
        employee.setTag(1);
        employee.setJoinDate(new Date());
        System.out.println("用户注册信息："+employee.toString());
        return employeeDao.addEmployee(employee);
    }

    @Override
    public PageBean<Employee> queryByPage(int currPage) {
        PageBean<Employee> pageBean = new PageBean<Employee>();
        pageBean.setCurrPage(currPage);
        int pageSize=6;
        pageBean.setPageSize(pageSize);
        int count = employeeDao.queryAll();
        pageBean.setTotalCount(count);
        if (count%pageSize==0){
            pageBean.setTotalPage(count/pageSize);
        }else {
            pageBean.setTotalPage(count/pageSize+1);
        }
        pageBean.setList(employeeDao.queryByPage((currPage-1)*pageSize, currPage*pageSize));
        return pageBean;
    }

    @Override
    public List queryBlack() {

        List<Employee> employees = employeeDao.queryBlack();
        return employees;
    }

    @Override
    public int deleteEmpl(int id) {

        int i = employeeDao.deleteEmployee(id);
        return i;
    }
}
