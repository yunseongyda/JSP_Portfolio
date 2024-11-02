function check_form_addProduct() {
	let pId = document.getElementById("p_id");
	let pName = document.getElementById("p_name");
	let pDesc = document.getElementById("p_description");
	let pImg = document.getElementById("p_img_name");
	let projectType = document.getElementById("projectType");
	let languageType = document.getElementById("languageType");
	
	if (!pId.value) {
		alert("프로젝트의 아이디를 입력해주세요.");
		pId.focus();
		return false;
	}
	if (!pName.value) {
		alert("프로젝트의 이름을 입력해주세요.");
		pName.focus();
		return false;
	}
	if (!pDesc.value) {
		alert("프로젝트의 정보를 입력해주세요.");
		pDesc.focus();
		return false;
	}
	if (!pImg.value) {
		alert("프로젝트의 사진을 입력해주세요.");
		pImg.focus();
		return false;
	}
	if (projectType.selectedIndex === 0) {
		alert("프로젝트 유형을 선택해주세요.");
		projectType.focus();
		return false;
	}
	if (languageType.selectedIndex === 0) {
		alert("언어 유형을 선택해주세요.");
		languageType.focus();
		return false;
	}
	
	document.registNewProduct.submit();
}
