package com.dao;

import com.entity.Description;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DescriptionDao {

    List queryAll();

    int add(Description description);

    int delete(@Param("descid") int descid);
}
