$(document).ready(function()
{



     $('.clsInvHistory').flexigrid({
        height:'auto',
        colModel : [
		{display: 'User', name : 'user_id', width : 240, sortable : true, align: 'left'},
                {display: 'Start Date', name : 'startdate', width : 240, sortable : true, align: 'center'},
		{display: 'End Date', name : 'enddate', width : 240, sortable : true, align: 'center'},
		
                      ]
    });

   $('.clsLocHistory').flexigrid({
        height:'auto',
        width : 578,
        colModel : [
		{display: 'User', name : 'user_id', width : 200, sortable : true, align: 'left'},
                {display: 'Start Date', name : 'startdate', width : 170, sortable : true, align: 'center'},
		{display: 'End Date', name : 'enddate', width : 170, sortable : true, align: 'center'},

                      ]
    });
    
//    jQuery.validator.addMethod("alpha", function(value, element)
//    {
//        return this.optional(element) || value == value.match(/^[a-zA-Z ]+$/);
//    },
//    "Only Characters Allowed.");

    jQuery.validator.addMethod("digit", function(value, element)
    {
        return this.optional(element) || value == value.match(/^[0-9]+$/);
    },
    "Only Digits Allowed.");

    jQuery.validator.addMethod("alphadigit", function(value, element)
    {
        return this.optional(element) || value == value.match(/^(?:[^\W_]|\s|[\._-])*$/);
    },
    "Special characters are not Allowed.");

//    jQuery.validator.addMethod("contactNumberProperFormat", function(value, element)
//    {
//        return this.optional(element) || value == value.match(/^\+(?:[0-9] ?){6,14}[0-9]$/);
//    },
//    "Contact number is not in proper format.");


    $('#startdate').keyup(function() {
        $('span.error-keyup-1').hide();
        var inputVal = $(this).val();
    //numeric character only
    var numericReg = /^(?:[^\W_]|\s|[\._-])*$/;
        if(!numericReg.test(inputVal)) {
            $(this).after('<span class="error error-keyup-1"> Special characters are not allowed</span>');
        }
    });


       $("#formLocation *[id*=startdate]").each(function()
        {
                attachDynamicDatePicker($(this))
         })



       $("#formLocation *[id*=enddate]").each(function()
        {
                attachDynamicDatePicker($(this))
         })



    $("#forminventory").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            "inventory[inventory_type_id]": {required: true},
            "inventory[inventory_status_id]": {required: true},
            "inventory[inventoryname]": {alphadigit:true, maxlength:30, required: true},
            "inventory[brand]": {alphadigit:true, maxlength:30, required: true},
            "inventory[model]": {alphadigit:true, maxlength:30, required: true},
            "inventory[barcode]": {digit:true,minlength:7, maxlength:7},
//Printer Info
            "inventory[printer_attributes][technology]":{alphadigit:true, maxlength:30},
            "inventory[printer_attributes][speed]":{alphadigit:true, maxlength:30},
            "inventory[printer_attributes][memory]":{alphadigit:true, maxlength:30},
            "inventory[printer_attributes][mediatype]":{alphadigit:true, maxlength:30},
//Scanner Info
            "inventory[scanner_attributes][scannertype]":{alphadigit:true, maxlength:30},
            "inventory[scanner_attributes][resolution]":{alphadigit:true, maxlength:30},
            "inventory[scanner_attributes][scansize]":{alphadigit:true, maxlength:30},
            "inventory[scanner_attributes][fileformate]":{alphadigit:true, maxlength:30},
//LCD Info
            "inventory[lcd_attributes][lcdtype]":{alphadigit:true, maxlength:30},
            "inventory[lcd_attributes][resolution]":{alphadigit:true, maxlength:30},
            resolutionlcd:{alphadigit:true, maxlength:30},
            "inventory[lcd_attributes][size]":{alphadigit:true, maxlength:30},
            sizelcd:{alphadigit:true, maxlength:30},
//CPU Info
            "inventory[cpu_attributes][processorname]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][numberofcores]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][numberofthreads]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][cpumemory]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][hard_disk]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][dvdrom]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][cdrom]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][keyboard]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][mouse]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][sound_card]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][vga]":{alphadigit:true, maxlength:30},
            "inventory[cpu_attributes][ram]":{alphadigit:true, maxlength:30}

 
        },
        messages:
        {
           "inventory[inventory_status_id]":
            {
                required: "Please specify inventory status"
            },
           "inventory[inventory_type_id]":
            {
                required: "Please specify inventory type"
            },
           "inventory[inventoryname]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength: "Maximum {0} characters are allowed",
                required: "Please specify inventory name"
            },
            "inventory[brand]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength: "Maximum {0} characters are allowed",
                required: "Please specify Brand"
            },
            "inventory[model]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed",
                required:   "Please specify Model"
            },
            "inventory[barcode]":
            {
                digit: "Only digits allowed",
                minlength:  "Minimum {0} characters are allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[printer_attributes][technology]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[printer_attributes][speed]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[printer_attributes][memory]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[printer_attributes][mediatype]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },

//Scanner Info
            "inventory[scanner_attributes][scannertype]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[scanner_attributes][resolution]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[scanner_attributes][scansize]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[scanner_attributes][fileformate]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
//LCD Info

            "inventory[lcd_attributes][lcdtype]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[lcd_attributes][resolution]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            resolutionlcd:
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[lcd_attributes][size]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            sizelcd:
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
//CPU Info

            "inventory[cpu_attributes][processorname]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][numberofcores]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][numberofthreads]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][cpumemory]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][hard_disk]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][dvdrom]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][cdrom]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][keyboard]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][mouse]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][sound_card]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][vga]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            },
            "inventory[cpu_attributes][ram]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength:  "Maximum {0} characters are allowed"
            }
        }


    });


    $("#formRA").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,


        rules:
        {
            "user[name]": {alpha:true, maxlength:30, required: true},
            "user[address]": {required: true, maxlength:250},
            "user[contactnumber]": {contactNumberProperFormat:true, required: true},
            "user[email]": {email: true, required: true},
            "user[research_assistant_attributes][employee_id]": {alphadigit:true, maxlength:30, required: true}
        },
        messages:
        {
            "user[name]":
            {
                    required :"Please enter a valid name",
                    alpha    : "Only alphabets are allowed",
                    maxlength:"Maximum {0} characters are allowed"
            },
           "user[address]":
            {
                required: "Please specify address",
                maxlength:"Maximum {0} characters are allowed"
            },
           "user[contactnumber]":
            {
                contactNumberProperFormat: "Required format: +923331245129",
                required: "Please specify contact number"
            },
           "user[email]":
            {
                email: "Required format: name@domain.com",
                required: "Please specify email address"
            },
           "user[research_assistant_attributes][employee_id]":
           {
                alphadigit: "Special characters are not allowed",
                required: "Please enter Employee ID",
                maxlength:"Maximum {0} characters are allowed"
           }
            
        }
    });


    $("#formTA").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            "user[name]": {alpha:true, maxlength:30, required: true},
            "user[address]": {required: true, maxlength:250},
            "user[contactnumber]": {contactNumberProperFormat:true, required: true},
            "user[email]": {email: true, required: true},
            "user[t_assistant_attributes][employee_id]": {alphadigit:true, maxlength:30, required: true},
            "user[t_assistant_attributes][evalgpa]": {number:true, min:0, max:4}
        },
        messages:
        {
            "user[name]":
            {
                    required :"Please enter a valid name",
                    alpha     : "Only alphabets are allowed",
                    maxlength:"Maximum {0} characters are allowed"
            },
           "user[address]":
            {
                required: "Please specify address",
                maxlength:"Maximum {0} characters are allowed"
            },
           "user[contactnumber]":
            {
                contactNumberProperFormat: "Required format: +923331245129",
                required: "Please specify contact number"
            },
           "user[email]":
            {
                email: "Required format: name@domain.com",
                required: "Please specify email address"
            },
           "user[t_assistant_attributes][employee_id]":
           {
                alphadigit: "Special characters are not allowed",
                required: "Please enter Employee ID",
                maxlength:"Maximum {0} characters are allowed"
           },
           "user[t_assistant_attributes][evalgpa]":
            {
                number: "Must be a decimal number",
                min: "Must lie between 0 and {0}",
                max: "Must lie between 0 and {0}"
            }
        }
    });

    $("#formUS").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            "user[name]": {alpha:true, maxlength:30, required: true},
            "user[address]": {required: true, maxlength:250},
            "user[contactnumber]": {contactNumberProperFormat:true, required: true},
            "user[email]": {email: true, required: true},
            "user[ustudent_attributes][employee_id]": {alphadigit:true, maxlength:30, required: true}
        },
        messages:
        {
            "user[name]":
            {
                    required :"Please enter a valid name",
                    alpha     : "Only alphabets are allowed",
                    maxlength:"Maximum {0} characters are allowed"
            },
           "user[address]":
            {
                required: "Please specify address",
                maxlength:"Maximum {0} characters are allowed"
            },
           "user[contactnumber]":
            {
                contactNumberProperFormat: "Required format: +923331245129",
                required: "Please specify contact number"
            },
           "user[email]":
            {
                email: "Required format: name@domain.com",
                required: "Please specify email address"
            },
           "user[ustudent_attributes][employee_id]":
           {
                alphadigit: "Special characters are not allowed",
                required: "Please enter Student ID",
                maxlength:"Maximum {0} characters are allowed"
           }

        }
    });

    $("#formAS").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            "user[name]": {alpha:true, maxlength:30, required: true},
            "user[address]": {required: true, maxlength:250},
            "user[contactnumber]": {contactNumberProperFormat:true, required: true},
            "user[email]": {email: true, required: true},
            "user[astaff_attributes][employee_id]": {alphadigit:true, maxlength:30, required: true}
        },
        messages:
        {
            "user[name]":
            {
                    required :"Please enter a valid name",
                    alpha     : "Only alphabets are allowed",
                    maxlength:"Maximum {0} characters are allowed"
            },
           "user[address]":
            {
                required: "Please specify address",
                maxlength:"Maximum {0} characters are allowed"
            },
           "user[contactnumber]":
            {
                contactNumberProperFormat: "Required format: +923331245129",
                required: "Please specify contact number"
            },
           "user[email]":
            {
                email: "Required format: name@domain.com",
                required: "Please specify email address"
            },
           "user[astaff_attributes][employee_id]":
           {
                alphadigit: "Special characters are not allowed",
                required: "Please enter Employee ID",
                maxlength:"Maximum {0} characters are allowed"
           }

        }
    });


    $("#formLocation").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            "room_detail[roomnumber]":    {alphadigit:true, maxlength:30, required: true},
            "room_detail[location_type_id]":{required: true},
            "room_detail[roomname]":    {alphadigit:true, maxlength:30},
