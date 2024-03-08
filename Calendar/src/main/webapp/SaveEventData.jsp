<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Event Data</title>
</head>
<body>
    <h1>Save Event Data</h1>
    <button id="saveButton">Save Data</button>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#saveButton").click(function() {
                var events = [
                    // 여기에 JSON 데이터를 넣습니다.
                    // 예: { "title": "Event 1", "start": "2024-03-01T10:00:00", "end": "2024-03-01T12:00:00" },
                    //     { "title": "Event 2", "start": "2024-03-02T14:00:00", "end": "2024-03-02T16:00:00" }
                ];

                $.ajax({
                    type: "POST",
                    url: "SaveEventDataServlet",
                    contentType: "application/json",
                    data: JSON.stringify(events),
                    success: function(response) {
                        alert(response);
                    },
                    error: function(xhr, status, error) {
                        alert("Error: " + error);
                    }
                });
            });
        });
    </script>
</body>
</html>