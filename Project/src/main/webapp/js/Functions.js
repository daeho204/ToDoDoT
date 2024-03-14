function chat() {
	//채팅창 띄우기 (사이즈 지정) 새창에 띄워줄 리소스 / 창 이름 / 크기(가로,세로)
	window.open("http://172.30.1.51:3000/", "채팅하기",
		"width=640, height=800")
}
function LoginJoin() {
	if(window.sessionStorage.getItem("member") == null) {
		location.href = "LoginJoinForm.jsp";
	} else{
		location.href = "index.jsp";
	}
	
}
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
	document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document
			.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

function infoUpdate(){
	location.href = "http://localhost:8081/tododot/UpdateForm.html"
}