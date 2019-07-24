package com.service.impl;

import com.dao.EquipmentDao;
import com.entity.Equipment;
import com.entity.PageBean;
import com.service.EquipmentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@Transactional
public class EquipmentServiceImpl implements EquipmentService {

    static final Logger log = LoggerFactory.getLogger(EmployeeServiceImpl.class);

    @Autowired
    private EquipmentDao equipmentDao;
    @Autowired
    private RedisTemplate redisTemplate;


    @Override
    public PageBean<Equipment> queryByPage(int currPage) {
        PageBean<Equipment> pageBean = new PageBean<Equipment>();
        pageBean.setCurrPage(currPage);
        int pageSize=6;
        pageBean.setPageSize(pageSize);
        int count = equipmentDao.findCount();
        pageBean.setTotalCount(count);
        if (count%pageSize==0){
            pageBean.setTotalPage(count/pageSize);
        }else {
            pageBean.setTotalPage(count/pageSize+1);
        }
        pageBean.setList(equipmentDao.queryByPage((currPage-1)*pageSize, currPage*pageSize));
        return pageBean;
    }

    @Override
    public List<Equipment> queryByPage2() {

        List<Equipment> list = null;
        List equilist = redisTemplate.opsForList().range("equilist", 0, -1);
        if (equilist.size()==0){
            System.out.println("equilist放入redis");
            list = equipmentDao.queryAll();
            redisTemplate.opsForList().leftPushAll("equilist",list);
            redisTemplate.expire("equilist", 300, TimeUnit.SECONDS);
    //        System.out.println(equilist.toString());
            return list;
        } else {
            System.out.println("从redis取出equilist");
            return redisTemplate.opsForList().range("equilist", 0, -1);
        }

    }

    @Override
    public Equipment queryById(int id) {
        Equipment equipment = equipmentDao.queryById(id);
        return equipment;
    }

    @Override
    public int add(Equipment equipment) {
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
//        equipment.setEndDate(format1.parse(equipment.get));
        int add = equipmentDao.add(equipment);
        if (add>0) {
            System.out.println("redis缓存已清空");
            redisTemplate.delete("equilist");
        }
        return add;
    }

    @Override
    public int update(Equipment equipment) {
        int update = equipmentDao.update(equipment);
        if (update>0) {
            redisTemplate.delete("equilist");
        }
        return update;
    }

    @Override
    public int updateList(List<Equipment> list) {
        int updateList = equipmentDao.updateList(list);
        log.info("service层方法，共提交："+list.size()+"：条记录，更新成功："+updateList+"：条！！");

        if (updateList>0) {
            redisTemplate.delete("equilist");
        }
        return updateList;
    }

    @Override
    public boolean backEquip(int id, int num) {

        int i = equipmentDao.backEquip(id, num);
        if (i==1){
            redisTemplate.delete("equilist");
            return true;
        }else{
            return false;
        }
    }

    @Override
    public int delete(int id) {
        int delete = equipmentDao.delete(id);
        if (delete>0){
            redisTemplate.delete("equilist");
        }
        return delete;
    }

    @Override
    public int borrow(Equipment equipment) {

        int lendequi = equipmentDao.lendequi(equipment);
        if (lendequi>0){
            redisTemplate.delete("equilist");
        }
        return lendequi;
    }
}
