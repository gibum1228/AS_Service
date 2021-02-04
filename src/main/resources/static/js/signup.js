/**
 * 
 */
let IDOk = false; // 아이디가 조건에 맞는지 체크
let pswOk = false; // 비밀번호가 조건에 맞는지 체크

// 비밀번호 맞는지 확인
function pswSame() {
    let uPsw = document.getElementsByName("userPsw")[0].value;
    let cPsw = document.getElementsByName("checkPsw")[0].value;
    let pswArr = uPsw.split("");

    // 비밀번호는 8~16자리
    if(uPsw.length < 8 || uPsw.lengh > 16){ 
        alert("비밀번호는 8~15 자리이어야 합니다.")
        pswOk = false;
        document.getElementsByName("userPsw")[0].style.borderColor = 'red';
        signUpOk();
    }else{
        let pswPass = false; // 비밀번호 특수문자 정상인지 판단하는 변수

        document.getElementsByName("userPsw")[0].style.borderColor = '#CCC';
        document.getElementsByName("checkPsw")[0].style.borderColor = '#CCC';
        
        for(let i = 0; i < PswArr; i++){
            switch(pswArr[i]){
                case '0': case '1': case '2': case '3': case '4': case '!':
                case '5': case '6': case '7': case '8': case '9': case '.':
                case 'a': case 'b': case 'c': case 'd': case 'e': case '~':
                case 'f': case 'g': case 'h': case 'i': case 'j':
                case 'k': case 'l': case 'm': case 'n': case 'o': case 'Y':
                case 'p': case 'q': case 'r': case 's': case 't': case 'Z':
                case 'u': case 'v': case 'w': case 'x': case 'y': case 'z':
                case 'A': case 'B': case 'C': case 'D': case 'E': case 'F':
                case 'G': case 'H': case 'I': case 'J': case 'K': case 'L':
                case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R':
                case 'S': case 'T': case 'U': case 'V': case 'W': case 'X':
                    pswPass = true;
                    break;
                default:
                    pswPass = false;
                    break;
            }

            if(!pswPass){ // pswPass가 정상이 아니면
                break;
            }
        }

        // 비밀번호 조건에 잘 부합한지 판단
        if(pswPass){

            // 비밀번호 확인을 제대로 했는지 판단
            if(uPsw == cPsw){
                pswOk = true;
                document.getElementsByName("userPsw")[0].style.borderColor = 'green';
                document.getElementsByName("checkPsw")[0].style.borderColor = 'green';
                signUpOk();
            }else{
                pswOk = false;
                document.getElementsByName("userPsw")[0].style.borderColor = 'red';
                document.getElementsByName("checkPsw")[0].style.borderColor = 'red';
                signUpOk();
            }
        }else{
            pswOk = false;
            signUpOk();
            document.getElementsByName("userPsw")[0].style.borderColor = 'red';
            document.getElementsByName("checkPsw")[0].style.borderColor = 'red';
            alert("비밀번호는 영어(소/대), 숫자, 특수문자( ., !, ~)만 가능합니다.")
        }
        
    }
}

// 아이디가 조건에 맞는지 확인
function idSame(snum){
	
	let now = new Date();
	let snumValue = snum.value;
	
	// 가입 가능한 학번은 올해 학번 기준 (-10) {ex >> 2018년이면 2009학번만 가입 가능}
	if(String(snumValue).substring(0, 4) < (now.getFullYear() - 10)
	 || String(snumValue).substring(0, 4) > now.getFullYear()){
		alert("학번을 제대로 입력해주세요.");
		IDOk = false;
		snum.style.borderColor = 'red';
		signUpOk();
	}else{
		IDOk = true;
		snum.style.borderColor = 'black';
		signUpOk();
	}
}

// 모든 데이터 이상 없을 시 DB에 데이터 추가
function signUpOk(){
    let submitBtn = document.getElementById("upBtn");

    if(IDOk && pswOk){
        submitBtn.disabled = false;
    }else{
        submitBtn.disabled = true;
    }
}