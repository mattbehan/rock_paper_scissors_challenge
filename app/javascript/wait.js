const initializePopup = (popup_content, popup_id) => {
	let wrapper = document.createElement('div');
	wrapper.innerHTML = popup_content;
	let x = document.getElementById('popup-container');
	x.append(wrapper);
	let y = document.getElementsByClassName('popup')[0].setAttribute("id", popup_id);
	x.style.display = "block";
}

const computer_throw = () => {
	Rails.ajax({
		url: "/game/computer_throw",
		type: "get",
		data: "",
		beforeSend: function(data){
			let x = '<%= image_tag "loader.svg" %>'
			let fragment = document.createDocumentFragment();
			document.getElementById("loading").append(x);
		},
		complete: function(data) {}
	});
}