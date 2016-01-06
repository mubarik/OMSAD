# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
    $('select#selectreport').change ->
        if($('select#selectreport').val() == "Student's enrolled semesters" or $('select#selectreport').val() == "Student's enrolled courses")
            $('form#postform div#reportsRollNumber').slideDown();
        else
            $('form#postform div#reportsRollNumber').slideUp();
            $('form#postform input#rollno').val("");
            $('form#postform input#rollno').closest("td").removeClass("invalidEntry", 'slow');
            $('form#postform input#rollno').closest("td").next("td").html("");
            
