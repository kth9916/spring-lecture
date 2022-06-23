package com.springbook.biz.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class DeleteBoardController{

	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO) 
	throws Exception{
		System.out.println("�� ���� ó��- Spring MVC ȣ�� - Controller �и�");
		

		boardDAO.deleteBoard(vo);
		
		return "redirect:getBoardList.do";	// redirect�� �̵�
		// return "getBoardList.do";		// Forward�� �̵�
	}

}
