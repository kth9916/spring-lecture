package com.springbook.biz.view.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;


public class GetBoardListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		System.out.println("�� ��� �˻� ó�� -- Spring MVC ȣ�� - Controller �и� ");
		// 1. ����� �Է� ���� ����(�˻� ����� ���߿� ����)
		// 2. DB ���� ó��
		BoardVO vo = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		// 3. �˻� ����� ���ǿ� �����ϰ� ��� ȭ���� �����Ѵ�.
		HttpSession session = request.getSession();
		session.setAttribute("boardList", boardList);
		
		//4. View ������ 
		ModelAndView mav = new ModelAndView();
		
		 mav.setViewName("getBoardList");
		 	//redirect : viewResolver������ �����ϰ� ������ �����̷�Ʈ 
		 	//forward�� �������� ���� , viewResolver�� �۵��� , prefix + getBoardList + suffix
		 return mav; 
		 
		 

	}
}