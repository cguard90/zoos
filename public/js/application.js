$(document).ready(function() {

  $(".user_form").on("click", function(event) {
    event.preventDefault();
    $.ajax({
      type: "GET",
      url: event.currentTarget.href,
    }).done(function(response){
      $("#hidden").empty().append(response);
    });
  });

});
