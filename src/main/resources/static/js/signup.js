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
		disable: true,
		doubleMajor: false,
		majorOk: false,
		help: false,
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
			let address = ["office.skhu.ac.kr", "skhu.ac.kr"];
			
			address.reduce((a, b) => {
				if(a == email || b == email){
					this.emailOk = true;
				}else{
					this.emailFasle = true;
				}
			});
			
			this.enable();
		},
		checkDouble() { // 복수 전공, 부전공 판단
			if (this.m.first_major > 4){
				this.doubleMajor = true;
				if (this.m.sec_major > 4){
					this.majorOk = true;
				}else{
					this.majorOk = false;
				}
			}else{ // 저학년 학부생
				this.sec_major = this.first_major;
				this.doubleMajor = false;
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