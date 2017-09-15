//= require jquery
//= require jquery_ujs


$(document).ready(function () {
    var edit_category_id = $('#edit_category_id');
    var edit_category_name = $('#edit_category_name');
    var destroy_category_id = $('#destroy_category_id');
    var options = $('#parent_category_id option');

    $('.root-category label').click(function () {
        var label = $(this);
        edit_category_name.val(label.html());
        edit_category_id.val(label.data('id'));
        destroy_category_id.val(label.data('id'));


        for(var i = 0; i < options.length; i++) {
            var option = $(options[i]);
            if (label.data('id') == option.val()){
                option.attr('selected', true);
                break;
            }
        }
    });
});