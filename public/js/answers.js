$(document).ready(function() {
  handleNewAnswer();
});

function handleNewAnswer() {
  $('#answer-form').on('submit', function(event) {
    event.preventDefault();
    var route = $(this).attr("action");
    var content = $(this).serialize();
    $.post(route, content, function(response) {
      $("#answers").append(response);
    })
    .fail(function(event) {
      alert("Whoops! Looks like you forgot to write your answer.")
    });
  });
}
