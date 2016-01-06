$(document).ready(function()
{
   /*********************************
    Student Add/Edit form validations
    *********************************/
    $("form#formStudent").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            'user[name]': {alpha:true,maxlength:30,required: true},
            'user[student_attributes][rollno]': {digits:true, rangelength: [8,8], min:0, required: true},
            'user[address]': {required: true},
            'user[contactnumber]': {contactNumberProperFormat:true, required: true},
            'user[email]': {email: true,required: true},
            'user[student_attributes][cgpa]': {number:true, min:0, max:4},
            'user[student_attributes][credithrstaken]': {digits:true, maxlength: 2, min:0},
            'user[student_attributes][currentsemester]': {digits:true},
            'user[student_attributes][FinancialAid_attributes][amount]': {number:true}
        },
        messages:
        {
            'user[name]':
            {
                alpha: "Only alphabets are allowed",
                maxlength: "Maximum {0} characters are allowed",
                required: "Please specify student name"
            },
            'user[student_attributes][rollno]':
            {
                digits: "Only digits are allowed",
                rangelength: "Must have {0} digits",
                min: "Must be greater than {0}",
                required: "Please specify student roll number"
            },
            'user[address]':
            {
                required: "Please specify student address"
            },
            'user[contactnumber]':
            {
                contactNumberProperFormat: "Proper format: +923331245129",
                required: "Please specify student contact number"
            },
            'user[email]':
            {
                email: "Proper format: name@domain.com",
                required: "Please specify student email address"
            },
            'user[student_attributes][cgpa]':
            {                
                number: "Must be a decimal number",
                min: "Must lie between 0 and {0}",
                max: "Must lie between 0 and {0}"
            },
            'user[student_attributes][credithrstaken]':
            {
                digits: "Only digits are allowed",
                maxlength: "Cannot have more than {0} digits",
                min: "Must be greater than {0}"
            },
            'user[student_attributes][currentsemester]':
            {
                digits: "Only digits are allowed"
            },
            'user[student_attributes][FinancialAid_attributes][amount]':
            {
                number: "Must be a decimal number"
            }
        }
    });




    /*******************************
    Course Add/Edit form validations
    ********************************/
    $("form#formCourse").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            'course[coursecode]': {maxlength:7, required: true},
            'course[coursename]': {alpha:true, required: true},
            'course[credithrs]': {digits:true, min:0, max:4, required: true}
        },
        messages:
        {
            'course[coursecode]':
            {
                maxlength: "Cannot have more than {0} digits",
                required: "Please specify the course code"
            },
            'course[coursename]':
            {
                alpha: "Only alphabets are allowed",
                required: "Please specify the course name"
            },
            'course[credithrs]':
            {
                digits: "Only digits are allowed",
                min: "Must be a positive number",
                max: "Must be less than 5",
                required: "Please specify the credit hours"
            }
        }
    });



    /************************
     Reports form validations
     ************************/
    $("form#postform").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        rules:
        {
            rollno: {digits:true, rangelength: [8,8], min:0, required: true}
        },
        messages:
        {
            rollno:
            {
                digits: "Only digits are allowed",
                rangelength: "Must have {0} digits",
                min: "Must be greater than {0}",
                required: "Please specify student roll number"
            }
        }
    });




    /**********************************
     Add Financial Aid form validations
     **********************************/
    $('form#formAddFinancialAid').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules: {
            'financial_aid[amount]': {number:true, maxlength: 8}
        },
        messages: {
            'financial_aid[amount]':
            {
                number: "Must be a decimal number",
                maxlength: "Maximum {0} digits are allowed"
            }
        }
    });


    function attachmentFieldCount() {
        var count=1;
        if ($('table.uploadedAttachmentsFields:first').length)
            count += $('table.uploadedAttachmentsFields:first').find('input:checkbox').length;
        $('table.uploadNewAttachmentsFields:first').find('input:file').each(function() {
           if ($(this).closest('div.fields').is(':visible'))
                count++;
        });
        return count;
    }


    var timerFinancialAid;
    $("form#formAddFinancialAid").bind("nested:beforeFieldAdded",function(event)
    {
        clearTimeout(timerFinancialAid);

        if (attachmentFieldCount() < 5)
        {
            var essentialInputBox = event.link.prev("div.fields").find("input:first");
            if (!essentialInputBox.length)
                essentialInputBox = $('input[id^="financial_aid_financial_assets_attributes"][type="file"]:first');

            var fieldsEmpty = false;
            if (!(essentialInputBox.is(':hidden') || essentialInputBox.parents(':hidden').length))
                fieldsEmpty = (/^\s*$/).test(essentialInputBox.val());

            if (fieldsEmpty)
            {
                var message = event.link.parent().next().children('span.dynamicFieldErrorPlacement');
                message.text('Please fill empty field first');
                if (message.is(':hidden'))
                    message.fadeIn('slow');
                else
                    message.fadeOut('fast', function() {
                        $(this).fadeIn();
                    });
                timerFinancialAid = setTimeout(function(){message.fadeOut('slow')},5000);
                event.link.data("bInsertNestedFields",false);
            }
            else
            {
                $('span.dynamicFieldErrorPlacement').fadeOut('fast');
                event.link.data("bInsertNestedFields",true);
            }
        }
        else
        {
            message = event.link.parent().next().children('span.dynamicFieldErrorPlacement');
            message.text('Attachment limit reached');
            if (message.is(':hidden'))
                message.fadeIn('slow');
            else
                message.fadeOut('fast', function() {
                    $(this).fadeIn();
                });
            timerStudentCourses = setTimeout(function(){message.fadeOut('slow')},5000);
            event.link.data("bInsertNestedFields",false);
        }
    });



    /***************************
     MS Courses form validations
     ***************************/
    $('form#formMSSpecialCourses').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules: {
            'ms_course[title]':{maxlength:250,required:true},
            'milestone[title]':{maxlength:250,required:true},
            'milestone[supervisorcomments]':{maxlength:250,required:true}
            },
        messages: {
            'ms_course[title]':
            {
                maxlength: "Maximum {0} characters are allowed",
                required: "Please specify the title"
            },
             'milestone[title]':
            {
                maxlength: "Maximum {0} characters are allowed",
                required: "Please specify the title"
            },
            'milestone[supervisorcomments]':
            {
                maxlength: "Maximum {0} characters are allowed",
                required: "Please specify the title"
            }
              
        }
    });


    $('form#formMSSpecialCourses input.cosupervisorNameTextBox').each(function() {
            $(this).rules("add", {
            alpha:true,
            required:true,
            maxlength:50,
            messages: {
                required:"Please specify the name",
                alpha: "Only alphabets are allowed",
                maxlength: "Maximum {0} characters are allowed"
            }
        });
    });

    $('form#formMSSpecialCourses input.cosupervisorEmailTextBox').each(function() {
        $(this).rules("add", {
            email:true,
            messages: {
                email: "Proper format: name@domain.com"
            }
        });
    });

    $('form#formMSSpecialCourses input.cosupervisorDesignationTextBox').each(function() {
        $(this).rules("add", {
            alpha:true,
            maxlength:100,
            messages: {
                alpha: "Only alphabets are allowed",
                maxlength: "Maximum {0} characters are allowed"
            }
        });
    });

    
    $('form#formMSSpecialCourses select.cosupervisorNameSelector').live('change', function() {
        var fieldErrorPlacement = $(this).closest("td").siblings("td.fieldErrorPlacement");
        var selectedText = $(this).children('option:selected').text();
        if (selectedText == "Please Select" || selectedText == "Please select")
        {
            $(this).closest("td").addClass("invalidEntry", 'slow');
            fieldErrorPlacement.hide();
            fieldErrorPlacement.text("Please specify").fadeIn('slow');
        }
        else
        {
            $(this).closest("td").removeClass("invalidEntry", 'slow');
            fieldErrorPlacement.fadeOut('slow');
            fieldErrorPlacement.text("");
            fieldErrorPlacement.show();
        }
        
    });



    $("form#formMSSpecialCourses").bind("nested:fieldAdded",function(event) {
        //event.field.find('select.cosupervisorNameSelector').prepend("<option value=''>Please Select</option>");

        event.field.find('input[id*=examinationdate]').each(function() {
           attachDynamicDatePicker($(this)); 
        });

        event.field.find('input[id*=reportdate]').each(function() {
           attachDynamicDatePicker($(this));
        });

        event.field.find('input[id*=fundingmonth]').each(function() {
           attachDynamicDatePicker($(this));
        });        

        if (event.field.children('.cosupervisors').length > 0)
        {
            event.field.find('input.cosupervisorNameTextBox').rules("add", {
                alpha:true,
                required:true,
                maxlength:50,
                messages: {
                    alpha: "Only alphabets are allowed",
                    required:"Please specify the name",
                    maxlength: "Maximum {0} characters are allowed"
                }
            });

            event.field.find('input.cosupervisorEmailTextBox').rules("add", {
                email:true,
                messages: {
                    email: "Proper format: name@domain.com"
                }
            });

            event.field.find('input.cosupervisorDesignationTextBox').rules("add", {
                alpha:true,
                maxlength:100,
                messages: {
                    alpha: "Only alphabets are allowed",
                    maxlength: "Maximum {0} characters are allowed"
                }
            });
        }
        else if (event.field.children('.grants').length > 0)
        {
            event.field.find('input.reportTotalAmountTextBox').rules("add",  {
                number:true,
                maxlength:8,
                messages: {
                    number: "Must be a decimal number",
                    maxlength: "Maximum {0} digit are allowed"
                }
            });

            event.field.find('input.reportUsedAmountTextBox').rules("add",  {
                number:true,
                maxlength:8,
                messages: {
                    number: "Must be a decimal number",
                    maxlength: "Maximum {0} digit are allowed"
                }
            });

            event.field.find('input.reportRemainingAmountTextBox').rules("add",  {
                number:true,
                maxlength:8,
                messages: {
                    number: "Must be a decimal number",
                    maxlength: "Maximum {0} digit are allowed"
                }
            });
        }
    });

    $('form#formMSSpecialCourses input.reportTotalAmountTextBox').each(function() {
        $(this).rules("add", {
            number:true,
            maxlength:8,
            messages: {
                number: "Must be a decimal number",
                maxlength: "Maximum {0} digit are allowed"
            }
        });
    });

    $('form#formMSSpecialCourses input.reportUsedAmountTextBox').each(function() {
        $(this).rules("add", {
            number:true,
            maxlength:8,
            messages: {
                number: "Must be a decimal number",
                maxlength: "Maximum {0} digit are allowed"
            }
        });
    });

    $('form#formMSSpecialCourses input.reportRemainingAmountTextBox').each(function() {
        $(this).rules("add", {
            number:true,
            maxlength:8,
            messages: {
                number: "Must be a decimal number",
                maxlength: "Maximum {0} digit are allowed"
            }
        });
    });




    var timerMSSpecialCourses;
    $("form#formMSSpecialCourses").bind("nested:beforeFieldAdded",function(event)
    {
        clearTimeout(timerMSSpecialCourses);
        
        var essentialInputBox = event.link.prev("div.fields").find("table input:first");
        var fieldsEmpty = false;
        if (!(essentialInputBox.is(':hidden') || essentialInputBox.parents(':hidden').length))
            fieldsEmpty = (/^\s*$/).test(essentialInputBox.val());

        if (fieldsEmpty)
        {
            var message = event.link.next('span.dynamicFieldErrorPlacement');
            if (message.is(':hidden'))
                message.show("slide", {direction: "left"});
            else
                message.fadeOut('fast', function() {
                    $(this).fadeIn();
                });
            timerMSSpecialCourses = setTimeout(function(){message.fadeOut('slow')},5000);
            event.link.data("bInsertNestedFields",false);
        }
        else
        {
            $('span.dynamicFieldErrorPlacement').fadeOut('fast');
            event.link.data("bInsertNestedFields",true);
        }
    });



    /********************************
     Student Courses form validations
     *******************************/

    $('form#formstudentCourses').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules: {
            'student_course[semester_id]': {required:true}
            //'student_course[course_id]': {required:true}
        },
        messages: {
            'student_course[semester_id]':
            {
                required: "Please specify the semester"
            },
            'student_course[course_id]':
            {
                required: "Please specify the course"
            }
        }
    });



    var timerStudentCourses;
    $("form#formstudentCourses").bind("nested:beforeFieldAdded",function(event)
    {
        clearTimeout(timerStudentCourses);

        if (attachmentFieldCount() < 5)
        {
            var essentialInputBox = event.link.prev("div.fields").find("input:first");
            if (!essentialInputBox.length)
                essentialInputBox = $('input[id^="student_course_course_assets_attributes"][type="file"]:first');

            var fieldsEmpty = false;
            if (!(essentialInputBox.is(':hidden') || essentialInputBox.parents(':hidden').length))
                fieldsEmpty = (/^\s*$/).test(essentialInputBox.val());

            if (fieldsEmpty)
            {
                var message = event.link.parent().next().children('span.dynamicFieldErrorPlacement');
                message.text('Please fill empty field first');
                if (message.is(':hidden'))
                    message.fadeIn('slow');
                else
                    message.fadeOut('fast', function() {
                        $(this).fadeIn();
                    });
                timerStudentCourses = setTimeout(function(){message.fadeOut('slow')},5000);
                event.link.data("bInsertNestedFields",false);
            }
            else
            {
                $('span.dynamicFieldErrorPlacement').fadeOut('fast');
                event.link.data("bInsertNestedFields",true);
            }
        }
        else
        {
            message = event.link.parent().next().children('span.dynamicFieldErrorPlacement');
            message.text('Attachment limit reached');
            if (message.is(':hidden'))
                message.fadeIn('slow');
            else
                message.fadeOut('fast', function() {
                    $(this).fadeIn();
                });
            timerStudentCourses = setTimeout(function(){message.fadeOut('slow')},5000);
            event.link.data("bInsertNestedFields",false);
        }
    });

    


    /***************************************
     Student Semesters Edit form validations
     **************************************/
    $('form#formEditStudentSemesters').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules: {
            'student_semester[semestergpa]': {number:true, min:0, max:4}
        },
        messages: {
            'student_semester[semestergpa]':
            {
                number: "Must be a decimal number",
                min: "Must lie between 0 and {0}",
                max: "Must lie between 0 and {0}"
            }
        }
    });



    var timerStudentSemesters;
    $("form#formEditStudentSemesters").bind("nested:beforeFieldAdded",function(event)
    {
        clearTimeout(timerStudentSemesters);

        if (attachmentFieldCount() < 5)
        {
            var essentialInputBox = event.link.prev("div.fields").find("input:first");
            if (!essentialInputBox.length)
                essentialInputBox = $('input[id^="student_semester_assets_attributes"][type="file"]:first');
            var fieldsEmpty = false;
            if (!(essentialInputBox.is(':hidden') || essentialInputBox.parents(':hidden').length))
                fieldsEmpty = (/^\s*$/).test(essentialInputBox.val());

            if (fieldsEmpty)
            {
                var message = event.link.parent().next().children('span.dynamicFieldErrorPlacement');
                message.text('Please fill empty field first');
                if (message.is(':hidden'))
                    message.fadeIn('slow');
                else
                    message.fadeOut('fast', function() {
                        $(this).fadeIn();
                    });
                timerStudentSemesters = setTimeout(function(){message.fadeOut('slow')},5000);
                event.link.data("bInsertNestedFields",false);
            }
            else
            {
                $('span.dynamicFieldErrorPlacement').fadeOut('fast');
                event.link.data("bInsertNestedFields",true);
            }
        }
        else
        {
            message = event.link.parent().next().children('span.dynamicFieldErrorPlacement');
            message.text('Attachment limit reached');
            if (message.is(':hidden'))
                message.fadeIn('slow');
            else
                message.fadeOut('fast', function() {
                    $(this).fadeIn();
                });
            timerStudentCourses = setTimeout(function(){message.fadeOut('slow')},5000);
            event.link.data("bInsertNestedFields",false);
        }
    });



    $("form#formMSSpecialCourses, form#formMSIndependentStudies").bind("nested:fieldRemoved",function(event)
    {
        event.field.find("input, select").each(function() {
            clearError($(this));
        });
    });



