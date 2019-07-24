package com.service.impl;

import com.dao.DescriptionDao;
import com.entity.Description;
import com.service.DescriptionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DescriptionServiceImpl implements DescriptionService {

    static final Logger log = LoggerFactory.getLogger(DescriptionServiceImpl.class);

    @Autowired
    private DescriptionDao descriptionDao;

    @Override
    public List<Description> findAll() {
        return descriptionDao.queryAll();
    }

    @Override
    public int add(Description description) {
        return descriptionDao.add(description);
    }

    @Override
    public int delete(int id) {
        return descriptionDao.delete(id);
    }
}
