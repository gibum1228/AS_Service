// Set the date we're counting down to
// let countDownDate = new Date("Jun 16, 2021 00:00:00").getTime();

// // Update the count down every 1 second
// let x = setInterval(function() {

// 	// Get today's date and time
// 	let now = new Date().getTime();

// 	// Find the distance between now and the count down date
// 	let distance = countDownDate - now;

// 	// Time calculations for days, hours, minutes and seconds
// 	let days = Math.floor(distance / (1000 * 60 * 60 * 24));
// 	let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
// 	let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
// 	let seconds = Math.floor((distance % (1000 * 60)) / 1000);

// 	// Display the result in the element with id="demo"
// 	document.getElementById("countDown").innerHTML = "<small>반납일까지</small><br>" + days + "일 " + hours + "시 "
// 		+ minutes + "분 " + seconds + "초";

// 	// If the count down is finished, write some text
// 	if (distance < 0) {
// 		clearInterval(x);
// 		document.getElementById("countDown").innerHTML = "EXPIRED";
// 	}
// }, 1000);

// ------------------------------------------------------

function showBanner() {
	let imgNum = Math.floor(Math.random() * 8)
	let objImg = document.getElementById('banner');
	objImg.src = '/media/background_img/' + imgNum + '.jpg';
	setTimeout(showBanner, 5000);
}

function scrollF(){
	if(document.body.scrollTop > 190 || document.documentElement.scrollTop > 190){
		document.getElementById("navBar").style.top = "0";
	}else{
		document.getElementById("navBar").style.top = "-300px";
	}
}

window.onscroll = function(){
	scrollF();
};