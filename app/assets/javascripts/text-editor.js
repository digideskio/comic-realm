$(function () {
	$('.toolbar .btn').tooltip({'placement': 'bottom'});
	var $editor = $('#editor').wysiwyg({
		dragAndDropImages: false,
		activeToolbarClass: 'btn-pressed'
	});
});