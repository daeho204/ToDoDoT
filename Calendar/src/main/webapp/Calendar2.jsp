<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.0/main.min.css" rel="stylesheet">
</head>
<body>
<input type = "date" id = "dateInput">
<input type= "text" id = "eventInput">
<div id = 'calendar'></div>


	
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
  	<script>
  	let dateInput = document.getElementById("dateInput")
  	let eventInput = document.getElementById("eventInput")
  
    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');

      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        
        headerToolbar: {
          center: 'addEventButton'
         
        },
        customButtons: {
          addEventButton: {
            text: '일정추가',
            click: function () {
              var date = new Date(dateInput.value + 'T00:00:00'); // will be in local time

              if (!isNaN(date.valueOf())) { // valid?
                calendar.addEvent({
                  title: eventInput.value,
                  start: date,
                  allDay: true
                });
                alert('입력완료');
              } else {
                alert('잘못된형식입니다.');
              }
            }
          }
        }
      });

      calendar.render();
    });

  </script>
</body>
</html>