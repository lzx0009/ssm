package com.dao;

import com.entity.Equipment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EquipmentDao {

    public List queryByPage(@Param("first")int first,@Param("offerSet") int offerSet);

    List queryAll();

    int findCount();

    public Equipment queryById(@Param("id")int id);

    public int add(Equipment equipment);

    public int update(Equipment equipment);

    int updateList(@Param("list") List<Equipment> list);

    public int delete(@Param("id")int id);

    int backEquip(@Param("id") int id,@Param("equiNum") int equiNum);

    int lendequi(Equipment equipment);
}
