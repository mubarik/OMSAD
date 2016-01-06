$(document).ready(function()
    {
        
        $(this).find('.add_nested_fields').each(function()
        {
            
            if ($(this).attr('link_hierarchy') == 'child_link')
            {
                $(this).hide()

            }

        })
    })
//Additions by Umar Muneer DSSD CS-560 Summer 2012
//find the closest enclosing expander to the link and with in that
//expander find all the field classes. within those field classes find
//all the input and select tags and check empty values in them. trim any white spaces.
//The dynamically added fields must be enclosed within an expander css class for this
//check to work .The expander class must have a previous headingDiv class which encloses
//a span to display the error

function checkInputsForAdditionWithRequiredLogic(event)
{
    var bInsertFields = true;
    event.link.closest("div .expander").find(".fields").each(function()
    {
        $(this).find("input,select").each(function()
        {
            if ($(this).is(":required"))
            {
                if ($(this).attr("type") != "file")
                    $(this).val($.trim($(this).val()))
                if ($(this).val().length == 0 || $(this).val() == "")
                {
                    if ($(this).is(":visible"))
                    {
                        bInsertFields = false
                        return false
                    }
                }
            }
        })
    })

    
    var timer;
    var message = event.link.next('span.dynamicFieldErrorPlacement');
    if (!bInsertFields)
    {
        clearTimeout(timer)
        message.text(event.link.data("fieldAddtionErrorMessage"))
        if (message.is(':hidden'))
        {
            message.show("slide", {
                direction: "left"
            });
            message.unbind('click')
            message.click(function()
            {
                message.fadeOut('slow')
            })
        }
        else
            message.fadeOut('fast', function() {
                $(this).fadeIn();
            });
        timer=setTimeout(function(){
            message.fadeOut('slow')
        },5000);
    }
    else
    {
            message.text("")
            message.hide()
    }
    event.link.data("bInsertNestedFields",bInsertFields)
    return bInsertFields;
}
function checkInputsForAdditionWithEmptyLogic(event)
{
    var bInsertFields = true;
    event.link.closest("div .expander").find(".fields").each(function()
    {
        $(this).find("input,select").each(function()
        {

            if ($(this).attr("type") != "file")
                $(this).val($.trim($(this).val()))
            if ($(this).val().length == 0 || $(this).val() == "")
            {
                if ($(this).is(":visible"))
                {
                    bInsertFields = false
                    return false
                }
            }

        })
    })

    var timer;
    var message = event.link.next('span.dynamicFieldErrorPlacement');
    if (!bInsertFields)
    {
        clearTimeout(timer)
        message.text(event.link.data("fieldAddtionErrorMessage"))
        if (message.is(':hidden'))
        {
            message.show("slide", {
                direction: "left"
            });
            message.unbind('click')
            message.click(function()
            {
                message.fadeOut('slow')
            })
        }
        else
            message.fadeOut('fast', function() {
                $(this).fadeIn();
            });
        timer=setTimeout(function(){
            message.fadeOut('slow')
        },5000);
    }
    else
    {
            message.text("")
            message.hide()
    }

    event.link.data("bInsertNestedFields",bInsertFields)
    return bInsertFields;
}

