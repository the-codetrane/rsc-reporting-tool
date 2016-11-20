// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
    $('.datatable').DataTable({
        autoWidth: false,
        pagingType: 'full_numbers',
        iDisplayLength: 25,
        order: [3, 'desc']
    });
});