$( document ).ready(function() {
   $("#menu-button").click( function(e) {
      e.preventDefault();
      $("#slider").toggleClass("slidermenu-left").toggleClass("slidermenu-pushed");
      $("#menu-button").toggleClass("menu-button-left").toggleClass("menu-button-pushed");
      $(".page-body").toggleClass("page-body-left").toggleClass("page-body-pushed");
   });
});
