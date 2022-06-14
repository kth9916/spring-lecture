package com.springbook.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository("userDAOSpring")
public class UserDAOSpring {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	private String USER_GET = "select * from users where id = ? and password = ?";
	private String USER_INSERT = "insert into users values (?,?,?,?)";
	
	// �� �� ��� ���
	public UserVO getUser(UserVO vo) {
		System.out.println("===>Spring JDBC�� getUser() ���ó��");
		Object[] args = {vo.getId(),vo.getPassword()};
		return jdbcTemplate.queryForObject(USER_GET, args, new UserRowMapper());
	}
	
	// �� ���
	public void insertUser(UserVO vo) {
		System.out.println("===> Spring JDBC�� insertUser() ���ó��");
		jdbcTemplate.update(USER_INSERT, vo.getId(),vo.getPassword(),vo.getName(),vo.getRole());
	}
}
