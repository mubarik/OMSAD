$(document).ready(function() {
    var closedExpanderHeight = $('.expanderHeaderBar:first').outerHeight();
//    $('.expandingBlock .expanderHeaderBar').click(function() {
//        $(this).siblings('.expanderHeaderBar').children('.expander').slideUp();
//        $(this).siblings('.expanderHeaderBar').children('img').each(function() {
//            if ($(this).css("display") == "none")
//                $(this).fadeIn();
//        });
//        $(this).children('.expander').slideDown();
//        $(this).children('img').fadeOut();
//    });
//
//
//    $('.expandingBlock .expanderHeaderBar').click(function() {
//        $(this).siblings('.expanderHeaderBar').each(function() {
//            if ($(this).children('.expander').css("display") != "none") {
//                $(this).children('img').fadeIn();
//                $(this).children('.expander').slideUp(function() {
//                    $(this).find('.inputBoxPlacement').each(function() {
//                        if (!(/^\s*$/).test($(this).text())) { //if not whitespace
//                            if ($(this).children('label').text() == $(this).text()) //if not whitespace and text was label text
//                            {
//                                if ($(this).children('label').css('display') != 'none')  //label text exists
//                                {
//                                    $(this).closest('.expanderHeaderBar').addClass('expanderErrorHighlight2');
//                                    return false;
//                                }
//                            }
//                            else //if not whitespace and text wasn't label text
//                            {
//                                $(this).closest('.expanderHeaderBar').addClass('expanderErrorHighlight2');
//                                return false;
//                            }
//                        }
//                    });
//                });
//            }
//        });
//        $(this).removeClass('expanderErrorHighlight2');
//        $(this).children('.expander').slideDown();
//        $(this).children('img').fadeOut();
//    });


    $('.expanderHeaderBar').live("click",function(e) {
        var clickY = e.pageY - this.offsetTop;
        if (clickY > 0 && clickY < closedExpanderHeight)
        {
            if ($(this).children('.expander').css("display") != "none") {
                $(this).children('img').fadeIn();
                $(this).find('span.requiredFillExpander').show();
                $(this).children('.expander').slideUp(function() {
                    $(this).find('.inputBoxPlacement').each(function() {
                        if ($(this).hasClass('invalidEntry')) {
                            $(this).closest('.expanderHeaderBar').addClass('expanderErrorHighlight2');
                            return false;
                        }
                    });
                });
            }
            else {
                $(this).siblings('.expanderHeaderBar').each(function() {
                    if ($(this).children('.expander').css("display") != "none") {
                        $(this).children('img').fadeIn();
                        $(this).find('span.requiredFillExpander').show();
                        $(this).children('.expander').slideUp(function() {
                            $(this).find('.inputBoxPlacement').each(function() {
                                if ($(this).hasClass('invalidEntry')) {
                                    $(this).closest('.expanderHeaderBar').addClass('expanderErrorHighlight2');
                                    return false;
                                }
                            });
                        });
                    }
                });
                $(this).removeClass('expanderErrorHighlight2');
                $(this).children('.expander').slideDown();
                $(this).children('img').fadeOut();
                $(this).find('span.requiredFillExpander').hide();
            }
        }
    });
});

function closeFirstExpander() {
    var firstExpander = $('div.expanderHeaderBar:first');
    firstExpander.children('div.expander').hide();
    firstExpander.children('img').show();
    firstExpander.find('span.requiredFillExpander').show();
}