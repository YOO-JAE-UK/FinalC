package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Board_Event;
import com.naver.myhome.domain.Cart;
import com.naver.myhome.domain.Product;
import com.naver.myhome.domain.RecieveAddress;

public interface Point_Store_Service {

	int getCartCount();

	int getListCount();

	List<Product> getList(int page, int limit);

	int addtoCart(Cart cart);

	Cart isProduct(Cart cart);

	int updatetoCart(Cart cart);

	List<Cart> getCartList(String id, int page);

	int cartItemDelete(int ccode, String id);

	int Plus(Cart cart);

	List<Cart> getAmount(String id);

	Product getProductInfo(int code);

	List<Cart> getCartList(String id);

	List<RecieveAddress> getAddressList(String id);

	RecieveAddress getCheckAddressInfo(String id);

	RecieveAddress isAddress( RecieveAddress addressinfo);

	void updateAddress( RecieveAddress addressinfo);

	void addAddress( RecieveAddress addressinfo);

	void insertAddress(RecieveAddress addressinfo);

	void reduceQuantity(String id);

	void reducePoint(String id, int updatePoint);

	void removeCart(String id);

	void reduceProductQuantity(Product product);

	

	

	
	
	
}
