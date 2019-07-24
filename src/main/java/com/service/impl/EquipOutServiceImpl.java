package com.service.impl;

import com.dao.equipoutDao;
import com.entity.equipout;
import com.service.EquipOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EquipOutServiceImpl implements EquipOutService {

    @Autowired
    private equipoutDao equipoutDao;

    @Override
    public int insert(equipout equipout) {
        return equipoutDao.insert(equipout);
    }

    @Override
    public int insertList(List list) {
        return equipoutDao.insertList(list);
    }

    @Override
    public List queryByuser(String username) {
        return equipoutDao.queryByuser(username);
    }

    @Override
    public int backEqui(int id) {
        return equipoutDao.backEqui(id);
    }
}