function showDynamicErrors(message,errorText)
{
    message.text(errorText)
        if (message.is(':hidden'))
        {
            message.show("slide", {
                direction: "left"
            });
            message.unbind('click')
            message.click(function()
            {
                message.fadeOut('slow')
            })
        }
        else
            message.fadeOut('fast', function() {
                $(this).fadeIn();
            });
        timer=setTimeout(function(){
            message.fadeOut('slow')
        },5000);
}
function checkInputsForAddition(event)
{
    var bInsertFields = true;
    event.link.closest("div .expander").find(".fields").each(function()
    {
        $(this).find("input,select").each(function()
        {
            
            if ($(this).attr("type") != "file")
                $(this).val($.trim($(this).val()))
            if ($(this).val().length == 0 || $(this).val() == "")
            {
                if ($(this).is(":visible"))
                {
                    bInsertFields = false
                    return false
                }
            }
            
        })
    })

    event.link.closest('div .expander').prev('div .headingDiv').find('span:first').each(function()
    {
        if (bInsertFields)
        {
            $(this).text("")
            $(this).hide()
        }
        else
        {
            $(this).text(event.link.data("fieldAddtionErrorMessage"))
            window.setTimeout(function(dynErrspan)
            {
                dynErrspan.fadeOut('slow')
            }, 5000,$(this))
            $(this).show()
        }

    })

    event.link.data("bInsertNestedFields",bInsertFields)
    return bInsertFields;
}
jQuery(function($) {

    window.NestedFormEvents = function() {
        this.addFields = $.proxy(this.addFields, this);
        this.removeFields = $.proxy(this.removeFields, this);
    };

    NestedFormEvents.prototype = {
        addFields: function(e) {
            // Setup

            var link = e.currentTarget;

            var assoc = $(link).attr('data-association'); // Name of child

            var content = $('#' + assoc + '_fields_blueprint').html(); // Fields template

            // Make the context correct by replacing new_<parents> with the generated ID
            // of each of the parent objects

            var requiredInputName = ' '

            $(link).closest('.fields').find('input:first').each(function()
            {
                requiredInputName=$(this).attr("name")

            })

    
            var context = (requiredInputName || '').replace(new RegExp('\[[a-z]+\$'), '');
	
            // context will be something like this for a brand new form:
            // project[tasks_attributes][new_1255929127459][assignments_attributes][new_1255929128105]
            // or for an edit form:
            // project[tasks_attributes][0][assignments_attributes][1]

            if (context) {
                var parentNames = context.match(/[a-z_]+_attributes/g) || [];
                var parentIds = context.match(/(new_)?[0-9]+/g) || [];

                for(var i = 0; i < parentNames.length; i++) {
                    if(parentIds[i]) {
                        content = content.replace(
                            new RegExp('(_' + parentNames[i] + ')_.+?_', 'g'),
                            '$1_' + parentIds[i] + '_');

                        content = content.replace(
                            new RegExp('(\\[' + parentNames[i] + '\\])\\[.+?\\]', 'g'),
                            '$1[' + parentIds[i] + ']');
                    }
                }
            }
            // Make a unique ID for the new child
            var regexp = new RegExp('new_' + assoc, 'g');
            var new_id = new Date().getTime();
            content = content.replace(regexp, "new_" + new_id);

            var bInsertFields = true;
            $(link).closest("form").trigger({
                type:'nested:beforeFieldAdded',
                link:$(link)
            })

            bInsertFields = $(link).data("bInsertNestedFields")

            if (bInsertFields == null)
                bInsertFields = true
           
            if (bInsertFields == true)
            {
                var field = this.insertFields(content, assoc, link);
                $(link).closest("form")
                .trigger({
                    type: 'nested:fieldAdded',
                    field: field
                })
                .trigger({
                    type: 'nested:fieldAdded:' + assoc,
                    field: field
                });

                field.find('.add_nested_fields').each(function()
                {
                    //add one child association by default on click of parent
                    $(this).trigger('click')
                    if ($(this).attr("link_hierarchy") == "child_link")
                        $(this).hide()
                })
            }
            return false;
        },
        insertFields: function(content, assoc, link) 
        {
            var tr;
            if ($(link).attr("link_type") == "grid_link")
            {
                ($(link).prev('.flexigrid').find('table').each(function()
                {
                    
                    if ($(this).attr("table_type") == "nested_flex_table")
                    {
                        var table = $(this);
                        tr = $("<tr/>");
                        $(content).find('div').each(function()
                        {
                            var div = $("<div>"+$(this).html()+"</div>")
                            var td = $('<td/>')
                            div.attr("style",$(this).attr("style"))
                            td.append(div)
                            tr.append(td)
                        })
                        table.append(tr)
                    }
                }))
                return $(tr)
            }
            else
                return $(content).insertBefore(link);
        },
        removeFields: function(e) {
            var link = e.currentTarget;
            var hiddenField = $(link).prev('input[type=hidden]');
            hiddenField.val('1');
            // if (hiddenField) {
            // $(link).v
            // hiddenField.value = '1';
            // }

            var field;
            
            if ($(link).attr("link_type") == "grid_link")
                field = $(link).closest('tr')
            else
                field = $(link).closest('.fields');

            field.fadeOut();
            field.hide();
            $(link).closest("form").trigger({
                type: 'nested:fieldRemoved',
                field: field
            });
            return false;
        }
    };

    window.nestedFormEvents = new NestedFormEvents();
    $('form a.add_nested_fields').live('click',nestedFormEvents.beforeAddFields)
    $('form a.add_nested_fields').live('click', nestedFormEvents.addFields);
    $('form a.remove_nested_fields').live('click', nestedFormEvents.removeFields);
});


// http://plugins.jquery.com/project/closestChild
/*
* Copyright 2011, Tobias Lindig
*
* Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
* and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
*
*/
(function($) {
    $.fn.closestChild = function(selector) {
        // breadth first search for the first matched node
        if (selector && selector != '') {
            var queue = [];
            queue.push(this);
            while(queue.length > 0) {
                var node = queue.shift();
                var children = node.children();
                for(var i = 0; i < children.length; ++i) {
                    var child = $(children[i]);
                    if (child.is(selector)) {
                        return child; //well, we found one
                    }
                    queue.push(child);
                }
            }
        }
        return $();//nothing found
    };
})(jQuery);
