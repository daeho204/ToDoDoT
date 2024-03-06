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
<input type="text" id="textInput" placeholder="Enter a date in YYYY-MM-DD format">
<button id="submit">클릭<button>
<div id = 'calendar'></div>


	
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
  	<script>
  	let textInput = document.getElementById("textInput")
  	let button = document.getElementById("submit")
  	submit.addEventListener('click', function () {


  		console.log(textInput.value)


        })
  	
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
              var date = new Date(textInput.value + 'T00:00:00'); // will be in local time

              if (!isNaN(date.valueOf())) { // valid?
                calendar.addEvent({
                  title: 'dynamic event',
                  start: date,
                  allDay: true
                });
                alert('Great. Now, update your database...');
              } else {
                alert('Invalid date.');
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