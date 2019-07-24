package com.service;

import com.entity.equipout;

import java.util.List;

public interface EquipOutService {

    int insert(equipout equipout);

    int insertList(List list);

    List queryByuser(String username);

    int backEqui(int id);
}
