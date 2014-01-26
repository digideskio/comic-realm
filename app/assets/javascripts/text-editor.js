$(function () {
	function handel_overflow(e) {
		console.log('overflowing!');
	}

	$('.toolbar .btn').tooltip({'placement': 'bottom'});
	
	var editor = $('#editor').wysiwyg({
		dragAndDropImages: false,
		activeToolbarClass: 'btn-pressed'
	});

	editor.get(0).addEventListener('overflowchanged', handel_overflow, false);
});