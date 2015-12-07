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

		var numberOfButtons = 4;

		var round = 1;

		var buttonSounds = ["audio/after.wav", "audio/better.wav", "audio/do_it.wav", 
		"audio/ever.wav"];

		var faultSound = ["audio/faster.wav"];

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

			simonLog.push(simonButton.attr('class'));

			console.log("simonLog = " + simonLog);

			simonFlash();

			//makeSound(simonButton.attr('url'));

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

				$(this).on("click", function(){

					$("input").off("click");

					playerClick = $(this);

					console.log(playerClick.attr('class'));

					playerFlash(playerClick.attr('class'));	

					playerClickLog.push(playerClick.attr('class'));

					playerTurn();

				})
				
			})

		};

		function assessClickLog() {

			console.log('assessClickLog');

				var simonLogJoined = simonLog.join();

				var playerClickJoined = playerClickLog.join();

				if (simonLogJoined == playerClickJoined) {
					
					$("h2").text("Score: " + (round));

					round++;

					playerClickLog.length = 0;

					setTimeout(function(){

						colourGenerator();

					}, 1000);

				} else {

					//faultSound();
					alert('Game over');

				}

		}

		function simonFlash(){		

			for (i = 0; i < simonLog.length; i++) {

				console.log(simonLog[i]);

				(function(i){

					  setTimeout(function(){
					           
					  		$("." + simonLog[i]).css("background-color", $("." + simonLog[i]).attr('id'));

					  		setTimeout(function(){

						  		$("." + simonLog[i]).css("background-color", $("." + simonLog[i]).attr('value'));

						  		}, 300);				  			

						}, 1000 * i);

					}(i));
			};
		
		}

		function removeFlashClasses() {

			$("#redButton").removeClass("redButtonFlash");
			$("#blueButton").removeClass("blueButtonFlash");
			$("#greenButton").removeClass("greenButtonFlash");
			$("#yellowButton").removeClass("yellowButtonFlash");

		}

		function playerFlash(buttonClass){

			$("." + buttonClass).css("background-color", $("." + buttonClass).attr('id'));

				setTimeout(function(){

					$("." + buttonClass).css("background-color", $("." + buttonClass).attr('value'));

				}, 300);
	
		};

		function faultSound(){

			eSound = soundManager.createSound({
			        
			      "url": "audio/faster.wav"

			    });

			eSound.play();

		};

		function makeSound(buttonURL){

			mySound = soundManager.createSound({
			        
			      "url": buttonURL

			    });

			mySound.play();

		};

	}

});
