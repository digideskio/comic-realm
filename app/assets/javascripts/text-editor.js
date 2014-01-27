var text_editor = (function($) {
	var current_page, preview_pane, editor, pages;

	function handel_overflow(e) {
		console.log('overflowing!');
	}

	function initialize_editor(pages, preview_pane, editor) {
		var new_pages = [];
		for (var i = 0; i < pages.length; i++) {
			var page_content = pages[i],
				page = $('<div>').addClass('page').html(page_content);
			if (i === 0) {
				editor.focus();
				document.execCommand('insertHTML', false, page_content);
				current_page = page.addClass('current');
			}
			preview_pane.append(page);
			new_pages.push(page);
		}
		return new_pages;
	}

	function add_page() {
		var new_page = $('<div>').addClass('page');
		preview_pane.prepend(new_page);
		pages.unshift(new_page);
		switch_page(0);
	}

	function switch_page(index) {
		var current_content = editor.cleanHtml();
		current_page.html(current_content).removeClass('current');
		current_page = pages[index].addClass('current');
		editor.empty().focus();
		document.execCommand('insertHTML', false, current_page.html());
	}

	function init() {
		preview_pane = $('.preview-pane');
		editor = $('#editor').wysiwyg({
			dragAndDropImages: false,
			activeToolbarClass: 'btn-pressed',
			hotKeys: {
				'ctrl+b meta+b': 'bold',
				'ctrl+i meta+i': 'italic',
				'ctrl+u meta+u': 'underline',
				'ctrl+z meta+z': 'undo',
				'ctrl+y meta+y meta+shift+z': 'redo',
				'ctrl+l meta+l': 'justifyleft',
				'ctrl+r meta+r': 'justifyright',
				'ctrl+e meta+e': 'justifycenter',
				'ctrl+j meta+j': 'justifyfull',
				'tab': 'insertText \t'
			}
		});
		pages = initialize_editor(['<div style="text-align: center;">hello world</div>'], preview_pane, editor);

		$('.toolbar .btn').tooltip({'placement': 'bottom'});

		editor.keypress(function (e) {
			current_page.html(editor.cleanHtml());
		}).get(0).addEventListener('overflowchanged', handel_overflow, false);

		preview_pane.on('click', '.page', function (){
			switch_page($(this).index());
		});
	}

	return {
		init: init,
		new_page: add_page
	};

})(jQuery);

$(function () {
	text_editor.init();
});