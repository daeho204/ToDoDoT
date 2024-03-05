package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {
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

	public int join(Member member) {
		// 1. Factory 를 통해서 SqlSession(Sql문 실행, 결과처리) 생성
		// DML(insert,delete,update)->commit
		// openSession(true) = auto commit
		SqlSession sqlSession = sessionFactory.openSession(true);

		// sqlSession.insert(어떤 sql문을 호출할건지,sql문 호출할때 넘겨줄 값);
		int res = sqlSession.insert("com.smhrd.database.Mapper.join", member);

		// 메모리 낭비하지 않게 session 닫아주기
		sqlSession.close();

		return res;
	}

	public Member login(Member member) {
		// 1. Factory 를 통해서 SqlSession(Sql문 실행, 결과처리) 생성
		// DML(insert,delete,update)->commit
		// openSession(true) = auto commit
		SqlSession sqlSession = sessionFactory.openSession(true);

		Member result = sqlSession.selectOne("com.smhrd.database.Mapper.login", member); // select했을때 실제 결과가

		sqlSession.close();

		return result;
	}
	
	public int update(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		int res = sqlSession.update("com.smhrd.database.Mapper.update", member);
		
		sqlSession.close();

		return res;
	}
	
	public List<Member> selectAll() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Member> res = sqlSession.selectList("com.smhrd.database.Mapper.select"); //selectList : 2개 이상의 정보를 가져오고 싶을 때
									 // returnType = List(ArrayList의 상위타입) List<Member>
		sqlSession.close();
		return res;
	}
	
	public int delete(String id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.delete("com.smhrd.database.Mapper.delete", id);
		
		sqlSession.close();
		return res;
		
	}
	public Member idCheck (String id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Member result = sqlSession.selectOne("com.smhrd.database.Mapper.check", id);
		sqlSession.close();
		return result;
		
		
	}

}
