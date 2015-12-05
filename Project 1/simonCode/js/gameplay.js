$(document).ready(function() {

	var simonButton;
	var simonLog = [];
	var playerClick;
	var playerClickLog = [];

	var redButton = $("#red").val();
	var greenButton = $("#green").val();
	var blueButton = $("#blue").val();
	var yellowButton = $("#yellow").val();

	var round = 0;

	changeColour();
	colourGenerator();
	checkForClick();
	
	
	function checkForClick() {
		
		console.log(simonLog.length);

		console.log(playerClickLog.length);

		if (playerClickLog.length === simonLog.length) {

			assessClickLog();

		}

		else {

			playerTurn();

		};
	}


	function colourGenerator(){

		var randomNumber = Math.random() * 4;

		if (randomNumber <= 1) {

			simonButton = redButton;

		} else if (randomNumber <= 2) {

			simonButton = greenButton;

		} else if (randomNumber <= 3) {

			simonButton = blueButton;

		} else {

			simonButton = yellowButton;

		}

		simonLog.push(simonButton);
		console.log(simonButton);
		
	};

	//accept player click and log the button pushed
		
	function playerTurn(){

		$(".button").each(function(){

			$(this).click(function(){

				playerClick = $(this).val();

				playerClickLog.push(playerClick);

				console.log(playerClick);

				checkForClick();

			})	

		})

	};



	function assessClickLog() {

		if (playerClickLog[round] == simonLog[round]) {
			
			$("h2").text("Score: " + (round + 1));

			round++;
			playerClick = "";
			colourGenerator();

		} else {

			alert('Game over');

		}

	}





	function changeColour(){
		
		console.log('change to flash');
		
		$("#redButton").toggleClass("buttonFlash");
		
	};


	//FROM DACING SQUARES
	// function changeBox(obj){

	//   var bigBoxColour = bigBox.style.backgroundColor;
	  
	//   bigBox.style.backgroundColor = 'red';	  

	//   setTimeout(function(){
	      
	//       bigBox.style.backgroundColor = bigBoxColour;
	     
	//   }, 500);


	// CHECK HOW SQUARES FLASHED IN DANCING SQUARES 
	// function buttonFlash() {

	// 	$("#red").toggleClass("buttonFlash");

	// 	setTimeout(buttonFlash, 2000);

	// 	console.log($("#red"));

	// };

	// setTimeout(buttonFlash, 2000);


	










});