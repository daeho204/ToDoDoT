package com.smhrd.model;

import java.io.File;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.converter.ImageToBase64;
import com.smhrd.database.SqlSessionManager;

public class MenuDAO {
	SqlSessionFactory SessionFacotry = SqlSessionManager.getSqlSessionFactory();

	public int Menuadd(Menu menu) {
		SqlSession sqlSession = SessionFacotry.openSession(true);
		int res = sqlSession.insert("com.smhrd.database.StoreMapper.menuadd", menu);
		sqlSession.close();
		return res;
	}
	
	public Menu mystoreContentMenu (int idx) {
		SqlSession sqlSession = SessionFacotry.openSession(true); 
		Menu menu = sqlSession.selectOne("com.smhrd.database.StoreMapper.menuprint",idx);
		sqlSession.close();
		
		// img : 파일의 제목, 확장자 -> 지정한 경로에서 해당 파일을 가져와야 함
		// 가지고 온 파일 -> 텍스트 형태로 변환(converter - base64)
		
		File file = new File("C:\\Users\\USER\\Desktop\\WebServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mavenmember\\images\\"
							+ menu.getMenu_img());
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		//System.out.println(fileStringValue);
		
		menu.setMenu_img(fileStringValue);
		
		return menu;
	}
	
}