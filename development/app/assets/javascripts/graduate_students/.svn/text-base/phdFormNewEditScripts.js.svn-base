$(function() {
    if ($('#milestone_granttype').children('option:selected').text() == 'Internal') {
        $('#milestone_grantname').hide();
        $('#milestone_research_grant_id').show();
        $('.externalGrantFields').hide();
    }
    else {
        $('#milestone_grantname').show();
        $('#milestone_research_grant_id').hide();
        $('.externalGrantFields').show();
    }

    $('#milestone_granttype').change(function() {
        if ($(this).children('option:selected').text() == 'Internal') {
            $('#milestone_grantname').hide();
            $('#milestone_research_grant_id').show();
            $('.externalGrantFields').slideUp();
        }
        else {
            $('#milestone_grantname').show();
            $('#milestone_research_grant_id').hide();
            $('.externalGrantFields').slideDown();
        }
    });

//    $("form#formMSSpecialCourses").bind("nested:fieldAdded",function(event) {
//        //alert('In');
//        if ($('#milestone_granttype').children('option:selected') == 'Internal') {
//
//           event.field.find('.externalGrantFields').hide();
//        }
//        else {
//            event.field.find('.externalGrantFields').show();
//        }
//    });

})