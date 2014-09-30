$(document).ready(function () {
   $('#menu-icon').click(function(e) {
      e.preventDefault();
      $('#dropdown-menu').slideToggle('medium');
   });
});
