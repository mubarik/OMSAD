$(document).ready(function()
{
    //ensure that this code only runs for the configuration forms.
    if ($("#formConfiguration").length>0)
    {
        //the row that is currently being edited
        var editRow;
        //the current clicked add config link
        var clickedAddConfigLink;
        //the closest table to the add config link or the edit row
        var currentFlexTable;
        var invoke_button = $("#invoke_nested_configuration");

        $("#formConfiguration").bind("nested:fieldAdded",function(event)
        {
            populateValuesInGrid(event)
        })
        $(".addConfigLink").click(function()
        {
            $("#errorMessage").text("")
            setEditOrCreateMode("0")
            setSettingsBeforeOpen("0")
            clickedAddConfigLink = $(this)
            currentFlexTable = $(this).closest('.expander').next().find(".flexDynamicConfigurations")
        }).fancybox()

        
        $(".expanderHeaderBar").click(function()
        {            
            $(this).find(".editConfigLink").unbind('click').click(function()
            {
            //set edit mode
            setEditOrCreateMode("1")
            //set the row currently being edited
            editRow = $(this).closest('tr');
            //set the closest flex table
            currentFlexTable=$(this).closest('table')
            //set values for edit.
            setValuesForEditBeforeOpen()
            }).fancybox()
        })

        //uses the $.data collection to set the current mode of operation
        //0 is for new
        //1 is for edit
        function setEditOrCreateMode(mode)
        {
            $(invoke_button).data("mode", mode)
        }

        function setSettingsBeforeOpen(mode)
        {
            if (mode == "0")
                $("#configNamePopUp").val("")

        }

        //the save button on the fancybox
        $("#invoke_nested_configuration").click(function(event)
        {
            //check for duplicate values
            var duplicateFound  = false
            $("#errorMessage").text("")
            $(currentFlexTable).find("tr td").find('.configName').each(function()
            {
                if ($(this).closest('tr').css('display') != "none")
                {
                    var currText= $.trim($(this).text())
                    var enteredText = $.trim($("#configNamePopUp").val())

                    if (currText == enteredText)
                    {
                        duplicateFound = true
                        return false
                    }
                }
            })

            if (duplicateFound)
            {
                $("#errorMessage").text("Configuration already exists")
                event.preventDefault()
                return false;
            }

            //prevent save if the text of the configuration is empty
            if ($("#configNamePopUp").val().length == 0)
            {
                $("#errorMessage").text("Seed is empty")
                event.preventDefault()
                return false;
            }
            if ($(this).data('mode') == "0")
            {
                $(clickedAddConfigLink).closest('.expander').next().find(".add_nested_fields").trigger("click")
            }
            else
            {
                var event = {field:editRow}
                populateValuesInGrid(event)
            }
        })

        //get the values added in the fancybox and add them to the flex grid
        function populateValuesInGrid(event)
        {
            //value of 1 means affiliated with LUMS
            event.field.find(".configName").text($("#configNamePopUp").val())
            event.field.find("*[id*=name]").val($("#configNamePopUp").val())
            event.field.find(".editConfigLink").click(function()
            {
                //set edit mode
                setEditOrCreateMode("1")
                //set the row currently being edited
                editRow = $(this).closest('tr');
                //set the closest flex table
                currentFlexTable=$(this).closest('table')
                //set values in the fancybox for edit mode
                setValuesForEditBeforeOpen()

            }).fancybox()
        }

        function setValuesForEditBeforeOpen()
        {
            $("#errorMessage").text("")
            var trimmedValue = $.trim(editRow.find('.configName').text())
            $("#configNamePopUp").val(trimmedValue)
        }
    }
})

