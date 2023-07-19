   let form = document.editPwForm;
	let userPw = editPwForm.pw;
	let user_edit_pw = editPwForm.edit_pw;
	 var regExpPw = /^[a-zA-Z0-9!@#$%^&*()?_~]*$/;
	 
	  
	if (user_edit_pw.value ==("")) {
		alert("비밀번호를 입력하세요.");
		return false;
	} else if (user_edit_pw.indexOf(" ") != -1) {
		alert("비밀번호에 공백이 포함되어 있습니다. 다시 입력해주세요.");
		pw.focus();
		return false;
	} else if (!regExpPw.test(user_edit_pw.value)) {
		alert("비밀번호는 숫자, 소문자, 특수문자로만 입력가능합니다.");
		pw.focus();
		return false;
	}/**
 * 
 */