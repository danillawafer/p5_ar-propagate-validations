$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $('form').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
    type: this.method,
    url: this.action,
    dataType: "JSON",
    data: $(this).serialize()

    }).done(function(server_data){
      if (server_data.errors === true) {
        $('.errors').replaceWith(server_data.html);
      }
      else if (server_data.errors === false) {
        (window.location = "/");
      }
    });
  });
});
