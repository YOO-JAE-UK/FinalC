package com.naver.myhome.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Cart;
import com.naver.myhome.domain.Product;
import com.naver.myhome.domain.RecieveAddress;

@Repository
public class Point_Store_DAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getCartCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cart.getCartCount");
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.getListCount");
	}

	public List<Product> getList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.getList",map);
	}

	public int addtoCart(Cart cart) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cart.addtoCart",cart);
	}

	public Cart isProduct(Cart cart) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cart.isProduct", cart);
	}

	public int updatetoCart(Cart cart) {
		// TODO Auto-generated method stub
		return sqlSession.update("cart.updatetoCart",cart);
	}

	public List<Cart> getCartList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cart.getCartList",map);
	}

	public int cartItemDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cart.cartItemDelete",map);
	}

	public int Plus(Cart cart) {
		// TODO Auto-generated method stub
		return sqlSession.update("cart.Plus",cart);
	}

	public List<Cart> list(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cart.List",id);
	}

	public Product getProductInfo(int code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.getProductInfo",code);
	}

	public List<Cart> getCartList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cart.AllCartList",id);
	}

	public List<RecieveAddress> getAddressList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("recieveAddress.getAddressList",id);
	}

	public RecieveAddress getCheckAddressInfo(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recieveAddress.getCheckAddressInfo",id);
	}

	public RecieveAddress isAddress(RecieveAddress addressinfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recieveAddress.isAddress",addressinfo);
	}

	public void updateAddress(RecieveAddress addressinfo) {
		   
		sqlSession.update("recieveAddress.updateAddressFirst",addressinfo);
		sqlSession.update("recieveAddress.updateAddress",addressinfo);
		
	}

	public void addAddress(RecieveAddress addressinfo) {
		
		sqlSession.update("recieveAddress.updateAddressFirst",addressinfo);
		sqlSession.insert("recieveAddress.addAddress",addressinfo);
		
	}

	public void insetAddress(RecieveAddress addressinfo) {
		sqlSession.insert("recieveAddress.insert",addressinfo);
	}

	public void reduceQuantity(String id) {
		sqlSession.update("recieveAddress.reduceQuantity",id);
		
	}

	public void reducePoint(Map<String, Object> map) {
		sqlSession.update("attend_check.updatePoint",map);
		
	}

	public void removeCart(String id) {
		sqlSession.delete("cart.removeCart",id);
	}

	public void reduceProductQuantity(Product product) {
		sqlSession.update("product.reduceProductQuantity",product);
		
	}

	
	

	

}
