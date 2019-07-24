package com.service;

import com.entity.Equipment;
import com.entity.PageBean;

import java.util.List;

public interface EquipmentService {

    PageBean<Equipment> queryByPage(int currPage);
    List<Equipment> queryByPage2();

    Equipment queryById(int id);

    int add(Equipment equipment);

    int update(Equipment equipment);

    int updateList(List<Equipment> list);

    boolean backEquip(int id,int num);

    int delete(int id);

    int borrow(Equipment equipment);
}
