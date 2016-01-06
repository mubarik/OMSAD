$(document).ready(function() {
    
    $('div.expanderHeaderBar').each(function() {
        var flagErrorInExpander = false;
        $(this).find('td.fieldErrorPlacement').each(function() {
            if (!(/^\s*$/).test($(this).text())) {
                $(this).prev('td').addClass('invalidEntry');
                flagErrorInExpander = true;
            }
        });
        if (flagErrorInExpander)
            $(this).addClass('expanderErrorHighlight2');
    });

    var errorsExist = false;
    $('div.expanderHeaderBar').each(function() {
        if ($(this).hasClass('expanderErrorHighlight2')) {
            errorsExist = true;
            $(this).removeClass('expanderErrorHighlight2');
            $(this).children('div.expander').slideDown('slow');
            $(this).children('img').fadeOut('slow');
            $(this).find('span.requiredFillExpander').hide();
            return false;
        }
    });

    if (!errorsExist) {
        var firstExpander = $('div.expanderHeaderBar:first');
        firstExpander.children('div.expander').slideDown('slow');
        firstExpander.children('img').fadeOut('slow');
        firstExpander.find('span.requiredFillExpander').hide();
    }


    //    $('.expanderHeaderBar').each(function() {
    //        if ($(this).hasClass('expanderErrorHighlight2')) {
    //            someExpanderHasError = true;
    //            return false;
    //        }
    //    });


    $("form.clientSideValidatedForm").submit(function() {
        var errors = 0;

        clearTimeout(submitTimer);

        $('form td.inputBoxPlacement').each(function() {
            //if (!($(this).is(':hidden') || $(this).parents(':hidden').length))
            var inputField = $(this).find('input:first, select:first');
            //$('input:not([name$="_fields_blueprint"])').

            if ($(this).hasClass('invalidEntry'))
                errors++;
            else if (inputField.is("[required]") && (/^\s*$/).test(inputField.val()))
            {
                if (inputField.css('display') != 'none')
                {
                    var field = inputField.closest('.fields');
                    if (field.length > 0)
                    {
                        if (field.css('display')!= 'none')
                            errors++;
                    }
                    else
                        errors++;
                }

            }

        });

        var submitErrorDisplay = $("form div.bottomButtons span.submitErrorPlacement");
        submitErrorDisplay.data("errors",false)
        if (errors >=1) {
            var message = errors == 1
            ? 'You have an error in 1 field'
            : 'You have errors in ' + errors + ' fields';
            if (submitErrorDisplay.is(':hidden')) {
                submitErrorDisplay.html(message);
                submitErrorDisplay.show("slide", {
                    direction: "right"
                });
            }
            else
                submitErrorDisplay.fadeOut('fast', function() {
                    $(this).html(message);
                    $(this).fadeIn();
                });
            //the other modules using the same label for errors will suppress their error messages if this value
            //is true
            submitErrorDisplay.data("errors",true)
            submitTimer = setTimeout(function(){
                submitErrorDisplay.fadeOut('slow')
            },10000);
            submitCheck.clearSubmitCount()
            return false;
        }
        else
        {
            submitCheck.incrementSubmitCount()
            
            var valid = true;
            if ($("#formGrant").length > 0)
            {
                valid = internalCoPiCheck.check()
            }
            else if ($("#formPublications").length >0)
            {
                valid = authorCountCheck.check();
            }
            if (valid)
            {
                return submitCheck.shouldSubmit()
            }
            else
            {
                submitCheck.clearSubmitCount()
                return false
            }
           
        }
    });
});