$(document).ready(function() {

	var simonButton;
	var simonLog = ["redButton", "blueButton", "greenButton"];
	var playerClick;
	var playerClickLog = [];

	var round = 0;

	//colourGenerator();
	//checkForClick();
	simonFlash();
	
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

		simonLog.push(simonButton.attr('id'));

		simonFlash(simonButton.attr('id'));

		console.log(simonButton.attr('id'));
		
	};

	//accept player click and log the button pushed
		
	function playerTurn(){

		$("input").each(function(){

			$(this).click(function(){

				playerClick = $(this);

				playerClickLog.push(playerClick.attr('id'));

				playerFlash(playerClick.attr('id'));

				checkForClick(); 

			})	

		})

	};

	function checkForClick() {
		
		console.log(simonLog);

		console.log(playerClickLog);

		if (playerClickLog.length === simonLog.length) {

			assessClickLog();

		}

		else {

			playerTurn();

		};
	}

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

	function simonFlash(){
		
		for (i = 0; i < simonLog.length; i++) {
			
			(function(i){
			  setTimeout(function(){
			            
			  	$("#" + simonLog[i]).toggleClass("buttonFlash");			

				}, 1000 * i);
			}(i));
		}
	}		

	function playerFlash(buttonId){
		
		$("#" + buttonId).toggleClass("buttonFlash");
		
	};

});