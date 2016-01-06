$(document).ready(function()
    {
        var photoText = "photo"
        var authorText = "author"
        //this is a global variable containing the row that is being edited.
        //not a very good way to do this , will try to improve it if i get the time
        var editRow;
        var invoke_button = $("#invoke_nested_author");
    
        if ($("#addAuthorsLink").length>0)
            $("#addAuthorsLink").click(function()
            {
                setEditOrCreateMode("0")
            }).click(function()
            {
                setSettingsBeforeOpen("0")
            }).fancybox()

        if ($("#authorCount").length>0)
        {
            $("#authorCount").val($(".flexDynamicAuthors tr").length)
        }
        
        if ($("#authorsExpander").length>0)
            $("#authorsExpander").click(function()
            {
                $(this).find(".editAuthorsLink").unbind('click').click(setValuesForEditBeforeOpen).fancybox()
                $(this).find(".increaseAuthorIndexLink").unbind('click').click(increaseAuthorIndex)
                $(this).find(".decreaseAuthorIndexLink").unbind('click').click(decreaseAuthorIndex)
            })
    
        if ($("#formPublications #author_affiliationtype").length >0)
        {
            $("#formPublications #author_affiliationtype").change(changeAffiliationType);
        }
        if ($("#formPublications #invoke_nested_author").length>0)
            $("#formPublications #invoke_nested_author").click(function(event)
            {
                if (validate() != 0)
                {
                    event.preventDefault()
                    return false;
                }
                //"create mode"
                if ($(this).data('mode') == "0")
                    $("#author_nested_link").trigger('click')
                else
                {
                    var event = {
                        field:editRow
                    }
                    populateValuesInGrid(event)
                }
            })

        $("#formPublications").bind("nested:beforeFieldAdded",function(event)
        {
            if (getLinkType(event).indexOf(photoText) > -1)
            {
                publicationPhotoValidation(event)
            }
        })
        function checkCountBeforeAddition(event)
        {
            var bInsertFields = true;
            var publicationPhotoCount = parseInt($("#publicationPhotoCount").val())
            if (publicationPhotoCount >= 5)
                bInsertFields = false;

            return bInsertFields;
        }
         
        function publicationPhotoValidation(event)
        {
            var bInsertFields = checkCountBeforeAddition()
            event.link.data("bInsertNestedFields",bInsertFields)

            if (bInsertFields)
            {
                event.link.data("fieldAddtionErrorMessage","Please fill the empty fields first")
                checkInputsForAdditionWithEmptyLogic(event)
            }
            else
            {
                var timer;
                var message = event.link.next('span.dynamicFieldErrorPlacement');

                clearTimeout(timer)
                message.text("You cannot add more than 5 photos")
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
        }

        function getLinkType(event)
        {
            return event.link.closest('div .expanderHeaderBar').find('#moduleType:first').val().toLowerCase()
        }
        //function to be taken in parent class when oop model is implemented here.
        function getHeadingText(event)
        {
            return event.field.closest('div .expanderHeaderBar').find('#moduleType:first').val().toLowerCase()
        }

        $("#formPublications").bind("nested:fieldAdded",function(event)
        {
            if (getHeadingText(event).indexOf(photoText) > -1)
            {
                var publicationPhotoCount = parseInt($("#publicationPhotoCount").val());
                publicationPhotoCount++;
                $("#publicationPhotoCount").val(publicationPhotoCount.toString());
            }
            else
            {
                populateValuesInGrid(event);
                updateAuthorIndexForAddition(event)
            }
        })
        $("#formPublications").bind("nested:fieldRemoved",function(event)
        {
            if (getHeadingText(event).indexOf(photoText) > -1)
            {
                var publicationPhotoCount = parseInt($("#publicationPhotoCount").val());
                publicationPhotoCount--;
                $("#publicationPhotoCount").val(publicationPhotoCount.toString());
            }
            else
            {
                updateAuthorIndexForRemoval(event)
            }
        })

        //call this function against keyup and save button
        $("#authors").change(function()
        {
            validate()
        })
        $("#author_external_entity_name,#author_affiliationname").keyup(function()
        {
            validate()
        })
        function validate()
        {
            var affiliation_type = $("#author_affiliationtype").val()
            var errorCountEntity = 0;
            var errorCountAffiliation    = 0;
            //for affiliation with LUMS = yes
            if(affiliation_type == "1")
            {
                if ($("#authors").val().length == 0)
                {
                    showErrors(true, "Please select an author", $("#authors"))
                    errorCountEntity++;
                }
                else
                {
                    showErrors(false, "", $("#authors"))
                    if (errorCountEntity>0)
                        errorCountEntity--
                }
            }
            //for affiliation with LUMS = no
            else
            {
                var external_entity_name = $("#author_external_entity_name")

                //match with alphabets check.
                if (match(external_entity_name.val(),/^[a-zA-Z ]+$/))
                {
                    showErrors(true, "Only alphabets allowed", external_entity_name)
                    errorCountEntity++
                }
                else
                {
                    showErrors(false, "", external_entity_name)
                }

                //match with max length check
                if (errorCountEntity == 0)
                {
                    if (maxlength(external_entity_name.val(), 30))
                    {
                        showErrors(true, "Maximum 30 characters", external_entity_name)
                        errorCountEntity++;
                    }
                    else
                    {
                        showErrors(false, "", external_entity_name)
                    }
                }
                //match with required value
                if (errorCountEntity == 0)
                {
                    if (required(external_entity_name.val()))
                    {
                        showErrors(true, "Please enter a valid name", external_entity_name)
                        errorCountEntity++
                    }
                    else
                    {
                        showErrors(false, "", external_entity_name)
                    }
                }

                var author_affiliation_name = $("#author_affiliationname")

                if (!required(author_affiliation_name.val()))
                {
                    if (match(author_affiliation_name.val(),/^[a-zA-Z ]+$/))
                    {
                        showErrors(true, "Only alphabets allowed", author_affiliation_name)
                        errorCountAffiliation++
                    }
                    else
                    {
                        showErrors(false, "", author_affiliation_name)
                    }

                    //match with max length check
                    if (errorCountAffiliation == 0)
                    {
                        if (maxlength(author_affiliation_name.val(), 30))
                        {
                            showErrors(true, "Maximum 30 characters", author_affiliation_name)
                            errorCountAffiliation++;
                        }
                        else
                        {
                            showErrors(false, "", author_affiliation_name)
                        }
                    }

                }
                else
                    showErrors(false, "", author_affiliation_name)
            }
            return errorCountEntity+errorCountAffiliation;
        }

        //reduce these functions asap
        function maxlength(value,max_length)
        {
            if (value.length > max_length)
            {
                return true
            }
            else
            {
                return false
            }
        }
        function required(value)
        {
            if (value.length == 0)
                return true
            else
                return false
        }
        function match(value,regexp)
        {
            if (value.match(regexp) == value)
                return false
            else
                return true
        }
        
        function showErrors(errorPresent,errorText,element)
        {
            if (errorPresent)
            {
                $(element).closest('td').next().html(errorText)
            }
            else
            {
                $(element).closest('td').next().html("")
            }
        }
        //uses the $.data collection to set the current mode of operation
        //0 is for new
        //1 is for edit
        function setEditOrCreateMode(mode)
        {
            $(invoke_button).data("mode", mode)
            
            if (mode == "0")
                $("#mainHeading").text("Add an Author")
            else
                $("#mainHeading").text("Edit an Author")
        }
        //set affiliation mode to external or internal and then configure the fields with it.
        //this function is only called when the edit link is clicked

        //Also hides the already added values from the authors dropdown
        function setSettingsBeforeOpen(affiliationtype)
        {
            affiliationtype = affiliationtype || "0"
            $("#author_affiliationtype").val(affiliationtype);
            $("#author_affiliationtype").trigger('change')
            $("#authors option").each(function()
            {
                var option = $(this)
                $(".flexDynamicAuthors tr").each(function()
                {                    
                    var internal_entity_id = $(this).find("input[id*=user_id]").val()

                    option.show()
                    //the deleted rows are actually hidden so do not consider them
                    if (option.val() == internal_entity_id && $(this).css("display") != "none")
                    {
                        option.hide()
                        return false
                    }
                })
            })
        }

        function increaseAuthorIndex()
        {

            var curr_row  = $(this).closest('tr')
            var prev_row;

            var curr_row_author_index = $(curr_row).find("input[id*=authorindex]").val()
            var index = $(this).closest('tr')[0].sectionRowIndex

            //Only  execute this block if the clicked row is not the top one
            if (index != 0)
            {
                $(".flexDynamicAuthors tr").each(function(i)
                {
                    if (i==index-1)
                        prev_row = $(this)
                    i++
                })

                var prev_row_author_index = $(prev_row).find("input[id*=authorindex]").val()

                $(curr_row).find(".authorIndex").text("Author "+prev_row_author_index)
                $(curr_row).find("input[id*=authorindex]").val(prev_row_author_index)
                $(prev_row).find(".authorIndex").text("Author "+curr_row_author_index)
                $(prev_row).find("input[id*=authorindex]").val(curr_row_author_index)

                //swap the values of the current row with the previous row.
                curr_row.after(prev_row)
            }
        }
        function decreaseAuthorIndex()
        {
            var curr_row  = $(this).closest('tr')
            var next_row;

            var curr_row_author_index = $(curr_row).find("input[id*=authorindex]").val()
            var index = $(this).closest('tr')[0].sectionRowIndex

            if (index != $(".flexDynamicAuthors tr").length-1)
            {
                $(".flexDynamicAuthors tr").each(function(i)
                {
                    if (i==index+1)
                        next_row = $(this)
                    i++
                })

                var next_row_author_index = $(next_row).find("input[id*=authorindex]").val()

                $(curr_row).find(".authorIndex").text("Author "+next_row_author_index)
                $(curr_row).find("input[id*=authorindex]").val(next_row_author_index)
                $(next_row).find(".authorIndex").text("Author "+curr_row_author_index)
                $(next_row).find("input[id*=authorindex]").val(curr_row_author_index)

                curr_row.before(next_row)
            }
        }
        function updateAuthorIndexForAddition(event)
        {
            var authorCount = parseInt($("#authorCount").val())
            authorCount++
            $("#authorCount").val(authorCount.toString())

            //update the span within the row containing the author index
            event.field.find(".authorIndex").text("Author "+authorCount)
            event.field.find("input[id*=authorindex]").val(authorCount.toString())
        }
        function updateAuthorIndexForRemoval(event)
        {
            //decrement the author count and save it in the hidden author field
            var authorCount = parseInt($("#authorCount").val());
            authorCount--;
            $("#authorCount").val(authorCount.toString())

            var i=1;
            //find the legends and update their text.
            $(".flexDynamicAuthors tr").each(function()
            {
                if ($(this).css("display") != "none")
                {
                    $(this).find(".authorIndex").text("Author "+ i)
                    //find the hidden tag storing the author index and update their value.
                    $(this).find("input[id*=authorindex]").val(i.toString())
                    i++
                }
            })
        }

        //if the edit link is clicked retrieve the values from the closest row
        //and populate the popup with it.
        function setValuesForEditBeforeOpen()
        {

            var tr = $(this).closest('tr');
            var affiliation_type = $(tr).find("input[id*=affiliationtype]").val()

            setEditOrCreateMode("1")
            //set the affiliation type and clear the values
            setSettingsBeforeOpen(affiliation_type)
            //now set the values read from the row
            if (affiliation_type == "0")
            {
                $("#author_external_entity_name").val($(tr).find("input[id*=external_entity_name]").val())
                $("#author_affiliationname").val($(tr).find("input[id*=affiliationname]").val())
            }
            else
            {
                $("#authors").val($(tr).find("input[id*=user_id]").val())
            }
            editRow = $(tr)
        }

        //get the values added in the fancybox and add them to the flex grid
        function populateValuesInGrid(event)
        {
            //value of 1 means affiliated with LUMS
            if ($("#author_affiliationtype").val() == "1")
            {
                event.field.find(".authorName").text($("#authors option:selected").text())
                event.field.find(".affiliationName").text("LUMS")
                event.field.find("*[id*=user_id]").val($("#authors").val())
                event.field.find("*[id*=external_entity_name]").val($("#authors option:selected").text())
                event.field.find("*[id*=affiliationname]").val("LUMS")
            }
            else
            {
                event.field.find(".authorName").text($("#author_external_entity_name").val())
                event.field.find(".affiliationName").text($("#author_affiliationname").val())
                event.field.find("*[id*=external_entity_name]").val($("#author_external_entity_name").val())
                event.field.find("*[id*=affiliationname]").val($("#author_affiliationname").val())
                event.field.find("*[id*=user_id]").val("-1")
            }
            event.field.find("*[id*=affiliationtype]").val($("#author_affiliationtype").val())
            event.field.find(".editAuthorsLink").click(setValuesForEditBeforeOpen).fancybox();
        }
        function changeAffiliationType()
        {
            var parent = $(this)

            if (parent.val().toString() == "1")
            {
                $("#author_affiliationlabel").hide()
                $("#author_affiliationname").hide()
                $("#author_affiliationname").val("")
                $("#author_external_entity_name").hide()
                $("#author_external_entity_name").val("")
                showErrors(false, "", $("#author_external_entity_name"))
                showErrors(false, "", $("#author_affiliationname"))
                $("#authors").show()
            }
            else
            {
                $("#author_affiliationlabel").show()
                $("#author_affiliationname").show()
                $("#author_affiliationname").val("")
                $("#author_external_entity_name").show()
                $("#author_external_entity_name").val("")
                $("#authors").hide()
                showErrors(false, "", $("#authors"))
                $("#authors").val("-1")
            }
        }
    })

