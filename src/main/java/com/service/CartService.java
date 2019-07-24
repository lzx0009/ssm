package com.service;

import com.entity.Cart;
import com.entity.Equipment;

public interface CartService {

    Cart addGoodsInCart(Equipment equipment , int number, Cart cart);

    Cart removeGoodsFromCart(Equipment equipment,Cart cart);

    Cart calTotalPrice(Cart cart);


}
