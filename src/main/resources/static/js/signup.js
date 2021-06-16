var app = new Vue({
	el: "#app",
	data: {
		m: {
			snum: "",
			name: "",
			pwd: "",
			email: "",
			phone: "",
			first_major: 0,
			sec_major: 0
		},
		pwdOk: false,
		emailOk: false,
		majorOk: false,
		help: false,
		disable: true,
		majorList: [
			{ id: 1, name: "IT융합자율학부" }, { id: 2, name: "미디어콘텐츠융합자율학부" }, { id: 3, name: "인문융합자율학부" },
			{ id: 4, name: "사회융합자율학부" }, { id: 5, name: "컴퓨터공학전공" }, { id: 6, name: "소프트웨어공학전공" },
			{ id: 7, name: "정보통신공학전공" }, { id: 8, name: "글로컬IT전공" }, { id: 9, name: "디지털콘텐츠전공" },
			{ id: 10, name: "신문방속학전공" }, { id: 0, name: "전공 선택"}
		]
	},
	methods: {
		pswSame() { // 비밀번호 조건과 맞는지 확인
			let value = this.m.pwd.trim();

			if (value.length < 6 || value.length > 15){
				this.pwdOk = false;
			}else{
				if(value.search(/[^a-z0-9A-Z]/) < 0){
					this.pwdOk = true;
				}else{
					this.pwdOk = false;
				}
			}

			this.enable();
		},
		emailSame() { // 이메일 조건과 맞는지 확인
			let email = this.m.email.split("@")[1];
			let address = ["naver.com", "gmail.com", "daum.net"];
			
			this.emailOk = address.reduce((a, b) => {
				if(a == true){
					return true;
				}else if(b == email){
					return true
				}
			}, false);
			
			this.enable();
		},
		checkDouble() { // 두 개의 전공을 선택했는가?
			if(this.m.first_major != 0 && this.m.sec_major != 0){
				this.majorOk = true;
			}

			this.enable();
		},
		enable() {  // 회원가입 버튼 활성화
			if((this.pwdOk && this.emailOk && this.majorOk)){
				this.disable = false;
			}else{
				this.disable  = true;
			}
		},
		showHelp() { // 도움말 원클릭 이벤트
			if(this.help){
				this.help = false;
			}else{
				this.help = true;
			}
		}
	}
});