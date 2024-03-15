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
	public int storejoin(Store store) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.StoreMapper.join", store);
		// 자원 반납까지 마무리
		sqlSession.close();
		return res;
	}
	
	public Store storeContent(String store_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Store store = sqlSession.selectOne("com.smhrd.database.StoreMapper.content", store_id);
		sqlSession.close();
		// 파일객체 생성해서 서버의 폴더에 저장하는법 (경로 + img 이름/확장자
		File file = new File("C:\\Users\\ottki\\OneDrive\\바탕 화면\\빅데이터 23.12.14 - 24.06.10\\Projects\\2nd_Project\\ToDoDoT\\.metadata\\.plugins"
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\images\\"
				+ store.getStore_img());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		System.out.println("파일의 값" + fileStringValue);
		// img: 파일의 제목,확장자 보유중 --> 지정한 경로에서 해당 파일을 가져와야함
		// 들고온 파일을 텍스트 형태로 변환 (Converter - base64)
		store.setStore_img(fileStringValue);
		return store;
	}
	
	public Store storeOwnContent(String user_bnum) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Store store = sqlSession.selectOne("com.smhrd.database.StoreMapper.owncontent", user_bnum);
		sqlSession.close();
		// 파일객체 생성해서 서버의 폴더에 저장하는법 (경로 + img 이름/확장자
		File file = new File("C:\\Users\\ottki\\OneDrive\\바탕 화면\\빅데이터 23.12.14 - 24.06.10\\Projects\\2nd_Project\\ToDoDoT\\.metadata\\.plugins"
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\images\\"
				+ store.getStore_img());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		System.out.println("파일의 값" + fileStringValue);
		// img: 파일의 제목,확장자 보유중 --> 지정한 경로에서 해당 파일을 가져와야함
		// 들고온 파일을 텍스트 형태로 변환 (Converter - base64)
		store.setStore_img(fileStringValue);
		return store;
	}
	

}
