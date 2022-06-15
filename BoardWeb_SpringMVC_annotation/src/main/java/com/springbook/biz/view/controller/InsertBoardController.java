package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class InsertBoardController  {
	
	@RequestMapping(value="/insertBoard.do")   // Ŭ���̾�Ʈ ��û 
	public String insertBoard(BoardVO vo, BoardDAO boardDAO)  {
		System.out.println("�� ��� ó��- Spring MVC ������̼� �۵� ");
		
		boardDAO.insertBoard(vo);
		
		return "getBoardList.do";   //Forward ������� �� ������ ���� 
		 
	}

}
