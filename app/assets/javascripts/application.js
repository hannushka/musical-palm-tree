// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  // Conditional rendering 

  if ($('#contest_end_date').prop('type') !== 'datetime-local') {
    $('.date-description').text("Sista chansen att skicka in bidrag (format exempel: 2019-03-16T22:00)")
  }

  // Event functions

  $('.nav-expandable-sign').click(function() {
    if (window.matchMedia("(max-width: 767px)").matches) {
      $('.nav').toggle();
      if ($(".nav").css("display") === "none") {
        $(".nav-expandable-sign").text("+");
      } else {
        $(".nav-expandable-sign").text("-");
      }
    }
  }); 
});