package com.springbook.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMyBatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;		// mybatis : 1. db, 2. mapper
	
	public void insertUser(UserVO vo) {
		System.out.println("MyBatis insertUser() 호출");
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public void updateUser(UserVO vo) {
		System.out.println("MyBatis updateUser() 호출");
		mybatis.update("UserDAO.updateUser",vo);
	}
	
	public void deleteUser(UserVO vo) {
		System.out.println("MyBatis deleteUser() 호출");
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("MyBatis getUser() 호출");
		
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
		
		
	}
	
	public List<UserVO> getUserList(UserVO vo){
		System.out.println("MyBatis getListUser() 호출");
		return mybatis.selectList("UserDAO.getUserList", vo);
	}
}
