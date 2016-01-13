$(document).ready(function() {

	// if (!!$('#addNoteButton')) {
		// console.log('button is here')

		var form = $('#newNoteForm');

		var button = $('#addNoteButton');

		button.on('click', function(){
			form.toggle('slow');
		})

	// };

});