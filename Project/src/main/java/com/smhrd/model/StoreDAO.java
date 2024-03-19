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
		// Store 객체들의 list에서 풀어서 한줄씩 가져온다음에, for(Store store:list)거기서 이미지만 선택해서
		// (store.getStore_img)
		// 얘를 반복문 돌때마다 아래 StoreContent에 넣어주면, 이미지를 base64로 반환해주지 않을까?
	}

	public Store SearchList(Store store) {
		SqlSession sqlSession = sessionFactory.openSession(true);

		Store result = sqlSession.selectOne("com.smhrd.database.StoreMapper.storeSearch", store);
		sqlSession.close();
		return result;
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
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\images\\"
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
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\images\\"
				+ store.getStore_img());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		System.out.println("파일의 값" + fileStringValue);
		// img: 파일의 제목,확장자 보유중 --> 지정한 경로에서 해당 파일을 가져와야함
		// 들고온 파일을 텍스트 형태로 변환 (Converter - base64)
		store.setStore_img(fileStringValue);
		return store;
	}

	// bnum만 가져가서, id가져오기
	public String getstoreId(String user_bnum) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		String store = sqlSession.selectOne("com.smhrd.database.StoreMapper.getstoreId", user_bnum);
		sqlSession.close();
		return store;
	}

	public int storeUpdate(Store store) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.StoreMapper.update", store);
		// 자원 반납까지 마무리
		sqlSession.close();
		return res;
	}

}
