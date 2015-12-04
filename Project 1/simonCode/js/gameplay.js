$(document).ready(function() {

	var playerClick;

	var clickLog = [];

	

	//accept player click and log the button pushed
	$(".button").each(function(){
		
		$(this).click(function(){

			playerClick = $(this).val();

			clickLog.add(playerClick);

		})

	});










});