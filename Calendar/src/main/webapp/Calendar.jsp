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

	<div id="calendarBox">
		<div id="calendar"></div>
	</div>


	
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script type="text/javascript">

var calendar= null;
var localeSelectorEl = document.getElementById('locale-selector');

$(document).ready(function() {
 var calendarEl = document.getElementById('calendar');

 // Ķ������ ���ֱ� 
 calendar = new FullCalendar.Calendar(calendarEl, {
   headerToolbar: {
     left: 'prev,next today',
     center: 'title',
     right: 'dayGridMonth,timeGridWeek,timeGridDay'
   },
   initialDate: '2023-04-17',
   navLinks: true, // can click day/week names to navigate views
   selectable: true,
   editable: true,
   selectMirror: true,
   droppable: true, 
   eventAdd: function () { // �̺�Ʈ�� �߰��Ǹ� �߻��ϴ� �̺�Ʈ
                         console.log()
                     },
   // �����߰��ϱ� ��� 
   select: function(arg) {
     // ������Ʈ�� �߰����� 
     var title = prompt('Add schedule:');

     if (title) {
       //�̺�Ʈ �߰�
       calendar.addEvent({
         title: title,
         start: arg.start,
         end: arg.end,
       })
     }
     var allEvent = calendar.getEvents(); //.getEvents() �Լ��� ��� �̺�Ʈ�� Array �������� �����´�. (FullCalendar ��� ����)
      
     // �̺�Ʈ�� �迭�� �� �� �� ����ش�. json �����͸� �ޱ� ���� �迭 ���� 
     var events = new Array();

       // for���� ������. allEvent�� ���̸�ŭ i�� ������. 
       for(var i =0; i <allEvent.length; i++ ){
       // obj ��ü�� json�� ��´�. 
      var obj = new Object();
  
       // ��� ������ ����
        obj.title= allEvent[i]._def.title // �̺�Ʈ ��Ī ���
        obj.start= allEvent[i]._instance.range.start; // �̺�Ʈ ���� �ð� �� ��¥
        obj.end= allEvent[i]._instance.range.end; // �̺�Ʈ ���� �ð� �� ��¥

       // ��ü events���� �迭���·� json ��ü ���·� events ������ ����. 
        events.push(obj);
     }

     // events�� ���� ���۽�, ���ڿ� ���·� �ѱ���̶� stringfy�� ���
     var jsondata= JSON.stringify(events);
     console.dir(jsondata);
     // saveData(jsondata);

     $(function saveData(jsondata) {
           $.ajax({
            url: "/status/event",
            method: "POST",
           dataType: "json",
           data: JSON.stringify(events),
           contentType: 'application/json',
          })
              .done(function (result) {
                alert(result);
                 })
               .fail(function (request, status, error) {
                   alert("���� �߻�" + error);
                 });
              calendar.unselect()
        });
   },
   // �������
   eventClick: function(arg) {
     if (confirm('Do you want to delete this event?')) {
       arg.event.remove()
     }
   },
   editable: true,
   dayMaxEvents: true, // allow "more" link when too many events
   events: [
   
   ]
 });

 calendar.render();
});
</script>
</head>
</body>
</html>