//    $('form#formMSSpecialCourses input.ms_course_thesisdefencedate').live('click', function(){
//
//        $(this).rules("add",
//        {
//            greaterThanEndDate:$(this).closest('tr').prev('tr').find('input:first'),
//            messages:
//            {
//                greaterThanEndDate:"Start date cannot be greater than end date"
//            }
//        })
//    });








    /***************************************
     MS Independent Studies form validations
     ***************************************/
    $('form#formMSIndependentStudies').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc
   });


   $('form#formMSIndependentStudies input.cosupervisorNameTextBox').each(function() {
        $(this).rules("add", {
            alpha:true,
            required:true,
            maxlength:50,
            messages: {
                alpha: "Only alphabets are allowed",
                required:"Please specify the name",
                maxlength: "Maximum {0} characters are allowed"
            }
        });
    });

    $('form#formMSIndependentStudies input.cosupervisorEmailTextBox').each(function() {
        $(this).rules("add", {
            email:true,
            messages: {
                email: "Proper format: name@domain.com"
            }
        });
    });

    $('form#formMSIndependentStudies input.cosupervisorDesignationTextBox').each(function() {
        $(this).rules("add", {
            alpha:true,
            maxlength:100,
            messages: {
                alpha: "Only alphabets are allowed",
                maxlength: "Maximum {0} characters are allowed"
            }
        });
    });

    $('form#formMSIndependentStudies input.independentStudyTitleTextBox').each(function() {
        $(this).rules("add", {
            maxlength:250,
            required:true,
            messages: {
                maxlength: "Max {0} characters allowed",
                required: "Please specify the title"
            }
        });
    });

    $('form#formMSIndependentStudies input.independentStudyCodeTextBox').each(function() {
        $(this).rules("add", {
            maxlength:7,
            required:true,
            messages: {
                maxlength: "Maximum {0} digits are allowed",
                required: "Please specify the code"
            }
        });
    });

    $('form#formMSIndependentStudies input.independentStudyCreditHoursTextBox').each(function() {
        $(this).rules("add", {
            digits:true,
            min:0,
            max:4,
            messages: {
                digits: "Only digits are allowed",
                min: "Must be a positive number",
                max: "Must be less than 5"
            }
        });
    });

    $("form#formMSIndependentStudies").bind("nested:fieldAdded",function(event)
    {
        //selectedSupervisorText[event.field.find('select.cosupervisorNameSelector').attr('id')] = "";
        if (event.field.children('.cosupervisors').length > 0)
        {
            //event.field.find('select.cosupervisorNameSelector').prepend("<option value=''>Please Select</option>");

            event.field.find('input.cosupervisorNameTextBox:first').rules("add", {
                alpha:true,
                required:true,
                maxlength:50,
                messages: {
                    alpha: "Only alphabets are allowed",
                    required:"Please specify the name",
                    maxlength: "Maximum {0} characters are allowed"
                }
            });

            event.field.find('input.cosupervisorEmailTextBox:first').rules("add", {
                email:true,
                messages: {
                    email: "Proper format: name@domain.com"
                }
            });

            event.field.find('input.cosupervisorDesignationTextBox:first').rules("add", {
                alpha:true,
                maxlength:100,
                messages: {
                    alpha: "Only alphabets are allowed",
                    maxlength: "Maximum {0} characters are allowed"
                }
            });
        }
        else if (event.field.children('.expanderHeaderBar').length > 0)
        {
            event.field.find('input.independentStudyTitleTextBox:first').rules("add", {
                maxlength:250,
                required:true,
                messages: {
                    maxlength: "Max {0} characters allowed",
                    required: "Please specify the title"
                }
            });

            event.field.find('input.independentStudyCodeTextBox:first').rules("add", {
                maxlength:7,
                required:true,
                messages: {
                    maxlength: "Maximum {0} digits are allowed",
                    required: "Please specify the code"
                }
            });

            event.field.find('input.independentStudyCreditHoursTextBox:first').rules("add", {
                digits:true,
                min:0,
                max:4,
                messages: {
                    digits: "Only digits are allowed",
                    min: "Must be a positive number",
                    max: "Must be less than 5"
                }
            });
        }
    });


