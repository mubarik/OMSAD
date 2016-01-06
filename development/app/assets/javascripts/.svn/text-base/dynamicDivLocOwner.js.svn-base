/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function()
{
        $("#dynDivAddLocOwner").click(function()
        {
           var rowName = "Row";
           var columnName = "Column";
           var ownerName="LocOwner";
           var startDate="LocStart";
           var endDate="LocEnd";
           var mainTable = $("dynDivLocContainer");

           var currDynFieldCount = $("#dynDivFieldLocCountOwner").attr("value")
           currDynFieldCount = parseInt(currDynFieldCount)+1;

           var fieldToAddLabelOwner =  $("<label>Owner:<label>")
           fieldToAddLabelOwner.attr("class","labelDefinitionTerm");

           var fieldToAddLabelStartDate =  $("<label>Ownership Start Date:<label>")
           fieldToAddLabelStartDate.attr("class","labelDefinitionTerm");

           var fieldToAddLabelEndDate =  $("<label>Ownership End Date:<label>")
           fieldToAddLabelEndDate.attr("class","labelDefinitionTerm");

           //fieldToAddLabel.attr("text","Owner:");
           //fieldToAddLabel.attr("type", "text");

           var fieldToAdd = $("<input/>");
           fieldToAdd.attr("type", "text");
           fieldToAdd.attr("id",ownerName+currDynFieldCount.toString())
           fieldToAdd.attr("name",ownerName+currDynFieldCount.toString())
           fieldToAdd.attr("class","inputTextbox")

           var fieldToAddSDate = $("<input/>");
           fieldToAddSDate.attr("type", "text");
           fieldToAddSDate.attr("id",startDate+currDynFieldCount.toString())
           fieldToAddSDate.attr("name",startDate+currDynFieldCount.toString())
           fieldToAddSDate.attr("class","uidatePicker");

           var fieldToAddEDate = $("<input/>");
           fieldToAddEDate.attr("type", "text");
           fieldToAddEDate.attr("id",endDate+currDynFieldCount.toString())
           fieldToAddEDate.attr("name",endDate+currDynFieldCount.toString())
           fieldToAddEDate.attr("class","uidatePicker");

           var fieldToAddLine1 = $("<hr/>");

           var fieldToAddAsterisk = $("<label>*<label>");
           fieldToAddAsterisk.attr("class","requiredFieldAsterisk");

            //<span class="requiredFieldAsterisk">*</span>

           var deleteImage =$("<img/>");
           //set the id of the delete image and the row to the same value for easy deletion
           deleteImage.attr("class", "dynDivDeleteButton");
           deleteImage.attr("id",rowName+currDynFieldCount);

           var Cell11 = $("<td/>");
           Cell11.append(fieldToAddLabelOwner);

           var Cell14 = $("<td/>");
           Cell14.append(fieldToAddAsterisk);

           var Cell12 = $("<td/>");
           Cell12.append(fieldToAdd);

           var Cell13 = $("<td/>");
           Cell13.append(deleteImage);

           var row1 = $("<tr/>");
           row1.append(Cell11);
           //row1.append(Cell14);
           row1.append(Cell12);
           row1.append(Cell13);

           var Cell21 = $("<td/>");
           Cell21.append(fieldToAddLabelStartDate);

           var Cell22 = $("<td/>");
           Cell22.append(fieldToAddSDate);

           var row2 = $("<tr/>");
           row2.append(Cell21);
           row2.append(Cell22);

           var Cell31 = $("<td/>");
           Cell31.append(fieldToAddLabelEndDate);

           var Cell32 = $("<td/>");
           Cell32.append(fieldToAddEDate);

           var row3 = $("<tr/>");
           row3.append(Cell31);
           row3.append(Cell32);

           var Cell41 = $("<td/>");
           Cell41.attr("colspan","3");
           Cell41.append(fieldToAddLine1);

           var row4 = $("<tr/>");
           row4.append(Cell41);

           var newTable = $("<table/>");
           newTable.attr("id",rowName+currDynFieldCount);
           newTable.attr("align", "left");
           newTable.append(row1);
           newTable.append(row2);
           newTable.append(row3);
           newTable.append(row4);

           deleteImage.click(function()
           {
              $("#"+deleteImage.attr("id")).remove();
           });
           $("#dynDivFieldLocCountOwner").attr("value", currDynFieldCount.toString());
           $("#dynDivLocContainer").after(newTable)

        });
});



