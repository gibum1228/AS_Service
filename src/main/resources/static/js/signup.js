/**
 * 
 */
let IDOk = false; // 아이디가 조건에 맞는지 체크
let pswOk = false; // 비밀번호가 조건에 맞는지 체크
let emailOk = false;

// 비밀번호 맞는지 확인
function pswSame() {
	let userPswValue = String(document.getElementById("userPsw").value);
	let checkPswValue = String(document.getElementById("checkPsw").value);

	// 비밀번호는 8~16자리
	if (userPswValue.length < 8 || userPswValue.lengh > 16) {

		alert("비밀번호는 8~15 자리이어야 합니다.")
		pswOk = false;
		document.getElementById("userPsw").style.borderColor = 'red';
		signUpOk();
	} else {
		let checkID = true; // 비밀번호 특수문자 정상인지 판단하는 변수

		for (let i = 0; i < userPswValue.length; i++) {
			switch (userPswValue.charAt(i)) {
				case '0': case '1': case '2': case '3': case '4': case '!':
				case '5': case '6': case '7': case '8': case '9': case '^':
				case 'a': case 'b': case 'c': case 'd': case 'e': case '~':
				case 'f': case 'g': case 'h': case 'i': case 'j':
				case 'k': case 'l': case 'm': case 'n': case 'o': case 'Y':
				case 'p': case 'q': case 'r': case 's': case 't': case 'Z':
				case 'u': case 'v': case 'w': case 'x': case 'y': case 'z':
				case 'A': case 'B': case 'C': case 'D': case 'E': case 'F':
				case 'G': case 'H': case 'I': case 'J': case 'K': case 'L':
				case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R':
				case 'S': case 'T': case 'U': case 'V': case 'W': case 'X':
					break;
				default:
					checkID = false;
					break;
			}

			if (!checkID) { // pswPass가 정상이 아니면
				break;
			}
		}

		// 비밀번호 조건에 잘 부합한지 판단
		if (checkID) {

			// 비밀번호 확인을 제대로 했는지 판단
			if (userPswValue == checkPswValue) {

				pswOk = true;
				document.getElementById("userPsw").style.borderColor = 'green';
				document.getElementById("checkPsw").style.borderColor = 'green';
				signUpOk();
			} else {

				pswOk = false;
				document.getElementById("userPsw").style.borderColor = 'red';
				document.getElementById("checkPsw").style.borderColor = 'red';
				signUpOk();
			}
		} else {

			pswOk = false;
			signUpOk();
			document.getElementById("userPsw").style.borderColor = 'red';
			document.getElementById("checkPsw").style.borderColor = 'red';
			alert("비밀번호는 대문자, 소문자, 숫자, 특수문자(!, ^, ~)만 입력 가능합니다.");
		}

	}
}

// 아이디가 조건에 맞는지 확인
function idSame(snum) {

	let now = new Date();
	let snumValue = String(snum.value);
	let checkID = true;

	// 학번(숫자) 외에 단어를 입력했을 경우
	for (let i = 0; i < snumValue.length; i++) {

		// 학번(9자리)이 아닐 경우
		if (snumValue.length != 9) {

			checkID = false;
			break;
		}

		// 숫자 외에 단어 입력 시 checkID == false
		if (isNaN(snumValue.charAt(i))) {

			checkID = false;
			break;
		}
	}

	// 아이디 입력 조건
	if (snumValue.substring(0, 4) < (now.getFullYear() - 10) // 올해 기준 -10학번이 아니거나
		|| snumValue.substring(0, 4) > now.getFullYear()) { // 20학번이 신입생이면 21학번으로 가입하거나

		// 아이디 조건에 맞지 않음
		alert("학번을 제대로 입력해주세요.");
		IDOk = false;
		snum.style.borderColor = 'red';
		signUpOk();
	} else if (!checkID) {

		alert("학번을 입력해주세요.");
		IDOk = false;
		snum.style.borderColor = 'red';
		signUpOk();
	} else { // 아이디가 조건에 맞을 경우

		IDOk = true;
		snum.style.borderColor = 'green';
		signUpOk();
	}
}

// 이메일이 맞는지 확인
function emailSame(userEmail){
	let emailValue = String(userEmail.value).split("@")[1];
	let addressList = ["gmail.com", "naver.com", "daum.net", "office.skhu.ac.kr", "skhu.ac.kr"];
	let checkMail = false;
	
	for(let i = 0; i < addressList.length; i++){
		
		if(emailValue == addressList[i]){
			
			checkMail = true;
			break;
		}
	}
	
	if(checkMail){
		emailOk = true;
		userEmail.style.borderColor = "green";
		signUpOk();
	}else{
		emailOk = false;
		userEmail.style.borderColor = "red";
		signUpOk();
		alert("구글, 네이버, 다음, 학교 이메일로만 가입 가능합니다.")
	}
}

// 모든 데이터 이상 없을 시 DB에 데이터 추가
function signUpOk() {
	let submitBtn = document.getElementById("upBtn");

	if (IDOk && pswOk && emailOk) {

		submitBtn.disabled = false;
	} else {

		submitBtn.disabled = true;
	}
}