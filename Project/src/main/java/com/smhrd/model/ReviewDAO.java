package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ReviewDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int addReview(Review review) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.MenuMapper.addReview", review);
		sqlSession.close();
		return res;
	}
}
