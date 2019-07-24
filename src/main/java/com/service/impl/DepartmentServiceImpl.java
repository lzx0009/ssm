package com.service.impl;

import com.dao.DepartmentDao;
import com.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;
    @Override
    public List queryAll() {
        return departmentDao.queryAll();
    }

    @Override
    public int queryCount() {
        return departmentDao.queryCount();
    }
}
