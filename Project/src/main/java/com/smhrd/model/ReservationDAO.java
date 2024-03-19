package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.controller.Reservation;
import com.smhrd.database.SqlSessionManager;

public class ReservationDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int reserve(ReservationAndUserAndStore reservation) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.ReservationMapper.reserve", reservation);
		// 자원 반납까지 마무리
		sqlSession.close();
		return res;
		
	}

	/*
	 * public List<ReservationVO> getReserve() { SqlSession sqlSession =
	 * sessionFactory.openSession(true);
	 * 
	 * List<ReservationVO> list =
	 * sqlSession.selectList("com.smhrd.database.ReservationMapper.getReserve");
	 * System.out.println(list); sqlSession.close(); return list;
	 * 
	 * }
	 */
	public List<ReservationAndUserAndStore> getReserve() {
		SqlSession sqlSession = sessionFactory.openSession(true);

		List<ReservationAndUserAndStore> list = sqlSession.selectList("com.smhrd.database.ReservationMapper.getReserve");
		System.out.println(list);
		sqlSession.close();
		return list;

	}
	public List<ReservationAndUserAndStore> getReserveUser(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);

		List<ReservationAndUserAndStore> list = sqlSession.selectList("com.smhrd.database.ReservationMapper.getReserveUser", user_id);
		System.out.println(list);
		sqlSession.close();
		return list;

	}
	
	public List<ReservationAndUserAndStore> reserveComplete(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);

		List<ReservationAndUserAndStore> list = sqlSession.selectList("com.smhrd.database.ReservationMapper.getReserveUser", user_id);
		System.out.println(list);
		sqlSession.close();
		return list;

	}

	public int accept(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.update("com.smhrd.database.ReservationMapper.accept", user_id);
		return res;
	}

}
