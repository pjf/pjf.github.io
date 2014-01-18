var $sc = $('#sidebar, #content');

if (skel.isActive('mobile') || skel.isActive('narrower'))
    $sc.css('min-height', '0').css('height', 'auto');
else
    $sc.css('min-height', $(window).height()).css('height', $(document).height());

