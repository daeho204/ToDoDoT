const signUpBtn = document.getElementById("signUp");
const signInBtn = document.getElementById("signIn");
const container = document.querySelector(".container");
const storeNum = document.getElementById("storeNum");

signUpBtn.addEventListener("click", () => {
	container.classList.add("right-panel-active");
});
signInBtn.addEventListener("click", () => {
	container.classList.remove("right-panel-active");
});
document.addEventListener('DOMContentLoaded', function() {
	var checkbox = document.getElementById("checkbox");
	var storeNum = document.getElementById("storeNum");

	checkbox.addEventListener('click', function() {
		storeNum.classList.toggle('hidden');
	});
});
function idCheck() {
	var input = document.getElementById("input");
	console.log(input.value);

	$.ajax({ // 비동기 통신 사용
		type: "get", // 요청방식 : get
		data: { "id": input.value }, // 요청 데이터
		url: "IdCheckController", // 요청 경로
		dataType: "text",// 서버로부터 응답받을 데이터 타입
		success: function(data) { // data : 서버에서 응답한 데이터
			if (data == "YY") { // 사용할 수 있는 아이디
				$("#id_ok").text("사용할 수 있는 아이디입니다");	// 회원가입 창에 바로 나온다		
				$("#id_already").text("");
			}
			else {
				$("#id_already").text("사용할 수 없는 아이디입니다");
				$("#id_ok").text("");
			}

		},
		error: function() {
			console.log("통신 실패!") // 통신 실패하면
		}

	})
}



//# sourceURL=pen.js


/**
 * 
 */