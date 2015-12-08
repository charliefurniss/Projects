$(document).ready(function() {

	soundManager.setup({
	  url: 'js/soundmanager/swf',
	  flashVersion: 9,
	  onready: start
	});

	function start(){

		var simonButton;
		var simonLog = [];
		var playerClick;
		var playerClickLog = [];
		var playerClickNumber = 0;

		var round = 1;

		var faultSound = ["audio/faster.wav"];

		//enterPlayerName();

		colourGenerator();

		function enterPlayerName(){

			var playerName =	prompt('What is your name?').toLowerCase();

			displayPlayerName(playerName);

		}

		function displayPlayerName(name){

			$("h2").text(name + ": 0");

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

			simonLog.push(simonButton.attr('class'));

			simonFlashSound();

			pClick();

		};

		function pClick(){

			$("input").each(function(){

				$(this).on("click", function(){

					$("input").off("click");

					playerClick = $(this);

					//console.log(playerClick.attr('class'));

					playerFlashSound(playerClick.attr('class'));	

					playerClickLog.push(playerClick.attr('class'));

					assessEachClick();

				})
				
			})

		};

		//accept player click and log the button pushed

		function assessEachClick() {

				console.log(playerClickLog[playerClickNumber]);

				console.log(simonLog[playerClickNumber]);

				if (playerClickLog[playerClickNumber] == simonLog[playerClickNumber]){	

					playerTurn();

					} else {

						endGame();

					}	

			

		}

		function playerTurn(){

			if (playerClickLog.length < simonLog.length) {

				playerClickNumber++;

				pClick();

			} else {

				$("h2").text("score: " + (round));

				round++;

				playerClickLog.length = 0;

				playerClickNumber = 0;

				setTimeout(function(){

					colourGenerator();

				}, 1000);

			}

		}

		function simonFlashSound(){		

			for (i = 0; i < simonLog.length; i++) {

				(function(i){

					  setTimeout(function(){
					           
				  		$("." + simonLog[i]).css("background-color", $("." + simonLog[i]).attr('id'));

				  		//makeSound($("." + simonLog[i]).attr('url'));

				  		setTimeout(function(){

					  		$("." + simonLog[i]).css("background-color", $("." + simonLog[i]).attr('value'));

					  		}, 300);				  			
						}, 1000 * i);
					}(i));
			};		
		}

		function playerFlashSound(buttonClass){

			$("." + buttonClass).css("background-color", $("." + buttonClass).attr('id'));

			//makeSound($("." + buttonClass).attr('url'));

				setTimeout(function(){

					$("." + buttonClass).css("background-color", $("." + buttonClass).attr('value'));

				}, 300);
	
		};

		function wrongSound(){

			eSound = soundManager.createSound({
			        
			      "url": "audio/errorSound.mp3"

			    });

			eSound.play();

		};

		function makeSound(buttonURL){

			//console.log(buttonURL);

			mySound = soundManager.createSound({
			        
			      "url": buttonURL

			    });

			mySound.play();

		};

		function endGame(){

			console.log('endGame');

			//wrongSound();
			// $("body").append('<input type="button" class="unlucky" value="Unlucky!">');

			alert('game over');

		}

	}

});
