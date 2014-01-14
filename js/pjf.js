// Add a tabindex to all pictures in our main content.

$(document).ready( function() {
    var count = 1;
    $('section').find('img').each( function() {
        $(this).attr('tabindex',count++);
    });
});
