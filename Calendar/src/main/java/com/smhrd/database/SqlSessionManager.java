package com.smhrd.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// db.properties에 작성되어 있는 DB로 연결하고 SQL문 호출할 수 있는 세션을 생성할 factory 만들어주는 객체
public class SqlSessionManager {
	static SqlSessionFactory sqlSessionFactory; // DAO 클래스에서 사용
	// 클래스 초기화 블럭 : 클래스 로딩 시 딱 한번만 수행되는 블럭
	static {
		// DB 설정 정보 가져오기 -> mybatis-config.xml 파일 가져와서 읽기
		String resource = "com/smhrd/database/mybatis-config.xml";
		
		try {
			// mybatis-config.xml 파일 읽어오기
			Reader reader = Resources.getResourceAsReader(resource);
			// 작성된 db정보 가져오고 실제 db연결 도와줄 sesison생성할 factory 만들기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	// SqlSessionFactory 반환해주는 메소드
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
