package com.smhrd.model;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.converter.ImageToBase64;
import com.smhrd.database.SqlSessionManager;

public class MenuDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int addMenu(Menu menu) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.MenuMapper.addmenu", menu);
		sqlSession.close();
		return res;
	}

	public Menu mystoreContentMenu(String menu_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Menu menu = sqlSession.selectOne("com.smhrd.database.MenuMapper.menuprint", menu_id);
		sqlSession.close();

		// img : 파일의 제목, 확장자 -> 지정한 경로에서 해당 파일을 가져와야 함
		// 가지고 온 파일 -> 텍스트 형태로 변환(converter - base64)
		File file = new File("C:\\Users\\ottki\\OneDrive\\바탕 화면\\빅데이터 23.12.14 - 24.06.10\\Projects\\2nd_Project\\ToDoDoT\\.metadata\\.plugins"
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Calendar2\\upload\\"
				+ menu.getMenu_img());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		menu.setMenu_img(fileStringValue);

		return menu;
	}

	public List<Menu> StoreList() {
		SqlSession sqlSession = sessionFactory.openSession(true);

		List<Menu> list = sqlSession.selectList("com.smhrd.database.MenuMapper.getMenu");
		System.out.println(list);
		sqlSession.close();

		return list;

	}

}