$(document).on('turbolinks:load', function() {
  $('.bet').click(function() {
    $(this).find('.placements').toggle();
  });
});