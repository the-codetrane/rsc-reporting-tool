// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready', function() {
  $('select').on('change', function() {
    $('select').submit();
  })
})
