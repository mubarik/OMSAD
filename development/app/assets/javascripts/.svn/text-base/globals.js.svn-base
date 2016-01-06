$(document).ready(function()
    {
        submitCheck.clearSubmitCount()
    })
var submitTimer;
var submitCount = 0;
var submitCheck =
{
    incrementSubmitCount:function()
    {
        submitCount++;
    },
    clearSubmitCount :function()
    {
        submitCount = 0;
    },
    shouldSubmit :function()
    {
        if (submitCount ==1)
            return true;
        else
            return false;
    }
}

var internalCoPiCheck =
{
    check:function()
    {
        var pi_affiliation_type = $("#pi_affiliation_type").val();
        var submitErrorDisplay = $("div.bottomButtons span.submitErrorPlacement");
        if (pi_affiliation_type == "0")
        {
            //count internal co_pis here
            var internal_co_pi_count = 0
            $("#dynDivCoPiContainer select[id*=affiliationtype]").each(function()
            {
                if ($(this).val() == "1" && $(this).closest('.fields').css('display')!='none')
                    internal_co_pi_count++
            })


            if (internal_co_pi_count == 0)
            {
                if (submitErrorDisplay.data("errors") == false)
                {
                    submitErrorDisplay.html("Either a PI or Co-PI should be internal");
                    if (submitErrorDisplay.is(':hidden'))
                    {
                        submitErrorDisplay.show("slide", {
                            direction: "right"
                        });
                    }
                    window.setTimeout(function(submitErrorDisplay)
                    {
                        submitErrorDisplay.hide("slide",{
                            direction:"right"
                        });
                    }, 5000,submitErrorDisplay)
                }
                return false;
            }
        }
        return true
    }
}
var authorCountCheck =
{
    check:function()
    {
        var author_count = 0
      $(".flexDynamicAuthors tr").each(function()
      {
        if ($(this).css('display') != 'none')
        {
          author_count++;
        }
      })
      var submitErrorDisplay = $("div.bottomButtons span.submitErrorPlacement");

      if (author_count == 0)
      {
        if (submitErrorDisplay.data("errors") == false)
        {
          submitErrorDisplay.html("Please add atleast one author");
          if (submitErrorDisplay.is(':hidden'))
          {
            submitErrorDisplay.show("slide", {
              direction: "right"
            });
          }
          window.setTimeout(function(submitErrorDisplay)
          {
            submitErrorDisplay.hide("slide",{
              direction:"right"
            });
          }, 5000,submitErrorDisplay)
        }
        return false
      }
      else
        return true;
    }
}
var globalClientSideValidationFunctions = {
    invalidHandlerFunc: function (form, validator)
    {
    },

    errorPlacementFunc: function (error, element)
    {
        error.hide();
        var adjacentErrorField = $(element).closest("td").siblings("td.fieldErrorPlacement, td.popupfieldErrorPlacement");
        if (adjacentErrorField.text() != "")
            adjacentErrorField.text("");
        error.appendTo($(element).closest("td").next("td"));
        error.fadeIn('slow');
    },

    unhighlightFunc: function (element, errorClass)
    {
        $(element).closest("td").removeClass("invalidEntry", 'slow');
        var adjacentErrorField = $(element).closest("td").siblings("td.fieldErrorPlacement, td.popupfieldErrorPlacement");
        if (adjacentErrorField.text() != "")
            adjacentErrorField.text("");
    },

    highlightFunc: function (element, errorClass)
    {
        $(element).closest("td").addClass("invalidEntry", "slow");
    },

    dynamicFieldsAdditionErrorShow: function(fieldsEmpty, event, timer)
    {
        clearTimeout(timer);
        if (fieldsEmpty)
        {
            var message = event.link.next('span.dynamicFieldErrorPlacement');
            if (message.is(':hidden'))
                message.show("slide", {
                    direction: "left"
                });
            else
                message.fadeOut('fast', function() {
                    $(this).fadeIn();
                });
            timer = setTimeout(function(){
                message.fadeOut('slow')
                },5000);
            event.link.data("bInsertNestedFields",false);
        }
        else
        {
            $('span.dynamicFieldErrorPlacement').fadeOut('fast');
            event.link.data("bInsertNestedFields",true);
        }
    }
}

function clearErrorAndValue(field) {
    field.closest("td").removeClass("invalidEntry");
    field.closest("td").siblings("td.fieldErrorPlacement").text("");
    field.val('');
}

function clearError(field) {
    field.closest("td").removeClass("invalidEntry");
    field.closest("td").siblings("td.fieldErrorPlacement").text("");
}


$(document).ready(function()
{
    jQuery.validator.addMethod("alpha", function(value, element)
    {
        return this.optional(element) || value == value.match(/^[a-zA-Z ]+$/);
    },
    "Only Characters Allowed.");


    jQuery.validator.addMethod("contactNumberProperFormat", function(value, element)
    {
        return this.optional(element) || value == value.match(/^\+(?:[0-9] ?){6,14}[0-9]$/);
    },
    "Contact number is not in proper format.");

    jQuery.validator.addMethod("greaterThan", function(value, element, params)
    {
        return Number(value) >= Number($(params).val())
    },'Must be greater than {0}.');

    jQuery.validator.addMethod("greaterThanEndDate",function(value, element, params) {

        var startDate = $.datepicker.parseDate("dd-M-yy",$(params).val())
        var endDate  = $.datepicker.parseDate("dd-M-yy",value)

        if (endDate != null && startDate != null)
            return startDate <= endDate
        return true


    },'Must be greater than {0}.');


    jQuery.validator.addMethod("numbersAndCharacters", function(value, element)
    {
        return this.optional(element) || value == value.match(/^[A-Za-z0-9 ]*$/);
    },
    "");

    jQuery.validator.addMethod("alphabetsAndCommonCharacters", function(value, element)
    {
        return this.optional(element) || value == value.match(/^\s*[a-zA-Z,\s.]+\s*$/);
    },
    "");

    jQuery.validator.addMethod("journalVolume", function(value, element)
    {
        return this.optional(element) || value == value.match(/^1000|[0-9]{1,3}$/);
    },
    "");

    jQuery.validator.addMethod("IssueNumber", function(value, element)
    {
        return this.optional(element) || value == value.match(/^[0]*[1-9]$|^[0]*1[0-2]$/);
    },
    "");

    jQuery.validator.addMethod("impactFactor", function(value, element)
    {
        return this.optional(element) || value == value.match(/^[0-9]*$/);
    },
    "");

    jQuery.validator.addMethod("conferenceRank", function(value, element)
    {
        return this.optional(element) || value == value.match(/^A-?|[ABCD][+-]?|[SN]?F|W$/);
    },
    "");

    jQuery.validator.addMethod("percentage", function(value, element)
    {
        return this.optional(element) || value == value.match(/^100|[0-9]{1,2}$/);
    },
    "");

    jQuery.validator.addMethod("pageRange", function(value, element)
    {
        return this.optional(element) || value == value.match(/^[-\d]+/);
    },
    "");
    
    jQuery.validator.addMethod("URL", function(value, element)
    {
        return this.optional(element) || value == value.match(/^(?:http:\/\/)?(?:https:\/\/)?(?:[\w-]+\.)+[a-z]{2,6}$/i);
    },
    "");
});