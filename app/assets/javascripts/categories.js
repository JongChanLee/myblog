//= require jquery
//= require jquery_ujs


$(document).ready(function () {
    var edit_category_id = $('#edit_category_id');
    var edit_category_name = $('#edit_category_name');
    var destroy_category_id = $('#destroy_category_id');

    $('.category-list label').click(function () {
        var label = $(this);
        edit_category_name.val(label.html());
        edit_category_id.val(label.data('id'));
        destroy_category_id.val(label.data('id'));
    });
});