package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CalendarDAO {
	
	// JAVA- mybatis 연결
	// 회원가입 : 사용자가 입력한 값 받아서 mybatis 통해 oracle db mavenmember 테이블에 값 넣기
	// 1. SqlSessionFactory 가져오기
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();

	// 회원가입 메서드(사용자가 입력한 값을 파라미터로 넘겨받아야함)
	// mavensample의 join메서드 참고
	// ~Mapper.xml -> MyBatis XML Mapper로 생성
	// => insert문 작성 (Member 테이블)
	// mybatis-config.xml에 mapper를 등록

	// 회원가입 메서드에서 insert의 결과값을 바로 반환
	// JoinController 호출 -> insert 결과값을 콘솔에 출력 (1)


	public int insertCalendarEvent(CalendarEvent calendarEvent) {
		// 1. Factory 를 통해서 SqlSession(Sql문 실행, 결과처리) 생성
				// DML(insert,delete,update)->commit
				// openSession(true) = auto commit
				SqlSession sqlSession = sessionFactory.openSession(true);

				// sqlSession.insert(어떤 sql문을 호출할건지,sql문 호출할때 넘겨줄 값);
				int res = sqlSession.insert("com.smhrd.database.CalendarMapper.insertCalendarEvent", calendarEvent);

				// 메모리 낭비하지 않게 session 닫아주기
				sqlSession.close();

				return res;		
	}

}
