<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <form action="StoreJoinController" method="post" enctype="multipart/form-data">
      <!-- <input type="text" name = "user_bnum" placeholder="사업자번호를 입력하세요" > -->
      <input type="text" name="store_name" placeholder="가게이름을 입력하세요">
      <input type="text" name="store_address" placeholder="가게주소를 입력하세요">
      <input type="text" name="store_contact" placeholder="가게전화번호를 입력하세요">
      <input type="file" name="store_img" placeholder="가게 이미지를 선택하세요">
      
      <input type="submit" value="JoinUs" class="button fit">
   </form>
   
   <div class="panel-body" id="list">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		        <th>삭제</th>
		      </tr>
		    </thead>
		    <tbody>
			<!-- 게시물 출력 -->
			<c:forEach items="${list}" var="b" varStatus = "status"> 
			<tr>
				<td>${status.count}</td>		
				<td><a href ="boardcontent.jsp?idx=${b.idx}">${b.title}</a></td>		
				<td>${b.writer}</td>		
				<td>${b.indate}</td>		
			</tr>
			</c:forEach>
		      <tr>
		      	<td colspan="4">
		      		<button onclick="location.href='boardform.jsp'" class="btn btn-sm btn-success">글작성</button>
		      		<button onclick="chat()" class="btn btn-sm btn-success">채팅하기</button>
		      	</td>
		      </tr>
		    </tbody>
		  </table>
    
    </div>

</body>
</html>