package com.mybatis.join.vo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpringJoinController {

	@Autowired
	private SpringMybatisDAO springMybatisDAO;
	
	@RequestMapping("sJoinList.do")
	public String selectList(SpringJoinVO vo, Model model) {
		System.out.println("��Ʈ�ѷ� ȣ�� ���� sJoinList.do");
		List<SpringJoinVO> sjoinList = springMybatisDAO.selectListJoin(vo);
		
		System.out.println("mybatis�� ���� list��ü���� ����");
		SpringJoinVO sjoinVO = sjoinList.get(0);
		SpringJoinVO sjoinVO1 = sjoinList.get(1);
		SpringJoinVO sjoinVO2 = sjoinList.get(2);
		
		String a = sjoinVO.toString();
		System.out.println(a);
		System.out.println(sjoinVO1.toString());
		System.out.println(sjoinVO2.toString());
		
		model.addAttribute("sjoinList",sjoinList);
		
		return "springJoinList.jsp";
	}
}
