$(document).ready(function() {

	var simonButton;
	var simonLog = [];
	var playerClick;
	var playerClickLog = [];

	var round = 1;

	colourGenerator();
	
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

		console.log("simonLog = " + simonLog);

		simonFlash(simonButton.attr('id'));

		pClick();
		
	};

	//accept player click and log the button pushed
		
	function playerTurn(){

		if (playerClickLog.length < simonLog.length) {

			pClick();

		} else {

		assessClickLog();

		}

	};

	function pClick(){

		$("input").each(function(){

			$(this).click(function(){

				playerClick = $(this);

				playerFlash(playerClick.attr('id'));	

				playerClickLog.push(playerClick.attr('id'));

				console.log(playerClickLog);

				playerTurn();

			})	
			
		})

	};

	function assessClickLog() {

		console.log('assessClickLog');

			var simonLogJoined = simonLog.join();

			var playerClickJoined = playerClickLog.join();

			if (simonLogJoined == playerClickJoined) {
				
				$("h2").text("Score: " + (round + 1));

				round++;

				playerClickLog.length = 0;
				
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



// function playerClick(){

// 	$("input").each(function(){

// 		$(this).click(function(){

// 			playerClick = $(this);

// 			console.log(playerClick.attr('id'));

// 			playerFlash(playerClick.attr('id'));	

// 			playerClickLog.push(playerClick.attr('id'));

// 		})	
		
// 	})

// };

// function compareLogLengths() {
	
// 	console.log("playerClickLog length = " + playerClickLog.length);

// 	console.log("playerClickLog = " + playerClickLog);

// 	console.log("simonLog length = " + simonLog.length);

// 	if (playerClickLog.length === simonLog.length) {

// 		assessClickLog();

// 	}

// 	else {

// 		playerTurn();

// 	};
// }