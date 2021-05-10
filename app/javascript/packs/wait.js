import LoadingImage from '../images/loader.svg'

window.initializePopup = (popup_content, popup_id) => {
	// let wrapper = document.createElement('div');
	// wrapper.innerHTML = popup_content;
	let x = document.getElementById('popup-container');
	x.innerHTML = popup_content
	let y = document.getElementsByClassName('popup')[0].setAttribute("id", popup_id);
	x.style.display = "block";
}

window.computerThrow = (player_throw) => {
		$.ajax({
			url: "/game/process_computer_throw_and_finish_game",
			type: "post",
			data: {"player_throw": player_throw},
			beforeSend: function(data){
				let x = `<img src=${LoadingImage} />`;
				document.getElementById("loading").innerHTML = x;
			}
		});
}

window.clearPopup = () => {
	let popup_container = document.getElementById("popup-container");
	popup_container.innerHTML = "";
	popup_container.style.display = "none";
}
