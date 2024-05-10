package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CartDao;
import com.mycompany.javajavajo.dao.CartItemDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dto.Cart;
import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductImgDao productImgDao;

	//권우상 - memno에 해당하는 cart가 있는지 확인 없다면 만들어줌
	public Cart findCart(int memno) {
		Cart cart = cartDao.selectByMemno(memno);
		if(cart == null) {
			cartDao.insert(memno);
			cart = cartDao.selectByMemno(memno);
		}
		return cart;
	}
	
	//권우상 - memno에 해당하는 cartItem 전부를 찾아옴
	public List<CartItem> findCartItems(int memno) {
		List<CartItem> cartItems = cartItemDao.selectByMemno(memno);
		for(CartItem cartItem : cartItems) {
			int prodno = cartItem.getProdno();
			Product product = productDao.selectByProdno(prodno);
			cartItem.setProduct(product);
		}
		
		return cartItems;
	}

	//권우상 - operator에 따라서  memeno와 prodno를 둘다 만족한는 cartitem에 "+"나 "-" 연산을 해준다 
	public int updateCart(int memno, int prodno, String operator) {
		int result = cartItemDao.updateCart(memno, prodno, operator);;
		return result;
	}
	
	//권우상 - memno에 해당하면서 prodnos안에 있는 prodno에 해당하는 cartitem을 전부 삭제한다
	public	int deleteCartItems(int memno, int[] prodnos) {
		int result = cartItemDao.deleteCartItems(memno, prodnos);
		return result;
	}

}
