package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.controller.Reservation;
import com.smhrd.database.SqlSessionManager;

public class ReservationDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int reserve(ReservationVO reservation) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.ReservationMapper.reserve", reservation);
		// 자원 반납까지 마무리
		sqlSession.close();
		return res;
		
	}
	public List<ReservationVO> getReserve() {
		SqlSession sqlSession = sessionFactory.openSession(true);

		List<ReservationVO> list = sqlSession.selectList("com.smhrd.database.ReservationMapper.getReserve");
		System.out.println(list);
		sqlSession.close();
		return list;

	}

}
