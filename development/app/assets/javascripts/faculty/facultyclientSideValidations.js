
function validateForm(form)
{
    form.validate(
    {
        highlight:globalClientSideValidationFunctions.highlightFunc,
        unhighlight:globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement:globalClientSideValidationFunctions.errorPlacementFunc
    });
}
var alphabetRule =
{
    alpha:true,
    messages:
    {
        alpha:"Only alphabets are allowed"
    }
}

var alphabetAndCommonCharacterRule =
{
    alphabetsAndCommonCharacters:true,
    messages:
    {
        alphabetsAndCommonCharacters:"No special characters&digits"
    }
}
$(document).ready(function()
{
    $("#formPublications").validate(
    {
        highlight:globalClientSideValidationFunctions.highlightFunc,
        unhighlight:globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement:globalClientSideValidationFunctions.errorPlacementFunc,

        rules:
        {

            'publication[publicationstatus]': {
                alpha:true,
                maxlength:30,
                required: true
            },
            'publication[abstract]':{
                maxlength:500
            },
            'publication[doi]':{
                URL:true
            },
            'publication[pages]':{
                pageRange:true
            },
            'publication[journal_publication_attributes][journalname]':{
                //                numbersAndCharacters:true,
                maxlength:250,
                required:true
            },
            'publication[journal_publication_attributes][volume]':{
                //                journalVolume:true,
                digits:true
            //                required:true
            },
            'publication[journal_publication_attributes][issuenumber]':{
                //                IssueNumber:true,
                digits:true
            //                required:true
            },
            "publication[journal_publication_attributes][impactfactor]":
            {
                impactFactor:true
            },

            'publication[journal_publication_attributes][reference]':{
                numbersAndCharacters:true,
                maxlength:250

            },
            'publication[journal_publication_attributes][referenceweb]':{
                URL:true

            },

            'publication[workshop_publication_attributes][workshopname]': {
                //                numbersAndCharacters:true,
                maxlength:250,
                required:true
            },
            'publication[workshop_publication_attributes][conferencename]':{
                numbersAndCharacters:true,
                maxlength:250
            },
            'publication[workshop_publication_attributes][website]': {
                required:true
            },            
            'publication[workshop_publication_attributes][city]' : {
                alpha:true,
                maxlength:30
            },

            'publication[conference_publication_attributes][conferencename]':{
                //                numbersAndCharacters:true,
                maxlength:250
            //                required:true
            },
            'publication[conference_publication_attributes][website]':{
                URL:true,
                required:true
            },
            'publication[conference_publication_attributes][conferencewebsite]':{
                URL:true,
                required:true
            },
            'publication[conference_publication_attributes][reference]':{
                numbersAndCharacters:true,
                maxlength:250
                
            },
            'publication[conference_publication_attributes][referenceweb]':{
                URL:true
                
            },


            'publication[conference_publication_attributes][city]':{
                alpha:true,
                maxlength:30
            },
            'publication[conference_publication_attributes][acceptancerate]':{
                percentage:true
            },

            'publication[book_publication_attributes][publishername]':{
            //                alpha:true
            },
            'publication[book_chapter_publication_attributes][bookname]':{
            //                required:true
            },
            'publication[book_chapter_publication_attributes][publishername]':{
            //                alpha:true
            },
            'publication[technical_report_publication_attributes][technicalreportnumber]':{
                //                digits:true,
                required:true
            },
            'author_external_entity_name' :{
                alpha:true
            }
        },
        messages:
        {
            'publication[publicationstatus]':
            {
                alpha: "Only alphabets are allowed",
                required: "Please enter the publication status",
                maxlength:"Only {0} characters are allowed"
            },
            'publication[abstract]':
            {
                required: "Please enter the abstract",
                maxlength:"Only {0} characters are allowed"
            },
            'publication[doi]':
            {
                URL:"Please enter valid url"
            },
            'publication[pages]':
            {
                pageRange:"Only digits are allowed"
            },
            'publication[journal_publication_attributes][journalname]':
            {
                //                numbersAndCharacters: "No special characters are allowed",
                maxlength:"Only {0} characters are allowed",
                required : "Please enter journal name"
            },
            'publication[journal_publication_attributes][volume]':
            {
                //                journalVolume: "Please enter journal volume between 1 and 1000",
                digtis :"Only numbers are allowed"
            //                required : "Please enter the name of journal"
            },
            'publication[journal_publication_attributes][issuenumber]':
            {
                //                IssueNumber: "Please enter issue number between 1 and 12",
                digtis :"Only numbers are allowed"
            //                required : "Please enter the issue number"
            },
            "publication[journal_publication_attributes][impactfactor]":
            {
                impactFactor: "Impact factor can be up to 2 decimal places",
                digtis :"Only numbers are allowed"
            },
            'publication[journal_publication_attributes][referenceweb]':
            {
                URL:"Please enter a valid url e.g. www.google.com"
            },
            'publication[journal_publication_attributes][reference]':
            {
                numbersAndCharacters: "Special characters are not allowed. Only 100 characters ",
                maxlength:"Only {0} characters are allowed"
            },
            'publication[workshop_publication_attributes][workshopname]':
            {
                //                numbersAndCharacters: "Special characters are not allowed",
                maxlength: "Maximum {0} characters are allowed",
                required: "Please enter the name of workshop "
            },
            'publication[workshop_publication_attributes][conferencename]':
            {
                numbersAndCharacters: "Special characters are not allowed",
                maxlength: "Maximum {0} characters are allowed",
                required: "Please enter the name of conference "
            },
            'publication[workshop_publication_attributes][website]':
            {
                URL:"Please enter valid url",
                required:"Please enter a website"
            },
            'publication[workshop_publication_attributes][conferencewebsite]':
            {
                URL:"Please enter valid url",
                required:"Please enter a website"
            },
            'publication[workshop_publication_attributes][city]':
            {
                alpha: "Must have alphabets",
                maxlength: "Maximum {0} characters are allowed"
            },
            'publication[conference_publication_attributes][conferencename]':
            {
                //                numbersAndCharacters: "Special characters are not allowed",
                maxlength:"Only {0} characters are allowed"
            //                required: "Please enter the conference name"
            },
            'publication[conference_publication_attributes][website]':
            {
                URL:"Please enter valid url",
                required:"Please enter a valid url"
            },
            'publication[conference_publication_attributes][referenceweb]':
            {
                URL:"Please enter valid url",
                required:"Please enter a valid url"
            },
            'publication[conference_publication_attributes][reference]':
            {
                numbersAndCharacters: "Special characters are not allowed. Only 100 characters ",
                maxlength:""                
            },
            'publication[conference_publication_attributes][city]':
            {
                alpha:"e.g. Islamabad",
                maxlength: "Maximum {0} characters are allowed"
            },
            'publication[conference_publication_attributes][acceptancerate]':
            {
                percentage:"Enter values between 0 and 100"
            },
            'publication[book_publication_attributes][publishername]':
            {
            //                alpha:"Only alphabets are allowed."
            },
            'publication[book_chapter_publication_attributes][bookname]':
            {
            //                required:"Please enter a book name"
            },
            'publication[book_chapter_publication_attributes][publishername]':
            {
            //                alpha:"Only alphabets are allowed."
            },
            'publication[technical_report_publication_attributes][technicalreportnumber]':
            {
                //                digits:"Only digits are allowed.",
                required:"Please enter a technical report number"
            },
            'author_external_entity_name' :
            {
                alpha:"Only alphabets are allowed."
            }
        }
    });

    $("#formPublications #addAuthorsLink").click(function()
    {
        $("#authorData").show()
    //        $("#author_external_entity_name").rules("add",
    //        {
    //            maxlength:5
    //        })
    })
    
    validateForm($("#formFacultyMember"))

    if ($("#formFacultyMember #txname").length > 0)
    {
        $("#txname").rules("add",
        {
            alpha:true,
            maxlength:50,
            required:true,
            messages:
            {
                required :"Please enter a valid name",
                alpha     : "Only alphabets are allowed",
                maxlength:"Maximum {50} characters are allowed"
            }
        });
    }
    if ($("#formFacultyMember #txdesignation").length > 0)
    {
        $("#txdesignation").rules("add",
        {
            alpha:true,
            maxlength:30,
            required:true,
            messages:
            {
                required :"Please enter a valid designation",
                alpha     : "Only alphabets are allowed",
                maxlength:"Maximum {30} characters are allowed"
            }
        });
    }
    if ($("#formFacultyMember #csDepartments").length > 0)
    {
        $("#csDepartments").rules("add",
        {
            required:true,
            messages:
            {
                required :"Please select a department"
            }
        });
    }
    if ($("#formFacultyMember #txaddress").length > 0)
    {
        $("#txaddress").rules("add",
        {
            required:true,
            maxlength:250,
            messages:
            {
                required :"Please enter an address",
                maxlength: "Maximum {250} characters are allowed"
            }
        });
    }
    if ($("#formFacultyMember #txmobileno").length > 0)
    {
        $("#txmobileno").rules("add",
        {
            contactNumberProperFormat :true,
            messages:
            {
                contactNumberProperFormat: "Required format: +923331245129"
            }
        });
    }
    if ($("#formFacultyMember #txofficeno").length > 0)
    {
        $("#txofficeno").rules("add",
        {
            contactNumberProperFormat :true,
            required:true,
            messages:
            {
                required:"Please enter a valid office number",
                contactNumberProperFormat: "Required format: +923331245129"
            }
        });
    }
    
    if ($("#formFacultyMember #txemailaddress").length > 0)
    {
        $("#txemailaddress").rules("add",
        {

            required:true,
            email:true,
            messages:
            {
                required:"Please enter a valid email address",
                email: "Required format: name@domain.com"
            }
        });
    }
    if ($("#formFacultyMember #txsecondaryemailaddress").length > 0)
    {
        $("#txsecondaryemailaddress").rules("add",
        {
            email:true,
            messages:
            {
                email: "Required format: name@domain.com"
            }
        });
    }
    

    //add validations for job experiences fields in the faculty member form
    $("#formFacultyMember *[id*=job_experiences]").each(function()
    {         
        if ($(this).attr("id").indexOf("designation") > -1)
        {
            $(this).rules("add",alphabetAndCommonCharacterRule)
            $(this).rules("add",
            {
                maxlength:50,
                messages:
                {
                    maxlength:"Max {0} characters allowed"
                }
            })
        }
        else if ($(this).attr("id").indexOf("organization")>-1)
        {
            $(this).rules("add",
            {
                required:true,
                maxlength:50,
                messages:
                {
                    required:"Please enter an organization",
                    maxlength:"Max {0} characters allowed"
                }
            })
        }
        else if ($(this).attr("id").indexOf("to_year") > -1)
        {
            $(this).rules("add",
            {
                greaterThan:$(this).closest('tr').prev('tr').find("select:first"),
                messages:
                {
                    greaterThan:"cannot be less than from year"
                }
            })
        }
    })

    //add validations for educational information
    $("#formFacultyMember *[id*=educational_information]").each(function()
    {
        if ($(this).attr("id").indexOf("degree")>-1)
        {
            $(this).rules("add",
            {
                required:true,
                maxlength:30,
                messages:
                {
                    required:"Please enter a degree",
                    maxlength:"Max {0} characters allowed"
                }
            })
        }
        else
        {
            $(this).rules("add",
            {
                required:true,
                maxlength:50,
                messages:
                {
                    required:"Please enter a university",
                    maxlength:"Max {0} characters allowed"
                }
            })
        }
    })
    $("#formFacultyMember input[id*=awards_information]").each(function()
    {
        $(this).rules("add",
        {
            required:true,
            maxlength:30,
            messages:
            {
                required:"Please enter a title",
                maxlength:"Max {0} characters allowed"
            }
        })
    })
    // add validations for inter-disciplinary collaborators fields in the faculty member form
    $("#formFacultyMember *[id*=inter_disciplinary_collaborators]").each(function()
    {
        if ($(this).attr("id").indexOf("name")>-1)
        {
            $(this).rules("add",alphabetRule)
            $(this).rules("add",
            {
                required:true,
                maxlength:30,
                messages:
                {
                    required:"Please enter a name",
                    maxlength:"Max {0} characters allowed"
                }

            })
        }
        else if ($(this).attr("id").indexOf("affiliation")>-1)
        {
          $(this).rules("add",alphabetRule)
          $(this).rules("add",
          {
            required:true,
            maxlength:30,
            messages:
            {
              required:"Please enter an affliation",
              maxlength:"Max {0} characters allowed"
            }

          })
        }
        else if ($(this).attr("id").indexOf("date")>-1)
        {
            attachDynamicDatePicker($(this))
            if ($(this).attr("id").indexOf("enddate")>-1)
            {
                $(this).rules("add",
                {
                    greaterThanEndDate:$(this).closest('tr').prev('tr').find('input:first'),
                    messages:
                    {
                        greaterThanEndDate:"cannot be less than start date"
                    }
                })
            }
        }
    })

    validateForm($("#formGrant"))
    $("#formGrant").find("#txgranttitle").each(function()
    {
        $(this).rules("add",
        {
            numbersAndCharacters:true,
            maxlength:250,
            required:true,
            messages:
            {
                required :"Please enter a grant title.",
                numbersAndCharacters:"No Special Characters allowed",
                maxlength:"Maximum {250} characters are allowed"
            }
        });
    })
    $("#formGrant").find("#txgrantnumber").each(function()
    {
        $(this).rules("add",
        {
            numbersAndCharacters:true,
            required:true,
            messages:
            {
                required :"Please enter a grant number.",
                numbersAndCharacters:"No Special Characters allowed"
            }
        });
    })
    $("#formGrant").find("#txfundingagency").each(function()
    {
        $(this).rules("add",
        {
            required:true,
            maxlength:100,
            messages:
            {
                required :"Please enter a funding agency.",
                maxlength:"Maximum {100} characters are allowed"
            }
        });
    })
    $("#formGrant").find("#txamount").each(function()
    {
        $(this).rules("add",
        {
            number:true ,
            required:true,
            messages:
            {
                number :"Please enter a number",
                required:"Please specify an amount"
            }
        });
    })

    $("#formGrant").find("#principleinvestigator_id").each(function()
    {
        $(this).rules("add",
        {
            required:true,
            messages:
            {
                required:"Please select a principle investigator"
            }
        })
    })
    if($("#formGrant #external_pi_name").length>0)
    {
        $("#external_pi_name").rules("add",
        {
            alpha:true,
            required:true,
            maxlength:50,
            messages:
            {
                required:"Please enter the external pi name.",
                alpha:"Only alphabets are allowed",
                maxlength:"Maximum {0} characters are allowed"
            }
        })
        $("#external_pi_affiliation").rules("add",alphabetAndCommonCharacterRule)
    }

    $("#formGrant input[id*=external_entity_name],#formPublications input[id*=external_entity_name]").each(function()
    {
        //no need for visible check because the fields are not required.
        $(this).rules("add",alphabetRule)
        $(this).rules("add",
        {
            maxlength:30,
            messages:{
                maxlength:"Max {0} characters allowed"
            }
        })
    })
    $("#formGrant input[id*=team_members]").each(function()
    {
        //no need for visible check because the fields are not required.
        if ($(this).attr("id").indexOf("designation")>-1)
        {
            $(this).rules("add",alphabetRule)
            $(this).rules("add",
            {
                required:true,
                maxlength:50,
                messages:
                {
                    required:"Please enter a designation",
                    maxlength:"Max {0} characters allowed"
                }
            })
        }
        else
        {
            attachDynamicDatePicker($(this))
            if ($(this).attr("id").indexOf("enddate")>-1)
            {
                $(this).rules("add",
                {
                    greaterThanEndDate:$(this).closest('tr').prev('tr').find('input:first'),
                    messages:
                    {
                        greaterThanEndDate:"cannot be less than start date"
                    }
                })
            }
        }
    })
    $("#formGrant input[id*=affiliationname],#formPublications input[id*=affiliationname]").each(function()
    {
        //no need for visible check because the fields are not required.
        $(this).rules("add",alphabetAndCommonCharacterRule)
        $(this).rules("add",
        {
            maxlength:50,
            messages:{
                maxlength:"Max {0} characters allowed"
            }
        })
    })

    

    if ($("#txpublicationtitle").length > 0)
    {
        $("#txpublicationtitle").rules("add",
        {
            //            numbersAndCharacters:true,
            maxlength:250,
            required:true,
            messages:
            {
                numbersAndCharacters: "No Special characters allowed",
                maxlength:"Only {250} characters are allowed",
                required: "Please enter the title"
            }
        });
    }
    
    if ($("#txenddate").length > 0)
    {
        $("#txenddate").rules("add",
        {
            greaterThanEndDate:"#txstartdate",
            messages:
            {
                greaterThanEndDate:"Start date must be before end date"
            }
        });
    }

    if ($("#txjoiningdate").length>0)
    {
        $("#txjoiningdate").rules("add",
        {
            greaterThanEndDate:"#txdate",
            messages:
            {
                greaterThanEndDate:"Date of birth must be before joining date"
            }
        })
    }

    $('#formFacultyCourses').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules: {
            'faculty_course[noofstudents]':{
                digit:true
            },
            'faculty_course[contribution]': {
                digit:true
            }
        },
        
        messages: {
            'faculty_course[noofstudents]':
            {
                digit: "Only numbers are allowed"
            },
            'faculty_course[contribution]':
            {
                digit: "Only numbers are allowed"
            }
        }
    });
    
    $('#formbibtex').validate(
    {
        highlight: globalClientSideValidationFunctions.highlightFunc,
        unhighlight: globalClientSideValidationFunctions.unhighlightFunc,
        errorPlacement: globalClientSideValidationFunctions.errorPlacementFunc,
        invalidHandler: globalClientSideValidationFunctions.invalidHandlerFunc,
        rules: {
            'publication[bibtex]':{
                required:true
            }
            
        },
        
        messages: {
           'publication[bibtex]':
            {
                required:'Please enter a path'
            }
            
        }
    });

});
