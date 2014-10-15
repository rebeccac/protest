$(document).ready(function() {
    $('#search-icon').click(function(e) {
      $('#search-bar').slideToggle(500);
      $('#keyword').focus(); //Set focus on the search input field.
      $(this).toggleClass('close');
    });
}); // end ready
