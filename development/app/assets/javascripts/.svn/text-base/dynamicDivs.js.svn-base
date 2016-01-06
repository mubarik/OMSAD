/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$("#formPublications").ready(function()
{
//    //Initialize all the fields loaded already through model values
//         var parentTableClass = "parentTable"
//         var tableName = "Table";
//         var rowName   = "row";
//         var external_entity_name="externalEntityName";
//         var affiliation_name = "affiliationText"
//         var affiliation_type = "affiliationType";
//         var internal_entity_name = "internalEntityName";
//         var co_pi_div ="dynDivAddCoPi"
//         var authors_div = "dynDivAddCoAuthors"
//
//         var affiliationNameRow = "affiliationNameRow"
//         var internalEntityNameRow ="internalEntityNameRow"
//         var externalEntityNameRow ="externalEntityNameRow"
//         var mainLabel = "mainLabel"
//
//         var publicationForm = "formPublication"
//         var grantForm = "formgrant"
//         main_count = 0
//
//       var currentFormName = ""
//
//         $("."+parentTableClass).each(function(i,obj)
//         {
//            i=i+1
//            $(this).attr("id",tableName+i.toString())
//            $(this).attr("name",tableName+i.toString())
//
//            $(this).find('td').each(function()
//            {
//                $(this).find(".affiliationType").each(function()
//                {
//                    $(this).attr("id",affiliation_type+i.toString())
//                    $(this).attr("name",affiliation_type+i.toString())
//                    $(this).attr("class","dropdown")
//                    $(this).change(affiliationChanged)
//                });
//                $(this).find(".externalEntityName").each(function()
//                {
//                    $(this).attr("id",external_entity_name+i.toString())
//                    $(this).attr("name",external_entity_name+i.toString())
//                    $(this).attr("class","inputTextbox")
//                    $(this).attr("required","true")
//                });
//                $(this).find(".affiliationText").each(function()
//                {
//                    $(this).attr("id",affiliation_name+i.toString())
//                    $(this).attr("name",affiliation_name+i.toString())
//                    $(this).attr("class","inputTextbox")
//                });
//
//                $(this).find(".internalEntityName").each(function()
//                {
//                    $(this).attr("id",internal_entity_name+i.toString())
//                    $(this).attr("name",internal_entity_name+i.toString())
//                    $(this).attr("class","dropdown")
//                    $(this).attr("required","true")
//                });
//
//                $(this).find(".deleteButton").each(function()
//                {
//                    $(this).attr("id",tableName+i.toString())
//                    $(this).attr("name",tableName+i.toString())
//                    $(this).attr("class","dynDivDeleteButton")
//                    $(this).click(removeEntityInformation);
//                });
//                $(this).find("."+mainLabel).each(function()
//                {
//                    updateLabelText($(this), i)
//                    $(this).attr("id", mainLabel)
//                    $(this).attr("name",mainLabel)
//                    $(this).attr("class","labelDefinitionTerm")
//                });
//            });
//                $(this).find("."+affiliationNameRow).each(function ()
//                {
//                    $(this).attr("id",affiliationNameRow+i)
//                    $(this).attr("name",affiliationNameRow+i)
//                });
//                $(this).find("."+externalEntityNameRow).each(function ()
//                {
//                    $(this).attr("id",externalEntityNameRow+i)
//                    $(this).attr("name",externalEntityNameRow+i)
//                });
//                $(this).find("."+internalEntityNameRow).each(function ()
//                {
//                    $(this).attr("id",internalEntityNameRow+i)
//                    $(this).attr("name",internalEntityNameRow+i)
//                });
//            main_count = main_count + 1
//         });
//
//
//         $("#dynDivFieldCount").attr("value", main_count.toString());
//         $("#"+co_pi_div).click(createLayout);
//         $("#"+authors_div).click(createLayout);
//
//
////creates the common layout for authors and co-pis
//        function createLayout()
//        {
//           var currDynFieldCount = $("#dynDivFieldCount").attr("value")
//           currDynFieldCount = parseInt(currDynFieldCount)+1;
//           //set the text to display infront of the label..for exaple it should be like
//           //Author 1 ,Author 2 ,Author 3 e.t.c e.t.c
//           var labelText ="Name";
//
//           if ($(this).attr("id")==co_pi_div)
//           {
//               labelText = "Co-Pi Name " +currDynFieldCount.toString();
//           }
//           else
//           {
//               labelText = "Author "+currDynFieldCount.toString();
//            }
//
//           var labelExternalEntityMember =  $("<label>"+labelText+"<label/>")
//
//           labelExternalEntityMember.attr("class","labelDefinitionTerm");
//           labelExternalEntityMember.attr("id",mainLabel)
//           labelExternalEntityMember.attr("name",mainLabel)
//
//           var fieldExternalEntityMemeber = $("<input/>");
//           fieldExternalEntityMemeber.attr("type", "text");
//           fieldExternalEntityMemeber.attr("id",external_entity_name+currDynFieldCount.toString())
//           fieldExternalEntityMemeber.attr("name",external_entity_name+currDynFieldCount.toString())
//           fieldExternalEntityMemeber.attr("class","inputTextbox")
//           fieldExternalEntityMemeber.attr("required","true")
//
//           var labelInternalEntityMember  = $("<label>"+labelText+"<label/>")
//           labelInternalEntityMember.attr("class","labelDefinitionTerm");
//           labelInternalEntityMember.attr("id",mainLabel);
//           labelInternalEntityMember.attr("name",mainLabel);
//
//           var selectInternalSource =$("<select/>")
//           selectInternalSource.attr("id",internal_entity_name+currDynFieldCount.toString())
//           selectInternalSource.attr("name",internal_entity_name+currDynFieldCount.toString())
//           selectInternalSource.attr("class","dropdown")
//           selectInternalSource.attr("required","true")
//           //populate the select faculty member tag
//           populateInternalSource(selectInternalSource, "principleinvestigator_id")
//
//           var affiliationTypeLabel    =$("<label>LUMS Affiliation</label>")
//           affiliationTypeLabel.attr("class","labelDefinitionTerm")
//
//           var selectAffiliation =$("<select><option value=1>Yes</option><option value=0>No</option></select>")
//           selectAffiliation.attr("id",affiliation_type+currDynFieldCount.toString())
//           selectAffiliation.attr("name",affiliation_type+currDynFieldCount.toString())
//           selectAffiliation.attr("class","dropdown")
//
////event fired when the LUMS affiliation type is changed. for external entity
////the affiliation name fields are selected
//
//           selectAffiliation.change(affiliationChanged);
//
//           var deleteImage =$("<img/>");
//           //set the id of the delete image and the row to the same value for easy deletion
//           deleteImage.attr("class", "dynDivDeleteButton");
//           deleteImage.attr("id",tableName+currDynFieldCount);
//           deleteImage.attr("name",tableName+currDynFieldCount);
//
//           var affiliationNameLabel    =$("<label>Affiliation</label>")
//           affiliationNameLabel.attr("class","labelDefinitionTerm")
//
//           var affiliationNameField = $("<input/>");
//           affiliationNameField.attr("type", "text");
//           affiliationNameField.attr("id",affiliation_name+currDynFieldCount.toString())
//           affiliationNameField.attr("name",affiliation_name+currDynFieldCount.toString())
//           affiliationNameField.attr("class","inputTextbox")
//
//           var fieldToAddLine1 = $("<hr/>");
//
//           var Cell11 = $("<td/>");
//           Cell11.append(affiliationTypeLabel);
//
//           var Cell12 = $("<td/>");
//           Cell12.append(selectAffiliation)
//
//           var Cell13 = $("<td/>");
//           Cell13.append(deleteImage)
//
//           var newRow1=$("<tr/>");
//           newRow1.append(Cell11);
//           newRow1.append(Cell12);
//           newRow1.append(Cell13);
//
//           var Cell21 = $("<td/>");
//           Cell21.append(labelExternalEntityMember);
//
//           var Cell22 = $("<td/>");
//           Cell22.append(fieldExternalEntityMemeber);
//
//           var Cell23 =$("<td/>")
//           Cell23.attr("class","fieldErrorPlacement")
//
//           var newRow2 = $("<tr/>");
//           newRow2.attr("id",externalEntityNameRow+currDynFieldCount);
//           newRow2.attr("name",externalEntityNameRow+currDynFieldCount);
//           newRow2.append(Cell21);
//           newRow2.append(Cell22);
//           newRow2.append(Cell23);
//
//           var Cell31 = $("<td/>");
//           Cell31.append(affiliationNameLabel);
//
//           var Cell32 = $("<td/>");
//           Cell32.append(affiliationNameField);
//
//           var Cell33=$("<td/>");
//           Cell33.attr("class","fieldErrorPlacement")
//
//           var newRow3=$("<tr/>");
//           newRow3.append(Cell31);
//           newRow3.append(Cell32);
//           newRow3.append(Cell33);
//           //the _1 at the end is to differentiate it with the combobox that appears
//           //when the type of the faculty member is external.
//           newRow3.attr("id",affiliationNameRow+currDynFieldCount)
//           newRow3.attr("name",affiliationNameRow+currDynFieldCount)
//
//           var Cell41 = $("<td/>");
//           Cell41.append(labelInternalEntityMember);
//
//           var Cell42 = $("<td/>");
//           Cell42.append(selectInternalSource);
//
//           var Cell43 = $("<td/>");
//           Cell43.attr("class","fieldErrorPlacement")
//           var newRow4=$("<tr/>");
//           newRow4.append(Cell41);
//           newRow4.append(Cell42);
//           newRow4.append(Cell43);
//           newRow4.attr("id",internalEntityNameRow+currDynFieldCount)
//           newRow4.attr("name",internalEntityNameRow+currDynFieldCount)
//
//           var Cell51 = $("<td/>");
//           Cell51.attr("colspan","3");
//           Cell51.append(fieldToAddLine1);
//
//           var newRow5 = $("<tr/>");
//           newRow5.append(Cell51);
//
//           var newTable = $("<table/>");
//           newTable.attr("id",tableName+currDynFieldCount);
//           newTable.attr("class",parentTableClass)
//           newTable.attr("align", "left");
//           newTable.append(newRow1);
//           newTable.append(newRow2);
//           newTable.append(newRow3);
//           newTable.append(newRow4);
//           newTable.append(newRow5);
////hiding before adding to the table messes up the alignment.
////hide affiliation name and faculty member name when they are external
//           newRow2.hide()
//           newRow3.hide()
//
//           deleteImage.click(removeEntityInformation);
//
//           $("#dynDivFieldCount").attr("value", currDynFieldCount.toString());
//           $("#dynDivContainer").append(newTable)
//        }
////this function is called when the LUMS affiliation is changed from yes to no or vice versa
//        function affiliationChanged()
//        {
//               var selectedValue = $(this).val();
//               //if the affiliation type selected is external than the field to enter affiliation name appears
//               //otherwise hide the fields
//               var currName = $(this).attr("name")
//               var identificationNumber = currName[currName.length-1]
//
//
//               $("#"+tableName+identificationNumber).find(".dynHiddenFields").each(function()
//               {
//                   $(this).attr("class","")
//               })
//               if (selectedValue == 0)
//               {
//                  $("#"+affiliationNameRow+identificationNumber).show();
//                  $("#"+externalEntityNameRow+identificationNumber).show();
//                  $("#"+internalEntityNameRow+identificationNumber).hide();
//               }
//               else
//               {
//                  $("#"+affiliationNameRow+identificationNumber).hide();
//                  $("#"+externalEntityNameRow+identificationNumber).hide();
//                  $("#"+internalEntityNameRow+identificationNumber).show();
//               }
//        }
////populates with faculty members incase of research grants
////populates with users in case of team and co-authors
//        function populateInternalSource(selectUser,id)
//        {
//           $("#"+id.toString()+" option").each(function()
//           {
//              if (!$(this).val().toString() == "")
//              {
//                   selectUser.append("<option"+" value="+$(this).val()+">"+$(this).text()+"<option/>");
//              }
//           });
//        }
////on click event to delete the information of one entity
//        function removeEntityInformation()
//        {
//            $("#"+$(this).attr("id")).remove();
//
//            var currDynFieldCount = parseInt($("#dynDivFieldCount").attr("value").toString())
//            currDynFieldCount = currDynFieldCount -1;
//            $("#dynDivFieldCount").attr("value", currDynFieldCount.toString());
//
//            counter = 1
//            $("."+parentTableClass).each(function(i,obj)
//            {
//                $(this).find('td').each(function()
//                {
//                    $(this).find('.dropdown').each(function()
//                    {
//                        updateEntityInformation($(this),counter)
//                    });
//                    $(this).find('.inputTextbox').each(function()
//                    {
//                        updateEntityInformation($(this),counter)
//                    });
//                    $(this).find('.dynDivDeleteButton').each(function()
//                    {
//                        updateEntityInformation($(this),counter)
//                    });
//                    $(this).find('#'+mainLabel).each(function()
//                    {
//                           updateLabelText($(this), counter)
//
//                    });
//                });
//
//                $(this).find('tr').each(function()
//                {
//                    if ($(this).attr("id")!=null)
//                        updateEntityInformation($(this), counter)
//                });
//              $(this).attr("id", tableName+counter)
//              $(this).attr("name", tableName+counter)
//              counter = counter+1
//            });
//        }
//
//        function updateEntityInformation(element,counter)
//        {
//           var previousName = element.attr("name").toString()
//           var newName = previousName.substring(0,previousName.length-1)+counter.toString()
//           element.attr("id",newName)
//           element.attr("name",newName)
//        }
//
//        function updateLabelText(element ,counter)
//        {
//            var oldText = element.text()
//            var newText = oldText.substring(0, oldText.length-1)+" "+counter
//            element.text(newText)
//        }
});
