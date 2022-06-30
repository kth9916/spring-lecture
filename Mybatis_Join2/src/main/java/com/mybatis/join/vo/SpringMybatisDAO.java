package com.mybatis.join.vo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpringMybatisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<SpringJoinVO> selectListJoin (SpringJoinVO vo){
		System.out.println("selectListJoin() �޼ҵ� ȣ��");
		return mybatis.selectList("SJoin.selectListJoin",vo);
	}
}
