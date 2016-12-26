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
//= require turbolinks
//= require jquery
//= require jquery-ui.all
//= require tether
//= require jquery_ujs
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require tether
//= require_tree .

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});

$(document).ready(function() {
    $('select').selectpicker();
});