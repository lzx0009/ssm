package com.service;

import com.entity.Description;

import java.util.List;

public interface DescriptionService {

    List<Description> findAll();

    int add(Description description);

    int delete(int id);
}
