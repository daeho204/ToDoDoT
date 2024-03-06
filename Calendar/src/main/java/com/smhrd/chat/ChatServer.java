package com.smhrd.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

// 웹소켓 연결 경로 지정
@ServerEndpoint("/chat")
public class ChatServer {
	// 현재 소켓에 연결된 세션 관리 (Set)
	// 동기화된 Set 생성 (순서없는 데이터구조)
	static Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
	
	// OnOpen : 클라이언트가 접속했을 때 호출되는 이벤트
	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("클라이언트가 접속했습니다.");
		System.out.println("세션ID : " + session.getId());
		sessions.add(session);
	}
	// OnClose : 클라이언트가 연결을 해제했을 때 호출되는 이벤트
	@OnClose
	public void handleClose(Session session) {
		System.out.println("세션ID : " + session.getId() + " 클라이언트가 연결을 해제했습니다.");
		sessions.remove(session);
		
	}
	// OnError : 오류발생 시 호출되는 이벤트
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	// OnMessage : 메시지를 받으면 호출되는 이벤트
	@OnMessage
	public void handleMessage(String message, Session session) {
		System.out.println(message);
		// 채팅을 보낸 클라이언트를 제외한 다른 모든 클라이언트에게 메시지 보내기
		for(Session s:sessions) {
			if(!s.getId().equals(session.getId())) { //메세지를 보낸사람이랑 세션의 접속중인 사람이랑 같은지
													// == 내가 나한테 메세지를 보내는지 여부확인
				try {
					s.getBasicRemote().sendText(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
	}
	
	
	
}
