package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {
	// SqlSessionManager는 객체 생성 없이
	// 클래스 로딩 시 SqlSessionFactory객체를 즉시 생성한다. (static 덕분에)
	// 또한 SqlSessionFactory의 메서드 getSqlSessionFactory를 실행해
	// sessionFactory 객체에 SQL 호출하는 세션이 생성과 동시에 들어간다.
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원가입 메소드(사용자가 입력한 값을 파라미터로 넘겨받아야한다)
	// mavensample의 join메소드 참고
	
	public int join(Member member) {
		// sqlSession이 sessionFactory의 openSession()기능을 가진다
		// 자동 커밋
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.MemberMapper.join", member);
		
		// com.smhrd.database.MemberMapper를 통해 
		// 받아놓은 Member객체의 회원정보를 sql developer의 테이블에 삽입한다.
		// 성공하면 1이 res에 들어간다. 실패하면 0이 들어간다.
//		int res = sqlSession.insert("com.smhrd.database.MemberMapper.join", member);
		
		// sql 자원을 반납한다.
		sqlSession.close();
		
		// 회원가입 결과를 정수 데이터로 반환한다. 성공하면 1, 실패하면 0
		return res;
	}
	
	// Member타입 데이터를 반환하는
	// MemberDAO의 메소드 login
	// Member타입의 member를 가져온다
	public Member login(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		// Member타입의 변수 result는 회원 아이디, 비밀번호, 전화번호, 주소를 저장한다.
		// 즉 sqlSession.selectOne()은 이러한 회원 정보를 반환한다.
		Member result = sqlSession.selectOne("com.smhrd.database.MemberMapper.login",member);
		sqlSession.close();
		return result;
	}
	// Mapper.xml => MyBatis XML Mapper로 생성
	// => insert문 작성. (Member 테이블)
	// => mybatis-config.xml에 mapper를 등록한다
	// 회원가입 메서드에서 insert의 결과값을 바로 반환
	// JoinController 호출 => insert 결과값을 콘솔에 출력되는지 확인(1)
	
	
	public int update(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.update("com.smhrd.database.MemberMapper.update",member);
		sqlSession.close();
		return res;
	}
	
	public List<Member> selectAll() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Member> res = sqlSession.selectList("com.smhrd.database.MemberMapper.select"); // 2개 이상의 정보를 가져와 List로 반환
		// 반환타입 : List (ArrayList의 상위타입) List<Member>
		sqlSession.close();
		return res;
	}

	public int delete(String id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.delete("com.smhrd.database.MemberMapper.delete", id);
		sqlSession.close();
		return res;
	}

	public Member idCheck(String id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Member result = sqlSession.selectOne("com.smhrd.database.MemberMapper.check", id);
		sqlSession.close();
		return result;
	}
}





