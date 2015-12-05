$(document).ready(function() {

	var simonButton;
	var simonLog = [];
	var playerClick;
	var playerClickLog = [];

	var round = 0;

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

		var redButton = $(".red");
		var greenButton = $(".green");
		var blueButton = $(".blue");
		var yellowButton = $(".yellow");

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

		simonLog.push(simonButton.val());
		


		flash(simonButton.attr('id'));
		console.log(simonButton.attr('id'));
		
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

	function flash(buttonId){
		
		$("#" + buttonId).toggleClass("buttonFlash");
		
	};




});