/**
 * 
 */
function check_form_addProduct() {
	let productId = document.getElementById("newProduct");
	let pName = document.getElementById("pName");
	let pDesc = document.getElementById("pDesc");
	let pImg = document.getElementById("pImg");
	
	if(!(productId.value)) {
		alert("제품의 아이디를 입력해주세요.");
		productId.focus();
		return false;
	}
	if(!(pName.value)) {
		alert("제품의 이름을 입력해주세요.");
		pName.focus();
		return false;
	}
	if(!(pDesc.value)) {
		alert("제품의 정보를 입력해주세요.");
		pDesc.focus();
		return false;
	}
	if(!(pImg.value)) {
		alert("제품의 사진을 입력해주세요.");
		pImg.focus();
		return false;
	}
	
	document.registNewProduct.submit();
}