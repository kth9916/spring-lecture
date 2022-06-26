package com.springbook.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMyBatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser",vo);
	}
	
	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("MyBatis getUser() »£√‚");
		
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
		
		
	}
	
	public List<UserVO> getUserList(UserVO vo){
		return mybatis.selectList("UserDAO.getUserList", vo);
	}
}
