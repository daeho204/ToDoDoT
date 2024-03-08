<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Bootstrap JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
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

 // 캘린더에 값주기 
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
   eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                         console.log()
                     },
   // 일정추가하기 기능 
   select: function(arg) {
     // 프롬프트로 추가가능 
     var title = prompt('Add schedule:');

     if (title) {
       //이벤트 추가
       calendar.addEvent({
         title: title,
         start: arg.start,
         end: arg.end,
       })
     }
     var allEvent = calendar.getEvents(); //.getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
      
     // 이벤트를 배열에 한 번 더 담아준다. json 데이터를 받기 위한 배열 선언 
     var events = new Array();

       // for문을 돌린다. allEvent의 길이만큼 i를 돌린다. 
       for(var i =0; i <allEvent.length; i++ ){
       // obj 객체에 json을 담는다. 
      var obj = new Object();
  
       // 디비에 저장할 내용
        obj.title= allEvent[i]._def.title // 이벤트 명칭 출력
        obj.start= allEvent[i]._instance.range.start; // 이벤트 시작 시간 및 날짜
        obj.end= allEvent[i]._instance.range.end; // 이벤트 종료 시간 및 날짜

       // 전체 events들이 배열형태로 json 객체 형태로 events 변수에 담긴다. 
        events.push(obj);
     }

     // events를 서버 전송시, 문자열 형태로 넘길것이라 stringfy를 사용
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
                   alert("에러 발생" + error);
                 });
              calendar.unselect()
        });
   },
   // 삭제기능
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