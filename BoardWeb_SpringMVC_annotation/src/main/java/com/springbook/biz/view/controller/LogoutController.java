package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class LogoutController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("�α� �ƿ� ó�� - Spring MVC ȣ�� - Controller �и�");
		
		// 1. �������� �����? ���� ��ü�� ���� �����Ѵ�.
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 2. ���� ������, ���� ȭ������ �̵��Ѵ�.
		ModelAndView mav = new ModelAndView();
		
		 mav.setViewName("redirect:login.jsp");
		 return mav; 
		 
		
	
	}

}
