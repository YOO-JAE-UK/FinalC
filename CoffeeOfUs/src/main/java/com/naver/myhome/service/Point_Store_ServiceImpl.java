package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.dao.Point_Store_DAO;
import com.naver.myhome.domain.Board_Event;
import com.naver.myhome.domain.Cart;
import com.naver.myhome.domain.Product;
import com.naver.myhome.domain.RecieveAddress;

@Service
public class Point_Store_ServiceImpl implements Point_Store_Service {
	
	@Autowired
	Point_Store_DAO dao;
	
	@Override
	public int getCartCount() {
		// TODO Auto-generated method stub
		return dao.getCartCount();
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return dao.getListCount();
	}

	@Override
	public List<Product> getList(int page, int limit) {
		Map<String,Object> map= new HashMap<String,Object>();
		int startrow=(page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		
		
		map.put("startrow",startrow);
		map.put("endrow",endrow);
		
		return dao.getList(map);
		
	}

	@Override
	public int addtoCart(Cart cart) {
		// TODO Auto-generated method stub
		return dao.addtoCart(cart);
	}

	@Override
	public Cart isProduct(Cart cart) {
		
		Cart rcart= dao.isProduct(cart);
	 	
		return rcart; 
	}

	@Override
	public int updatetoCart(Cart cart) {
		
		return dao.updatetoCart(cart);
	}

	@Override
	public List<Cart> getCartList(String id, int page) {
		int startrow = 1;
		int endrow=page*3;
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start",startrow);
		map.put("end",endrow);
		map.put("id",id);
		
		
		return dao.getCartList(map);
	}

	@Override
	public int cartItemDelete(int ccode, String id) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ccode",ccode);
		map.put("id",id);
		
		return dao.cartItemDelete(map);
	}

	@Override
	public int Plus(Cart cart) {
		// TODO Auto-generated method stub
		return dao.Plus(cart);
	}

	@Override
	public List<Cart> getAmount(String id) {
		// TODO Auto-generated method stub
		return dao.list(id);
	}

	@Override
	public Product getProductInfo(int code) {
		// TODO Auto-generated method stub
		return dao.getProductInfo(code);
	}

	@Override
	public List<Cart> getCartList(String id) {
		
		return dao.getCartList(id);
	}

	@Override
	public List<RecieveAddress> getAddressList(String id) {
		// TODO Auto-generated method stub
		return dao.getAddressList(id);
	}

	@Override
	public RecieveAddress getCheckAddressInfo(String id) {
		// TODO Auto-generated method stub
		return dao.getCheckAddressInfo(id);
	}

	@Override
	public RecieveAddress isAddress( RecieveAddress addressinfo) {
		// TODO Auto-generated method stub
		
		
		return dao.isAddress(addressinfo);
	}

	@Override
	public void updateAddress( RecieveAddress addressinfo) {
		
		 dao.updateAddress(addressinfo);
		
	}

	@Override
	public void addAddress(RecieveAddress addressinfo) {
		
		 dao.addAddress(addressinfo);
		
	}

	@Override
	public void insertAddress(RecieveAddress addressinfo) {
		dao.insetAddress(addressinfo);
		
	}

	@Override
	public void reduceQuantity(String id) {
		dao.reduceQuantity(id);
		
	}

	@Override
	public void reducePoint(String id, int updatePoint) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("updatePoint",updatePoint);
		map.put("id",id);
		
		dao.reducePoint(map);
	}

	@Override
	public void removeCart(String id) {
		
		dao.removeCart(id);
	}

	@Override
	public void reduceProductQuantity(Product product) {
		
		dao.reduceProductQuantity(product);
	}
		

}
