//Calculate the width of the browser's vertical scrollbar (if any) for use in sizing table overflow wrappers
//Adapted from this SO answer: <https://stackoverflow.com/a/57748743>
$('body').css('--scrollbar-width', window.innerWidth - document.documentElement.clientWidth + 'px');

//Hide the navigation bar when clicking on the main page contents in mobile view mode
$('main').click(function()
{
	if ($('.navtoggle').is(':visible') === true && $('.collapse').is(':visible') === true) {
		$('.navtoggle a').trigger('click');
	}
});
