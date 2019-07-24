package com.redis;

import com.dao.EmployeeDao;
import com.entity.Department;
import com.entity.Employee;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class RedisUtilTest {

    RedisTemplate redisTemplate = null;
    @Autowired
    private EmployeeDao employeeDao;

    @Before
    public void before(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("/spring/spring-web.xml","/spring/spring-service.xml","/spring/spring-dao.xml");
        redisTemplate = ac.getBean(RedisTemplate.class);
    }

    @Test
    public void set() {

        List<Department> list = new ArrayList();
        Department department = new Department();
        Department department1 = new Department();
        Department department2 = new Department();
        department.setDid(1);
        department.setDdesc("testdesc");
        department.setDname("test");
        department1.setDid(2);
        department1.setDdesc("testdesc");
        department1.setDname("test");
        department2.setDid(3);
        department2.setDdesc("testdesc");
        department2.setDname("test");
        list.add(department);
        list.add(department1);
        list.add(department2);

//        List<Employee> list = employeeDao.queryByPage(0, 11);
        redisTemplate.opsForList().leftPushAll("equilist1" ,list);
        List<Object> list1 = redisTemplate.opsForList().range("equilist1",0,-1);
        System.out.println(list1.toString());
    }
}