//            "room_detail[locations_attributes][0][locationname]":  {alphadigit:true, maxlength:30, required: true},
//            locname:       {alphadigit:true, required: true}
        },
        messages:
        {

        "room_detail[roomnumber]":
            {
                alphadigit: "Special characters are not allowed",
                required: "Please enter the Room number",
                maxlength:"Maximum {0} characters are allowed"
            },
        "room_detail[location_type_id]":
            {
                required: "Please select Room type"
            },
        "room_detail[roomname]":
            {
                alphadigit: "Special characters are not allowed",
                maxlength: "Maximum {0} characters are allowed"
            }
//            },
//         "room_detail[locations_attributes][0][locationname]":
//           {
//                alphadigit: "Special characters are not allowed",
//                required: "Please enter Location name",
//                maxlength:"Maximum {0} characters are allowed"
//           },
//         locname:
//           {
//                alphadigit: "Special characters are not allowed",
//                required: "Please enter Location name"
//           }
        }
    });



    $("#postform").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
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

    $("#formTACourses").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,

        rules:
        {
            "ta_course[evalgpa]"    : {number:true, min:0, max:4},
            "ta_course[semester_id]": {required: true},
            "ta_course[course_id]"  : {required: true}
        },
        messages:
        {
            "ta_course[evalgpa]":
            {
                number: "Must be a decimal number",
                min: "Must lie between 0 and {0}",
                max: "Must lie between 0 and {0}"
            },
            "ta_course[semester_id]":
            {
            required: "Please specify semester"
            },
            "ta_course[course_id]":
            {
            required: "Please specify course"
            }
        }
    });


    $("#formCSV").validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules:
        {
            "inventoryfile[uploadfile]": {required: true}
        },
        messages:
        {
            "inventoryfile[uploadfile]":
            {
                required: "Please select a file to load"
            }
        }
    });


  $("#invendDate").change(function(i,obj)
                     { 
                     });
                     
//    $("#formIndexPopup").validate(
//    {
//
//    alert("hello");
//        var startDt= $("#invstartDate").attr("value");
//        var endDt=$("#invendDate").attr("value");
//        alert(compareDates(startDt,endDt,0));
    
//        if( (new Date(startDt).getTime() > new Date(endDt).getTime()))
//        {
//
//        }


//        highlight: globalClientSideValidationFunctions.highlightFunc,
//        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
//        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
//        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
//



//        rules:
//        {
//            "ta_course[evalgpa]": {number:true, min:0, max:4}
//        },
//        messages:
//        {
//            "ta_course[evalgpa]":
//            {
//                number: "Must be a decimal number",
//                min: "Must lie between 0 and {0}",
//                max: "Must lie between 0 and {0}"
//            }
//        }
//    });

});