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
		System.out.println("글 삭제 처리- Spring MVC 호출 - Controller 분리");
		

		boardDAO.deleteBoard(vo);
		
		return "redirect:getBoardList.do";	// redirect로 이동
		// return "getBoardList.do";		// Forward로 이동
	}

}
