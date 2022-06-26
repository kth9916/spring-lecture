package com.springbook.biz.view.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAOMyBatis;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	//1. �α��� (GET ��� ó�� �޼ҵ�)
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	//public String loginView(UserVO vo) {
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println("�α��� ó��(GET) - Spring MVC ȣ�� - Controller ����");
		vo.setId("admin");
		vo.setPassword("1234");
		return "login.jsp";				//forward�� ���۽� vo�� ������ ���� �� ���� ��.
		//return "redirect:login.jsp";
		
		//Command ��ü�� ������ ���� ��Ƽ� View �������� ������ �� �ִ�.
		//VO ��ü�� Ŭ���� �̸��� UserVO, ${userVO.id} ������������ ����� �� �� �ִ�.
	/*
	 @ModelAttribute : Command ��ü�� �������� ��ü �̸��� �ٸ� �̸����� ���� (UserVO => user)
	 		view ���������� ��½� : ${user.id}, ${user.password}
	 */
		
	}
	
	//1. �α��� (POST ��� ó�� �޼ҵ�)
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		System.out.println("�α��� ó��(POST) - Spring MVC ȣ�� - Controller ����");

		if(vo.getId() == null || vo.getId().equals("")) {
			throw new NullPointerException("Null ���� ���� �� �����ϴ�. ");
			//throw new IllegalArgumentException("���̵�� �ݵ�� �Է��ؾ� �մϴ�.");
			//throw new ArithmeticException("0 ������ ���� �� �����ϴ�.");
		}		//vo�� id ������ ���� �Ѿ���� ������ ������ ���ܸ� �߻� ��Ŵ.
		
		UserVO user = userService.getUser(vo);
		
		if (user== null) {
			System.out.println("�� ����");
		}else {
			System.out.println("�� ����");
		}
		
		if(user != null) {
			session.setAttribute("userName", user.getName());
			return "getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	//2. �α׾ƿ� : Logout Controller ����
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("�α׾ƿ� ó�� - Spring MVC ȣ�� - Controller ����");
		
		session.invalidate();
		return "index.jsp";
	}
	
	// 3. ȸ������
		
	@RequestMapping(value="/insertUser.do", method = RequestMethod.POST)
	public String insertUser(UserVO vo) {
		userService.insertUser(vo);
		
		return "login.jsp";
	}
	
	// 4. ȸ�� ���� ���� ����Ʈ ����
	@RequestMapping("/myPage.do")
	public String updateUserOpen(UserVO vo, Model model) {
		model.addAttribute("user", userService.getUser(vo));
		
		return "myPage.jsp";
	}
	
	// 4. ȸ�� ���� ����
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("user") UserVO vo) {
		
		System.out.println("id : " + vo.getId() );
		System.out.println("name : " + vo.getName() );
		System.out.println("role : " + vo.getRole() );
		System.out.println("password : " + vo.getPassword() );
		
		
		userService.updateUser(vo);

		return "redirect:index.jsp";
	}
	
	// 5. ȸ�� Ż��
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo) {
		userService.deleteUser(vo);
		
		return "index.jsp";
	}
	
	// 6. ȸ�� ������
	@RequestMapping("/getUserList.do")
	public String getUserList(UserVO vo, Model model) {
		
		model.addAttribute("userList", userService.getUserList(vo));
		
		return "getUserList.jsp";
	}

	
}
