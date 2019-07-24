package com.entity;

import java.io.Serializable;
import java.util.HashMap;


//购物车类
public class Cart implements Serializable{

	//购买商品的集合
	private HashMap<Equipment,Integer> goods;
	
	//购物车的总金额
	private double totalPrice;

	//构造方法
	public Cart()
	{
		goods = new HashMap<Equipment,Integer>();
		totalPrice = 0.0;
	}
	
	public Cart(HashMap<Equipment, Integer> goods, double totalPrice) {
		super();
		this.goods = goods;
		this.totalPrice = totalPrice;
	}

	public HashMap<Equipment, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<Equipment, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	//添加商品进购物车的方法
	public boolean addGoodsInCart(Equipment item ,int number)
	{
		if(goods.containsKey(item))
		{
			goods.put(item, goods.get(item)+number);
		}
		else
		{
			goods.put(item, number);	
		}
		return true;
	}
	
	//删除商品的方法
	public boolean removeGoodsFromCart(Equipment item)
	{
		goods.remove(item);
		return true;
	}

	@Override
	public String toString() {
		return "Cart{" +
				"goods=" + goods.toString() +
				", totalPrice=" + totalPrice +
				'}';
	}

}
