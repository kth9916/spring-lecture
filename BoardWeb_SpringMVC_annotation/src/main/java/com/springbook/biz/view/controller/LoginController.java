package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class LoginController{

	@RequestMapping("login.do")
	public String login(UserVO vo, UserDAO userDAO) {
		System.out.println("�α��� ó�� - Spring MVC ȣ�� - Controller �и�");
		
		System.out.println("id : " + vo.getId());
		System.out.println("password : " + vo.getPassword());
		
		if(userDAO.getUser(vo) != null) {		// DB���� �ش� ���ڵ尡 ����
			return "redirect:getBoardList.do";
		}else {
			return "redirect:login.jsp";
		}
					
		
	
	}

}
