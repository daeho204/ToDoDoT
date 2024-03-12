package com.smhrd.model;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.converter.ImageToBase64;
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
	
	public Store storeContent() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Store store = sqlSession.selectOne("com.smhrd.database.storeMapper.content");
		sqlSession.close();
		// 파일객체 생성해서 서버의 폴더에 저장하는법 (경로 + img 이름/확장자
		File file = new File("C:\\Users\\ottki\\OneDrive\\바탕 화면\\빅데이터 23.12.14 - 24.06.10\\Web(Server)\\.metadata\\.plugins"
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Calendar2\\upload\\"
				+ store.getStore_img());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		System.out.println(fileStringValue);
		// img: 파일의 제목,확장자 보유중 --> 지정한 경로에서 해당 파일을 가져와야함
		// 들고온 파일을 텍스트 형태로 변환 (Converter - base64)
		store.setStore_img(fileStringValue);
		return store;
	}

}
