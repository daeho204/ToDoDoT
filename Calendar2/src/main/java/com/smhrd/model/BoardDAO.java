package com.smhrd.model;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.converter.ImageToBase64;
import com.smhrd.database.SqlSessionManager;

public class BoardDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<Board> boardList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Board> list = sqlSession.selectList("com.smhrd.database.BoardMapper.list");
		sqlSession.close();
		return list;
	}
	
	public int insert(Board board) {
	      SqlSession sqlSession = sessionFactory.openSession(true);
	      int res = sqlSession.insert("com.smhrd.database.BoardMapper.insert",board);
	      sqlSession.close();
	      return res;
	   }
	public Board boardContent(int idx) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Board board = sqlSession.selectOne("com.smhrd.database.BoardMapper.content",idx);
		sqlSession.close();
		// 파일객체 생성해서 서버의 폴더에 저장하는법 (경로 + img 이름/확장자
		File file = new File("C:\\Users\\ottki\\OneDrive\\바탕 화면\\빅데이터 23.12.14 - 24.06.10\\Web(Server)\\.metadata\\.plugins"
				+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mavenmember\\upload\\"
				+ board.getImg());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileStringValue = converter.convert(file);
		System.out.println(fileStringValue);
		// img: 파일의 제목,확장자 보유중 --> 지정한 경로에서 해당 파일을 가져와야함
		// 들고온 파일을 텍스트 형태로 변환 (Converter - base64)
		board.setImg(fileStringValue);
		return board;
	}

}
