<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <!-- ȭ�� �ػ󵵿� ���� ���� ũ�� ����(����� ����) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Bootstrap JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar ��� CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</head>
<body>

	

	
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script type="text/javascript">

<!-- Ŭ���̾�Ʈ�� JSP ������ -->
<script>
  $(function() {
    $("#saveChanges").on("click", function() {
      var allEvent = calendar.getEvents();
      var eventData = JSON.stringify(allEvent);

      axios.post("/Calendar", {
          data: eventData
        })
        .then(function(response) {
          console.log(response.data);
          alert("�̺�Ʈ�� ���������� ����Ǿ����ϴ�.");
        })
        .catch(function(error) {
          console.error(error);
          alert("�̺�Ʈ ���忡 �����߽��ϴ�.");
        });
    });
  });

</script>
</head>
</body>
</html>