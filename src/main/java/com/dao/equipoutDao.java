package com.dao;

import com.entity.equipout;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface equipoutDao {

    int insert(equipout equipout);

    int insertList(List<equipout> list);

    List queryByuser(@Param("username") String username);

    int backEqui(@Param("id") int id);
}
