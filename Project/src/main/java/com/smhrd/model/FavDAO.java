package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class FavDAO {
	SqlSessionFactory SessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int FavCheck(Fav fav) {
		SqlSession sqlSession = SessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.StoreMapper.FavCheck", fav);
		sqlSession.close();
		return res;
	}
}
