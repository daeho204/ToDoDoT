<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.0/main.min.css"
	rel="stylesheet">
</head>
<body>

	<div id="calendarBox">
		<div id="calendar"></div>
	</div>


	<!-- modal �߰� -->
	<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">������ �Է��ϼ���.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="taskId" class="col-form-label">���� ����</label> <input
							type="text" class="form-control" id="calendar_content"
							name="calendar_content"> <label for="taskId"
							class="col-form-label">���� ��¥</label> <input type="date"
							class="form-control" id="calendar_start_date"
							name="calendar_start_date"> <label for="taskId"
							class="col-form-label">���� ��¥</label> <input type="date"
							class="form-control" id="calendar_end_date"
							name="calendar_end_date">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="addCalendar">�߰�</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="sprintSettingModalClose">���</button>
				</div>

			</div>
		</div>
	</div>
</body>



<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                initialView: 'timeGridWeek', // Ȩ���������� �ٸ� ������ view�� Ȯ����  �� �ִ�.
                events:[ // ���� ������ �߰� , DB�� event�� ���������� JSON �������� ��ȯ�� events�� �־��ָ�ȴ�.
                    {
                        title:'����',
                        start:'2021-05-26 00:00:00',
                        end:'2021-05-27 24:00:00' 
                        // color ���� �߰��� ���� ���� ���� �ڼ��� ������ �ϴ��� ����Ʈ ����
                    }
                ], headerToolbar: {
                    center: 'addEventButton' // headerToolbar�� ��ư�� �߰�
                }, customButtons: {
                    addEventButton: { // �߰��� ��ư ����
                        text : "���� �߰�",  // ��ư ����
                        click : function(){ // ��ư Ŭ�� �� �̺�Ʈ �߰�
                            $("#calendarModal").modal("show"); // modal ��Ÿ����

                            $("#addCalendar").on("click",function(){  // modal�� �߰� ��ư Ŭ�� ��
                                var content = $("#calendar_content").val();
                                var start_date = $("#calendar_start_date").val();
                                var end_date = $("#calendar_end_date").val();
                                
                                //���� �Է� ���� Ȯ��
                                if(content == null || content == ""){
                                    alert("������ �Է��ϼ���.");
                                }else if(start_date == "" || end_date ==""){
                                    alert("��¥�� �Է��ϼ���.");
                                }else if(new Date(end_date)- new Date(start_date) < 0){ // date Ÿ������ ���� �� Ȯ��
                                    alert("�������� �����Ϻ��� �����Դϴ�.");
                                }else{ // �������� �Է� ��
                                    var obj = {
                                        "title" : content,
                                        "start" : start_date,
                                        "end" : end_date
                                    }//������ ��ü ����

                                    console.log(obj); //������ �ش� ��ü�� �����ؼ� DB ���� ����
                                }
                            });
                        }
                    }
                },
                editable: true, // false�� ���� �� draggable �۵� x 
                displayEventTime: false // �ð� ǥ�� x
            });
            calendar.render();
        });
    </script>
    <style>
        #calendarBox{
            width: 70%;
            padding-left: 15%;
        }

    </style>
</head>
</body>
</html>