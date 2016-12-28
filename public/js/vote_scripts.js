$(document).ready(function() {
	handleVote();
});

function handleVote() {
	$('div.container').on('click', '.upvote', function(event) {
			event.preventDefault();
			var $voteButton = $(this)
			var route = $voteButton.parent().attr('action');
			var data = $voteButton.parent().serialize();
			$.ajax(route, {
				method: "POST",
				data: data,
				success: function(response) {
					$voteButton.parent().siblings('.vote_points').text(response);
					$voteButton.css('color', 'red')
				},
				error: function() {
					alert("Cannot vote on same item twice")
				}
			})
	})
}