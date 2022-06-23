package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class GetBoardController{

	@RequestMapping(value = "/getBoard.do")
	public ModelAndView getBoard(BoardVO vo, BoardDAO boardDAO, ModelAndView mav) {
		System.out.println("�� �� ��ȸ ó��- Spring MVC ȣ�� - Controller �и�");
		

		System.out.println("VO�� �ڵ����� �Ѿ���� �� : " + vo.getSeq());
		
		
		mav.addObject("board", boardDAO.getBoard(vo));
		 mav.setViewName("getBoard.jsp");
		 return mav; 
		
		
	}

}