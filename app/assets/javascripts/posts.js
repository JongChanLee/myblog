$(document).ready(function () {
    $('#post_tag_tokens').tokenInput('/tags.json', {
        theme: 'facebook',
        prePopulate: $('#post_tag_tokens').data('load'),
        preventDuplicates: true
    });
});