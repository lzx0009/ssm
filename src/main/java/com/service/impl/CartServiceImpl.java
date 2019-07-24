package com.service.impl;

import com.entity.Cart;
import com.entity.Equipment;
import com.service.CartService;
import org.springframework.stereotype.Service;

import java.util.*;


@Service
public class CartServiceImpl implements CartService {
    @Override
    public Cart addGoodsInCart(Equipment equipment, int number,Cart cart) {
        // TODO Auto-generated method stub
        List<Integer> list = new ArrayList();
        HashMap<Equipment,Integer> goods=cart.getGoods();
        Iterator it = goods.keySet().iterator();
        for (Equipment e:goods.keySet()) {
            list.add(e.getId());
        }
//        if(list.contains(equipment.getId()))
        if(goods.containsKey(equipment))
        {
            goods.put(equipment, goods.get(equipment)+number);
        }
        else
        {
            goods.put(equipment, number);
        }
        //重新计算购物车的总金额
        return cart;
    }

    @Override
    public Cart removeGoodsFromCart(Equipment equipment,Cart cart) {
        // TODO Auto-generated method stub
        HashMap<Equipment,Integer> goods=cart.getGoods();
        goods.remove(equipment);
        cart.setGoods(goods);
        //重新计算购物车的总金额
        return cart;
    }

    @Override
    public Cart calTotalPrice(Cart cart) {
        // TODO Auto-generated method stub
//        HashMap<Equipment,Integer> goods=cart.getGoods();
//        double sum = 0.0;
//        Set<Equipment> keys = goods.keySet(); //获得键的集合
//        Iterator<Equipment> it = keys.iterator(); //获得迭代器对象
//        while(it.hasNext())
//        {
//            Equipment i = it.next();
////            sum += Double.parseDouble(i.getPirce())* goods.get(i);
//        }
//        cart.setTotalPrice(sum);
        return cart;
    }

}
