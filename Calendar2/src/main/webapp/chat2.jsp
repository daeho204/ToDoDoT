<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevEric Chatting</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<div id="main-container">
		<div id="chat-container">
			
		</div>
		<div id="bottom-container">
			<input id="inputMessage" type="text">
			<input id="btn-submit" type="submit" value="전송" >
		</div>
	</div>
	<script>
	
		// 1. 소켓생성 ("ws://호스트명:포트명:프로젝트명:ServerEndpoint")
		var webSocket = new WebSocket("ws://localhost:8081/mavenmember/chat")
		
		// 전송 버튼 클릭 시, 입력한 메세지의 value 가져와서 msg변수에 저장
		var input = document.getElementById("inputMessage")
		
		$("#btn-submit").click(function(){
			var msg = input.value
			webSocket.send(msg)
			
			var chat = "<div class = 'my-chat-box'><div class = 'chat my-chat'>"+msg+"</div></div>"
			$("#chat-container").append(chat)
			input.value="";
		})
		
		//onOpen, onClose, onError, onMessage 정의
		webSocket.onopen = function(e){ //소켓서버가 열릴 시 (연결 시) 실행될 함수
			console.log("Socket Connected")
		}
		webSocket.onclose = function(e){
			console.log("Socket Disconnected")
		}
		webSocket.onerror = function(e){
			console.log(e.data)
		}
		webSocket.onmessage = function(e){
			console.log(e.data)
			
			var chat = "<div class = 'chat-box'><div class = 'chat'>"+e.data+"</div></div>"
			$("#chat-container").append(chat)
		}
	</script>
</body>
</html>