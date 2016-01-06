$(document).ready(function() {
//    $('form#formMSSpecialCourses a.add_nested_fields, form#formMSSpecialCourses a.remove_nested_fields').live('click', function(){
//        $("div#cosupervisors legend strong").each(function(index, element) {
//            $(this).text("Co-supervisor " + (index + 1) + ":");
//        });
//    });

    if ($('form#formMSSpecialCourses select#ms_course_coursetype').val() == 'Project')
        $('div#thesisSpecialFields').hide();

    //$('form#formMSSpecialCourses select#ms_course_student_semester2_id').prepend("<option value=''>Please Select</option>");
    $('form#formMSSpecialCourses select#ms_course_student_semester2_id').change(function() {
       clearError($(this));
    });


    $('form#formMSSpecialCourses select#ms_course_coursetype').change(function() {
        if ($(this).val() == 'Project') {
            $('div#thesisSpecialFields').slideUp();
            $('td#lblSemester').text('Semester:');
            $('td#lblDate').text('Demonstration Date:');
            $('input#ms_course_thesisdefencedate').val('');
            clearErrorAndValue($('select#ms_course_student_semester2_id'));
//            coSupNameTextBox.closest("td").removeClass("invalidEntry");
//            coSupNameTextBox.closest("td").siblings("td.fieldErrorPlacement").text("");
//            coSupNameTextBox.val('');
        }
        else {
            $('div#thesisSpecialFields').slideDown();
            $('td#lblSemester').text('Thesis Semester 1:');
            $('td#lblDate').text('Proposal Defense Date:');
        }
    });
    
    var affiliationWithLUMSSelectorSelector = $('form#formMSSpecialCourses select.affiliationWithLUMSSelector, form#formMSIndependentStudies select.affiliationWithLUMSSelector');
    affiliationWithLUMSSelectorSelector.each(function() {
        //$(this).closest('fieldset').find('select.cosupervisorNameSelector').prepend("<option value=''>Please Select</option>");
        if ($(this).val() == '1') {  //Yes
            $(this).closest('fieldset').children('div#externalCoSupervisorFields').hide();
            $(this).closest('fieldset').find('input.cosupervisorNameTextBox').hide();

            $(this).closest('fieldset').find('select.cosupervisorNameSelector').show();
        }
        else {   //No
            $(this).closest('fieldset').find('select.cosupervisorNameSelector').hide();
            $(this).closest('fieldset').find('select.cosupervisorNameSelector').val('');
            
            $(this).closest('fieldset').children('div#externalCoSupervisorFields').show();
            $(this).closest('fieldset').find('input.cosupervisorNameTextBox').show();
        }
    });

    affiliationWithLUMSSelectorSelector.live('change', function(){
        if ($(this).val() == '1') { //Yes
            $(this).closest('fieldset').children('div#externalCoSupervisorFields').slideUp();
            $(this).closest('fieldset').find('input.cosupervisorNameTextBox').hide();
            clearErrorAndValue($(this).closest('fieldset').find('input.cosupervisorNameTextBox'));
            clearErrorAndValue($(this).closest('fieldset').find('input.cosupervisorEmailTextBox'));
            clearErrorAndValue($(this).closest('fieldset').find('input.cosupervisorDesignationTextBox'));

            $(this).closest('fieldset').find('select.cosupervisorNameSelector').show();

//            coSupNameTextBox.val('');
//            coSupNameTextBox.closest("td").removeClass("invalidEntry");
//            coSupNameTextBox.closest("td").siblings("td.fieldErrorPlacement").text("");
        }
        else {   //No
            $(this).closest('fieldset').find('select.cosupervisorNameSelector').hide();

            $(this).closest('fieldset').children('div#externalCoSupervisorFields').slideDown();
            $(this).closest('fieldset').find('input.cosupervisorNameTextBox').show();
            
            clearErrorAndValue($(this).closest('fieldset').find('select.cosupervisorNameSelector'));
//            coSupNameTextBox = $(this).closest('fieldset').find('input.cosupervisorNameTextBox');
//            coSupNameTextBox.closest("td").removeClass("invalidEntry");
//            coSupNameTextBox.closest("td").siblings("td.fieldErrorPlacement").text("");
        }
    });

    
//    $('form#formMSSpecialCourses select.cosupervisorNameSelector, form#formMSIndependentStudies select.affiliationWithLUMSSelector').each(function() {
//        selectedSupervisorText[this.id] = "";
//    });


//    $('form#formMSSpecialCourses select#ms_course_faculty_member_id').change(function() {
//        $('select.cosupervisorNameSelector').each(function() {
//            var currentlySelectedCosupervisor = $(this).children('option:selected').val();
//            if (selectedSupervisorText[this.id] != "")
//                $(this).append("<option value='"+ selectedSupervisorValue[this.id] +"'>" + selectedSupervisorText[this.id] + "</option>");
//            selectedSupervisorValue[this.id] = $('form#formMSSpecialCourses select#ms_course_faculty_member_id').children('option:selected').val();
//            selectedSupervisorText[this.id] = $('form#formMSSpecialCourses select#ms_course_faculty_member_id').children('option:selected').text();
//            $(this).children('option').remove(":contains('"+ selectedSupervisorText[this.id] +"')");
//            $(this).children('option').remove(":contains('Please Select')");
//            $(this).html($(this).children("option").sort(function (a, b) {
//                return a.text == b.text ? 0 : a.text < b.text ? -1 : 1;
//            }));
//            $(this).prepend("<option value=''>Please Select</option>");
//            if ($(this).children('option[value=' + currentlySelectedCosupervisor + ']').length != 0)
//                $(this).val(currentlySelectedCosupervisor);
//            else
//                $(this).val('');
//        });
//    });
});

//var selectedSupervisorText = {}, selectedSupervisorValue = {};