$(document).ready(function() {
    $("#postform").bind('ajax:complete', function(evt, data, status, xhr)
    {
        $('.reportsGrid').html(data.responseText);
    });

    $("#formStudentSemester").bind('ajax:complete', function(evt, data, status, xhr)
    {
        if (data !== null)
        {
            if (data.responseText.charAt(1) == 'i')
            {
//                $('.messages p').html(data.responseText);
//                $('.errors').hide();
//                $('.messages').fadeIn('slow');
            }
            else
            {
                $('.errors p').html(data.responseText);
                $('.messages').hide();
                $('.errors').fadeIn('slow');
            }
        }
    });

    $("#formFinancialAid").bind('ajax:complete', function(evt, data, status, xhr)
    {
        if (data !== null)
        {
            if (data.responseText.charAt(1) == 'i')
            {
//                $('.messages p').html(data.responseText);
//                $('.errors').hide();
//                $('.messages').fadeIn('slow');
            }
            else
            {
                $('.errors p').html(data.responseText);
                $('.messages').hide();
                $('.errors').fadeIn('slow');
            }
        }
    });
});