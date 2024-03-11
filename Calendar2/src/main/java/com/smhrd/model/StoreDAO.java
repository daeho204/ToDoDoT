package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class StoreDAO {

	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Store> StoreList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		List<Store> list = sqlSession.selectList("com.smhrd.database.StoreMapper.getStore");
		System.out.println(list);
		sqlSession.close();
		return list;
		
	}
	public Store selectOne() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		//selectList : 2개 이상의 정보를 가져오고 싶을 때
		// returnType = List(ArrayList의 상위타입) List<Member>
		Store store = sqlSession.selectOne("com.smhrd.database.StoreMapper.getOne");
		System.out.println(store);
		sqlSession.close();
		return store;
		
	}
	public int join(Store store) {
	      SqlSession sqlSession = sessionFactory.openSession(true);
	      int res = sqlSession.insert("com.smhrd.database.StoreMapper.join", store);
	      // 자원 반납까지 마무리
	      sqlSession.close();
	      return res;
	   }

}
