$(document).ready(function() {
	handleCommentSubmit();
});

function handleCommentSubmit () {
	$('#save_comment').on('click', function(event) {
		console.log(1)
		event.preventDefault();

		var data = {content: $('#content').val()}
		var form = $('#comment_form')

		var AJAXrequest = $.ajax({
			url: form.attr('action'),
			method: form.attr('method'),
			data: data
		})

		AJAXrequest.done(function(response) {
			var $template = $('.comment').first().clone();
			$template.find('#comment_content').text(response['content'])
			$template.find('#comment_author').text(response['username'])
			$template.find('#comment_created').text(response['created_at'])
			$('.comments').append($template);
		});
		$(this).parent().parent().parent().parent().parent().parent().modal('hide')
	});
};