//    $("form#formMSSpecialCourses").bind("nested:fieldRemoved",function(event) {
//
//    });

    var timerMSIndependentStudies;
    $("form#formMSIndependentStudies").bind("nested:beforeFieldAdded",function(event)
    {
        clearTimeout(timerMSIndependentStudies);
        var essentialInputBox = event.link.prev("div.fields").find("table input:first");
        var fieldsEmpty = false;
        var errorMessageSpan = event.link.next('span.dynamicFieldErrorPlacement');

        if (event.link.prev("div.fields").children("div.cosupervisors").length > 0)
        {
            if (!(essentialInputBox.is(':hidden') || essentialInputBox.parents(':hidden').length))
                fieldsEmpty = (/^\s*$/).test(essentialInputBox.val());
            if (fieldsEmpty)
            {
                if (errorMessageSpan.is(':hidden'))
                    errorMessageSpan.show("slide", {direction: "left"});
                else
                    errorMessageSpan.fadeOut('fast', function() {
                        $(this).fadeIn();
                    });
                timerMSIndependentStudies = setTimeout(function(){errorMessageSpan.fadeOut('slow')},5000);
                event.link.data("bInsertNestedFields",false);
            }
            else
            {
                $('span.dynamicFieldErrorPlacement').fadeOut('fast');
                event.link.data("bInsertNestedFields",true);
            }
        }
        else if (event.link.prev("div.fields").children("div.expanderHeaderBar").length > 0)
        {
            fieldsEmpty = (/^\s*$/).test(essentialInputBox.val()) && (/^\s*$/).test(event.link.prev("div.fields").find("table input:first").val());
            if (fieldsEmpty)
            {
                if (errorMessageSpan.is(':hidden'))
                    errorMessageSpan.show("slide", {direction: "left"});
                else
                    errorMessageSpan.fadeOut('fast', function() {
                        $(this).fadeIn();
                    });
                timerMSIndependentStudies = setTimeout(function(){errorMessageSpan.fadeOut('slow')},5000);
                event.link.data("bInsertNestedFields",false);
            }
            else
            {
                $('span.dynamicFieldErrorPlacement').fadeOut('fast');
                event.link.data("bInsertNestedFields",true);
            }
        }
    });




    $("form#formMSSpecialCourses input[id*=examinationdate]").each(function()
    {
        //no need for visible check because the fields are not required.
        attachDynamicDatePicker($(this))
    });

    $("form#formMSSpecialCourses input[id*=reportdate]").each(function()
    {
        //no need for visible check because the fields are not required.
        attachDynamicDatePicker($(this))
    });
    $("form#formMSSpecialCourses input[id*=fundingmonth]").each(function()
    {
        //no need for visible check because the fields are not required.
        attachDynamicDatePicker($(this))
    });
        /************************
     CSV Import form validations
     ************************/
    $("form#csvimportform").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        rules:
        {
           'upload_check[uploadfile]': { required: true}
        },
        messages:
        {
             'upload_check[uploadfile]':
            {
               required: "Please select CSV file"
            }
        }
    });

    $("form#csvstudentsemesterform").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        rules:
        {
           'upload_check[uploadfile]': { required: true}
        },
        messages:
        {
             'upload_check[uploadfile]':
            {
               required: "Please select CSV file"
            }
        }
    });

    $("form#csvphd").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        rules:
        {
           'upload_check[uploadfile]': { required: true}
        },
        messages:
        {
             'upload_check[uploadfile]':
            {
               required: "Please select CSV file"
            }
        }
    });

    $("form#csvthesis").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        rules:
        {
           'upload_check[uploadfile]': { required: true}
        },
        messages:
        {
             'upload_check[uploadfile]':
            {
               required: "Please select CSV file"
            }
        }
    });

    $("form#csvstudy").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        rules:
        {
           'upload_check[uploadfile]': { required: true}
        },
        messages:
        {
             'upload_check[uploadfile]':
            {
               required: "Please select CSV file"
            }
        }
    });
});