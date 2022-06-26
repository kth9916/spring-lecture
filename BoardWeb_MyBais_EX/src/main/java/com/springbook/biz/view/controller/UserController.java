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
	
	//1. 로그인 (GET 방식 처리 메소드)
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	//public String loginView(UserVO vo) {
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println("로그인 처리(GET) - Spring MVC 호출 - Controller 통합");
		vo.setId("admin");
		vo.setPassword("1234");
		return "login.jsp";				//forward로 전송시 vo의 변수의 값이 잘 전달 됨.
		//return "redirect:login.jsp";
		
		//Command 객체에 변수의 값을 담아서 View 페이지로 전송할 수 있다.
		//VO 객체의 클래스 이름은 UserVO, ${userVO.id} 뷰페이지에서 출력을 할 수 있다.
	/*
	 @ModelAttribute : Command 객체로 던져지는 객체 이름을 다른 이름으로 변경 (UserVO => user)
	 		view 페이지에서 출력시 : ${user.id}, ${user.password}
	 */
		
	}
	
	//1. 로그인 (POST 방식 처리 메소드)
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		System.out.println("로그인 처리(POST) - Spring MVC 호출 - Controller 통합");

		if(vo.getId() == null || vo.getId().equals("")) {
			throw new NullPointerException("Null 값은 넣을 수 없습니다. ");
			//throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
			//throw new ArithmeticException("0 값으로 나눌 수 없습니다.");
		}		//vo에 id 변수의 값이 넘어오지 않으면 강제로 예외를 발생 시킴.
		
		UserVO user = userService.getUser(vo);
		
		if (user== null) {
			System.out.println("널 리턴");
		}else {
			System.out.println("갑 리턴");
		}
		
		if(user != null) {
			session.setAttribute("userName", user.getName());
			return "getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	//2. 로그아웃 : Logout Controller 통합
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리 - Spring MVC 호출 - Controller 통합");
		
		session.invalidate();
		return "index.jsp";
	}
	
	// 3. 회원가입
		
	@RequestMapping(value="/insertUser.do", method = RequestMethod.POST)
	public String insertUser(UserVO vo) {
		userService.insertUser(vo);
		
		return "login.jsp";
	}
	
	// 4. 회원 정보 수정 사이트 진입
	@RequestMapping("/myPage.do")
	public String updateUserOpen(UserVO vo, Model model) {
		model.addAttribute("user", userService.getUser(vo));
		
		return "myPage.jsp";
	}
	
	// 4. 회원 정보 수정
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("user") UserVO vo) {
		
		System.out.println("id : " + vo.getId() );
		System.out.println("name : " + vo.getName() );
		System.out.println("role : " + vo.getRole() );
		System.out.println("password : " + vo.getPassword() );
		
		
		userService.updateUser(vo);

		return "redirect:index.jsp";
	}
	
	// 5. 회원 탈퇴
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo) {
		userService.deleteUser(vo);
		
		return "index.jsp";
	}
	
	// 6. 회원 페이지
	@RequestMapping("/getUserList.do")
	public String getUserList(UserVO vo, Model model) {
		
		model.addAttribute("userList", userService.getUserList(vo));
		
		return "getUserList.jsp";
	}

	
}
