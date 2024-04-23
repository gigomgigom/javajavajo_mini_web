package com.mycompany.javajavajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@RequestMapping("/orderForm")
	public String orderForm() {
		return "order/orderForm";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		return "order/orderDetail";
	}
}
