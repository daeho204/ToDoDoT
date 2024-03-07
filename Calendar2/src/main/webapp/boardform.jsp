<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>빅데이터반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
   		  <!-- enctype(encoding-type) : 기본값(text) - application/x-www-form-urlcencoded -->
    	  <form action= "BoardInsert" method = "post" enctype="multipart/form-data" class="form-horizontal">
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="title">제목:</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" id="title" name = "title" placeholder="Enter title">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="content">내용:</label>
		      <div class="col-sm-10">          
		        <textarea rows="10" class="form-control" name="content"></textarea>
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="writer">작성자:</label>
		      <div class="col-sm-10">          
		        <input type="text" class="form-control" name = "writer">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="photo">Photo:</label>
		      <div class="col-sm-10">          
		         <input type="file" class="form-control" id="photo" name = "img">
		      </div>
		     
		    </div>
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="submit" class="btn btn-success btn-default">작성</button>
		      </div>
		    </div>
		  </form>
    
    </div>
    <div class="panel-footer">빅데이터 분석서비스 개발자 과정 (담임 : 주미리)</div>
  </div>
</div>
</body>
</html>
