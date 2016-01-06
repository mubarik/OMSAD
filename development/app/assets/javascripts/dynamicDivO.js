/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var months = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
var mainTableClass = "mainTable"
var tableName = "Table";
var rowName   = "row";
var mainLabel = "mainLabel"

function vform(){
    return true;
    }


    function getDateObj(strVal)
    {
            var dtStart=new Date();
            var ddStSplit = strVal.split('-');
            dtStart.setFullYear(ddStSplit[2],getMonth(ddStSplit[1]), ddStSplit[0])

            return dtStart;
    }
    function compareDates(D1, D2,eq)
    {
        //iff D1 is less than D2

        var flag=0;
        var dtD1= getDateObj(D1);
        var dtD2 =getDateObj(D2);
        if(eq==1)
         {
             if(dtD1 <= dtD2)
             {
               flag=1;
             }
             else
             {
               flag=0;
             }
         }
         else  if(eq==0)
         {
             if(dtD1 < dtD2)
             {
               flag=1;
             }
             else
             {
               flag=0;
             }
         }
        





      return flag;

    }

    function getDayStr(strVal)
    {
        if(strVal.length==1)
            strVal="0"+strVal
        return strVal

    }

 function getMonth(strVal)
        {
            var stMonth;


            if(strVal=="Jan")
                        {
                           stMonth="0";
                        }
            else if(strVal=="Feb")
                        {
                           stMonth="1";
                        }
            else if(strVal=="Mar")
                        {
                           stMonth="2";
                        }
            else if(strVal=="Apr")
                       {
                           stMonth="3";
                        }
            else if(strVal=="May")
                        {
                           stMonth="4";
                        }
            else if(strVal=="Jun")
                        {
                           stMonth="5";
                        }
            else if(strVal=="Jul")
                        {
                           stMonth="6";

                        }
            else if(strVal=="Aug")
                        {
                           stMonth="7";
                        }
            else if(strVal=="Sep")
                        {
                           stMonth="8";
                        }
            else if(strVal=="Oct")
                        {
                           stMonth="9";
                        }
             else if(strVal=="Nov")
                        {
                           stMonth="10";
                        }
             else if(strVal=="Dec")
                        {
                           stMonth="11";
                        }

            return stMonth;
        }

        function Init()
        {

           try{

                LoadEditControls();
                RenameFields();
               if($("#acqdate").attr("value")!="")
                {
                    var acqSplit = $("#acqdate").attr("value").split('-');
                    if(acqSplit[2].length < 4)
                    {
                      stDate=acqSplit[2]+'-'+months[acqSplit[1]-1] + '-' + acqSplit[0]

                      $("#acqdate").attr("value", stDate.toString());
                    }
                }

                $("#acqdate").change(function(i,obj)
                     {

                        //get date values
                        var acqDate =  $("#acqdate").attr("value");
                        //its value should be less than equal to star date

                        if(acqDate != "")
                        {
                                if($("#ostartdate").attr("value")!="")
                                    {
                                        var allowedStart=compareDates(acqDate,$("#ostartdate").attr("value"),0 );
                                        var allowedCurrent=compareDates(acqDate,getCurrentDate(),0 );
                                        if((allowedStart==1) && (allowedCurrent==1))
                                            {
                                                setErrorMessage("macqerror","")
                                                setErrorMessage("merror","")
                                            }
                                         else if (allowedStart==0)
                                             {
                                                  $("#acqdate").attr("value","");
                                                  setErrorMessage("macqerror","should be less than start date")
                                                  setErrorMessage("merror","")
                                             }
                                        else if (allowedCurrent==0)
                                             {
                                                  $("#acqdate").attr("value","");
                                                  setErrorMessage("macqerror","should be less than current date")
                                                  setErrorMessage("merror","")
                                             }
                                    }
                                    else
                                    {

                                              setErrorMessage("macqerror","")
                                              setErrorMessage("merror","")
                                    }

                         }

                     });

                $("#ostartdate").attr("value",getCurrentDate());
                if($("#ostartdate").attr("value")!="")
                {

                    var stSplit = $("#ostartdate").attr("value").split('-');

                    if(stSplit[2].length < 4)
                    {
                        stDate=stSplit[2].toString()+'-'+months[stSplit[1]-1] + '-' + stSplit[0]

                    }
                    else
                    {
                            stDate=getDayStr(stSplit[0].toString()) +'-'+stSplit[1] + '-' + stSplit[2]
                    }
                     $("#ostartdate").attr("value", stDate.toString());

                }

                try{

                    if($("#oenddate").attr("value")!="")
                    {

                        stSplit = $("#oenddate").attr("value").split('-');

                        if(stSplit[2].length < 4)
                        {
                            stDate=stSplit[2].toString()+'-'+months[stSplit[1]-1] + '-' + stSplit[0]

                        }
                        else
                        {
                                stDate=getDayStr(stSplit[0].toString()) +'-'+stSplit[1] + '-' + stSplit[2]
                        }
                         $("#oenddate").attr("value", stDate.toString());

                    }

                    $("#oenddate").change(function(i,obj)
                     {
                          //get date values
                        var oendDate =  $("#oenddate").attr("value");
                        if(oendDate != "")
                        {
                             if($("#ostartdate").attr("value")!="")
                                    {
                                        var allowedStart=compareDates($("#ostartdate").attr("value"),oendDate,0 );
                                        var allowedCurrent=compareDates(getCurrentDate(),oendDate,0 );
                                        if((allowedStart==1) && (allowedCurrent==1))
                                            {
                                                setErrorMessage("macqerror","")
                                                setErrorMessage("merror","")
                                                setErrorMessage("menderror","")
                                            }
                                         else if (allowedStart==0)
                                             {
                                                  $("#oenddate").attr("value","");
                                                  setErrorMessage("macqerror","")
                                                  setErrorMessage("menderror","should be greater than start date")
                                                  setErrorMessage("merror","")
                                             }
                                        else if (allowedCurrent==0)
                                             {
                                                  $("#acqdate").attr("value","");
                                                  setErrorMessage("macqerror","")
                                                  setErrorMessage("menderror","should be greater than current date")
                                                  setErrorMessage("merror","")
                                             }
                                    }
                                    else
                                    {
                                              setErrorMessage("menderror","")
                                              setErrorMessage("macqerror","")
                                              setErrorMessage("merror","")
                                    }
                        }
                     });


                }
                catch(err){}

           }
           catch(err){}
        }


    function AllowAdd()
    {
        if(checkEmptyFields())
        {

            $("#divCheck").attr("value","0");
            return true;
        }
        else {

            $("#divCheck").attr("value","1");
            return false;
        }
    }
    //$("#dynDivAddOwner").unbind('click').bind('click',handler)

$(document).ready(function()
{


        Init();

   $("#dynDivAddOwner").click(function()
   {
        if(AllowAdd())
                {
                    $("#divCheck").attr("value","1")

                    //if($("#acqdate").attr("value")!="")

                   var rowName = "Table";
                   var columnName = "Column";
                   var ownerName="name_id";
                   var startDate="ostartdate";
                   var endDate="oenddate";
                   var DdlOwner = "ddlOwner";
                   var mainTable = $("dynDivContainer1");

                   var currDynFieldCount = $("#dynDivFieldCountOwner").attr("value")

                       currDynFieldCount = parseInt(currDynFieldCount)+1;


                       var fieldToAddLabelOwner =  $("<label>Owner:<label>")
                       fieldToAddLabelOwner.attr("class","labelDefinitionTerm");

                       var fieldToAddLabelStartDate =  $("<label>Start Date:<label>")
                       fieldToAddLabelStartDate.attr("class","labelDefinitionTerm");

                       var fieldToAddLabelEndDate =  $("<label> End Date:<label>")
                       fieldToAddLabelEndDate.attr("class","labelDefinitionTerm");



                       var fieldToSelectOwner =$("<select/>")
                        fieldToSelectOwner.attr("id",ownerName+currDynFieldCount.toString())
                        fieldToSelectOwner.attr("name",ownerName+currDynFieldCount.toString())
                        fieldToSelectOwner.attr("class","histdropdown")

                         //populate the select owner tag
                       populateInternalSource(fieldToSelectOwner, "name_id")

                       var fieldToAddSDate = $("<input/>");
                       fieldToAddSDate.attr("type", "text");
                       fieldToAddSDate.attr("id",startDate+currDynFieldCount.toString())
                       fieldToAddSDate.attr("name",startDate+currDynFieldCount.toString())
                       fieldToAddSDate.attr("class","inputTextboxSt");
                       fieldToAddSDate.datepicker({changeMonth:true,changeYear:true,dateFormat:"dd-M-yy"});

                       var fieldToAddEDate = $("<input/>");
                       fieldToAddEDate.attr("type", "text");
                       fieldToAddEDate.attr("id",endDate+currDynFieldCount.toString())
                       fieldToAddEDate.attr("name",endDate+currDynFieldCount.toString())
                       fieldToAddEDate.attr("class","inputTextboxEd");
                       fieldToAddEDate.datepicker({changeMonth:true,changeYear:true,dateFormat:"dd-M-yy"});

                       var fieldToAddLine1 = $("<hr/>");

                       var fieldToAddAsterisk = $("<label>*<label>");
                       fieldToAddAsterisk.attr("class","requiredFieldAsterisk");

                        //<span class="requiredFieldAsterisk">*</span>

                       var deleteImage =$("<img/>");
                       //set tvarhe id of the delete image and the row to the same value for easy deletion
                       deleteImage.attr("class", "dynDivDeleteButton");
                       deleteImage.attr("id",rowName+currDynFieldCount);

                       var Cell11 = $("<td/>");
                       Cell11.append(fieldToAddLabelOwner);

                       var Cell14 = $("<td/>");
                       Cell14.append(fieldToAddAsterisk);

                       var Cell12 = $("<td/>");
                       Cell12.append(fieldToSelectOwner);

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


                       var Cell33 = $("<td ><span id='dtErorr"+currDynFieldCount.toString()+"' class='error error-keyup-1' style='color:red ; margin-left: 15px;'></span></td>");
                       var Cell34 = $("<td ><span id='dtOErorr"+currDynFieldCount.toString()+"' class='error error-keyup-1' style='color:red ; margin-left: 15px;'></span></td>");
                       var Cell35 = $("<td ><input class='chkValS' id='ChkS"+currDynFieldCount.toString()+"' name='ChkS"+currDynFieldCount.toString()+"' style='display: none;' type='hidden' value=0 /></td>");
                       var Cell36 = $("<td ><input class='chkValE' id='ChkE"+currDynFieldCount.toString()+"' name='ChkE"+currDynFieldCount.toString()+"' style='display: none;' type='hidden' value=0 /></td>");


                       var row3 = $("<tr/>");
                       row3.append(Cell31);
                       row3.append(Cell32);
                       row3.append(Cell33);
                       row3.append(Cell34);
                       row3.append(Cell35);
                       row3.append(Cell36);

                       var Cell41 = $("<td/>")
                       Cell41.attr("colspan","3");
                       Cell41.append(fieldToAddLine1);

                       var row4 = $("<tr/>");
                       row4.append(Cell41);

                       var newTable = $("<table class = 'mainTable'/>");
                       newTable.attr("id",rowName+currDynFieldCount);
                       newTable.attr("align", "left");
                       newTable.append(row1);
                       newTable.append(row2);
                       newTable.append(row3);
                       newTable.append(row4);

                       deleteImage.click(function()
                       {
                          $("#"+deleteImage.attr("id")).remove();
                          currDynFieldCount=currDynFieldCount-1
                          $("#dynDivFieldCountOwner").attr("value", currDynFieldCount.toString());

                          //LoadControls();
                         // RenameFields();

                       });


                        fieldToAddSDate.change(function()
                        {
                             var dtStartDate;
                             var dtEndDate


                            if(fieldToAddSDate.attr("value")=="")
                            {
                                  $("#ChkS"+currDynFieldCount.toString()).attr("value","0");

                              return false;
                            }
                            else
                            {
                               dtStartDate = getDateObj(fieldToAddSDate.attr("value"));

                               if((compareDates(fieldToAddSDate.attr("value"),getCurrentDate(),0)>0)&&(compareDates($("#acqdate").attr("value"),fieldToAddSDate.attr("value"),1)>0))
                               {

                                  $("#ChkS"+currDynFieldCount.toString()).attr("value","1");
                                  setErrorMessage("dtErorr"+currDynFieldCount.toString(),"");
                               }
                               else if(compareDates(getCurrentDate(),fieldToAddSDate.attr("value"),1)==1)
                               {

                                       $("#ChkS"+currDynFieldCount.toString()).attr("value","0");
                                       setErrorMessage("dtErorr"+currDynFieldCount.toString(),"should be less than current date");

                                       fieldToAddSDate.attr("value","");
                                       return false;
                               }
                               else if(compareDates(fieldToAddSDate.attr("value"),$("#acqdate").attr("value"),0)==1)
                               {

                                       $("#ChkS"+currDynFieldCount.toString()).attr("value","0");
                                       setErrorMessage("dtErorr"+currDynFieldCount.toString(),"should be greater than or equal to Acq. date");
                                       fieldToAddSDate.attr("value","");
                                       return false;
                               }



                            }


                            if(fieldToAddEDate.attr("value")=="")
                            {
                              $("#ChkE"+currDynFieldCount.toString()).attr("value","0");

                              return false;
                            }
                            else
                            {
                               if(compareDates(fieldToAddEDate.attr("value"),fieldToAddSDate.attr("value"),0)==1)
                               {

                                       $("#ChkS"+currDynFieldCount.toString()).attr("value","0");
                                       setErrorMessage("dtErorr"+currDynFieldCount.toString(),"should be less than end date");
                                       fieldToAddSDate.attr("value","");
                                       fieldToAddEDate.attr("value","");
                                       return false;
                               }
                               else
                                {
                                   compareHistoryDates(fieldToAddSDate.attr("value"),fieldToAddEDate.attr("value"),currDynFieldCount.toString());

                                }

                            }



                         });

                       fieldToAddEDate.change(function()
                       {


                            if(fieldToAddEDate.attr("value")=="")
                            {
                                  $("#ChkE"+currDynFieldCount.toString()).attr("value","0");

                              return false;
                            }
                            else
                            {


                               if((compareDates(fieldToAddEDate.attr("value"),getCurrentDate(),0)>0)&&(compareDates($("#acqdate").attr("value"),fieldToAddEDate.attr("value"),0)>0))
                               {

                                  $("#ChkE"+currDynFieldCount.toString()).attr("value","1");
                                  setErrorMessage("dtErorr"+currDynFieldCount.toString(),"");
                               }
                               else if(compareDates(getCurrentDate(),fieldToAddEDate.attr("value"),1)==1)
                               {

                                       $("#ChkE"+currDynFieldCount.toString()).attr("value","0");
                                       setErrorMessage("dtErorr"+currDynFieldCount.toString(),"should be less than current date");
                                       fieldToAddEDate.attr("value","");
                                       return false;
                               }
                               else if(compareDates(fieldToAddEDate.attr("value"),$("#acqdate").attr("value"),0)==1)
                               {

                                       $("#ChkE"+currDynFieldCount.toString()).attr("value","0");
                                       setErrorMessage("dtErorr"+currDynFieldCount.toString(),"should be greater than or equal to Acq. date");
                                       fieldToAddEDate.attr("value","");
                                       return false;
                               }

                            }


                            if(fieldToAddSDate.attr("value")=="")
                            {
                              $("#ChkE"+currDynFieldCount.toString()).attr("value","0");

                              return false;
                            }
                            else
                            {
                               if(compareDates(fieldToAddEDate.attr("value"),fieldToAddSDate.attr("value"),0)==1)
                               {

                                       $("#ChkS"+currDynFieldCount.toString()).attr("value","0");
                                       setErrorMessage("dtErorr"+currDynFieldCount.toString(),"should be less than end date");

                                       fieldToAddSDate.attr("value","");
                                       fieldToAddEDate.attr("value","");
                                       return false;
                               }
                               else
                                {
                                    compareHistoryDates(fieldToAddSDate.attr("value"),fieldToAddEDate.attr("value"),currDynFieldCount.toString());

                                }

                            }

                         });




                       $("#dynDivFieldCountOwner").attr("value", currDynFieldCount.toString());
                       $("#dynDivContainer1").after(newTable)

            }
            else
            {

            }
    });



});



function populateInternalSource(selectUser,id)
        {

           $("#"+id.toString()+" option").each(function()
           {

              if (!$(this).val().toString() == "")
              {
                   selectUser.append("<option"+" value="+$(this).val()+">"+$(this).text()+"<option/>");
              }
           });
        }

    function setErrorMessage(strName,strMsg)
    {

        $("#"+strName).text(strMsg);

    }

    function checkEmptyFields()
        {



            if(($("#inventoryname").attr("value")!="") ||($("#brand").attr("value")!="")||($("#model").attr("value")!=""))
            {
                setErrorMessage("macqerror","")
                setErrorMessage("merror","")
            }
            else
            {

                    setErrorMessage("merror","Mandatory Fields Required from Inventory Information Section")
                    return false;
            }

             //Empty Acquisition date field not allowed
            if($("#acqdate").attr("value")!="")
            {
                    setErrorMessage("macqerror","")
                    setErrorMessage("merror","")

            }
            else
            {

               setErrorMessage("macqerror","Acquisition Date required")
               setErrorMessage("merror","")
               return false;
            }

           return CheckHistoryFields();



        }

    function CheckHistoryFields()
    {


    if( parseInt($("#dynDivFieldCountOwner").attr("value"))>=1)
        {

         var flag=1;
            //for i= 0 till count
             $(".chkValS").each(function(i,obj)
               {

                  i=i+1;
                 try
                 {

                 

                      if(($(("#ChkS")+i.toString()).attr("value")=="0") || ($(("#ChkE")+i.toString()).attr("value")=="0"))
                      {

                         flag=0;
                      }
                  }catch(err){}

               });



            if(flag == 0)
                {

                     setErrorMessage("merror","Please fill Empty Fields")
                     setErrorMessage("macqerror")
                     return false;
                }
            else
                {
                   setErrorMessage("macqerror","")
                   setErrorMessage("merror","")
                   return true;
                }
        }
        else
            {

                return true
            }

    }

     function getCurrentDate()
       {

           var cDate=new Date();
           var strDate=cDate.getDate()+"-"+months[cDate.getMonth()]+"-" +cDate.getFullYear()
           return strDate;
       }

    function getTomorrow()
    {
        var date =new Date();
        var tomorrow = new Date(date.getTime() + 24 * 60 * 60 * 1000);

        return tomorrow

    }

    function RenameFields()
    {


                 counter=0;
                 $("."+mainTableClass).each(function(i,obj)
                 {

                    i=i+1;

                    //change table name
                    $(this).attr("id",tableName+i.toString())
                    $(this).attr("name",tableName+i.toString())
                    //change drop down id
                    $(this).find(".histdropdown").each(function()
                        {
                            $(this).attr("id","name_id"+i.toString())
                            $(this).attr("name","name_id"+i.toString())
                            //$(this).attr("class","dropdown")

                        });
                   counter=i;

                   $("#dynDivFieldCountOwner").attr("value", counter.toString());





                  $(this).find(".chkValS").each(function(j,obj)
                  {

                      j=j+1

                      $(this).attr("id","ChkS"+i.toString())
                      $(this).attr("name","ChkS"+i.toString())
                  });

                  $(this).find(".chkValE").each(function(j,obj)
                  {
                      j=j+1
                      $(this).attr("id","ChkE"+i.toString())
                      $(this).attr("name","ChkE"+i.toString())
                  });
               });

                 //change remove button id
                  $(".dynDivDeleteButton").each(function(j,obj)
                        {
                            j=j+1;

                            $(this).attr("id",tableName+j.toString())
                            $(this).attr("name",tableName+j.toString())
                            $(this).attr("class","dynDivDeleteButton")

                            $(this).click(function()
                               {

                                  $("#"+ $(this).attr("id")).remove();
                                  var fieldCount=$("#dynDivFieldCountOwner").attr("value")-1

                                  $("#dynDivFieldCountOwner").attr("value",fieldCount)
                                  if(fieldCount==0)
                                      {
                                        $("#divCheck").attr("value","1");
                                      }
                                  //rename all controls

                                  RenameFields();
                                  LoadEditControls();

                               });

                        });


    }


    function LoadEditControls()
    {

                 counter=0;


                 $("."+mainTableClass).each(function(i,obj)
                 {

                    i=i+1;
                        $(this).find(".errorkeyup1").each(function(k,obj)
                        {
                            $(this).attr("id","dtErorr"+i.toString())
                            $(this).attr("name","dtErorr"+i.toString())
                        });

                         $(this).find(".errorkeyup01").each(function(k,obj)
                        {
                            $(this).attr("id","dt0Erorr"+i.toString())
                            $(this).attr("name","dt0Erorr"+i.toString())
                        });



                        $(this).find(".inputTextboxSt").each(function(k,obj)
                        {

                            $(this).attr("id","ostartdate"+i.toString())
                            $(this).attr("name","ostartdate"+i.toString())

                            $(this).attr("class","inputTextboxSt")

                            $(this).datepicker({changeMonth:true,changeYear:true,dateFormat:"dd-M-yy"});
                            $(this).datepicker();
                            if($(this).attr("value")!="")
                               {
                                var ddSplit = $(this).attr("value").split('-');
                                if(ddSplit[2].length < 4)
                                  {
                                    var stDate=ddSplit[2]+'-'+months[ddSplit[1]-1] + '-' + ddSplit[0]
                                    $(this).attr("value", stDate.toString());
                                  }
                               }

                                $(this).change(function()
                                {

                                        if( $(this).attr("value")=="")
                                        {
                                              $("#ChkS"+i.toString()).attr("value","0");

                                          return false;
                                        }
                                        else
                                        {
                                           var dtStartDate = getDateObj( $(this).attr("value"));

                                           if((compareDates( $(this).attr("value"),getCurrentDate(),0)>0)&&(compareDates($("#acqdate").attr("value"), $(this).attr("value"),1)>0))
                                           {

                                              $("#ChkS"+i.toString()).attr("value","1");
                                              setErrorMessage("dtErorr"+i.toString(),"");
                                              setErrorMessage("dt0Erorr"+i.toString(),"");
                                           }
                                           else if(compareDates(getCurrentDate(), $(this).attr("value"),1)==1)
                                           {

                                                   $("#ChkS"+i.toString()).attr("value","0");
                                                   setErrorMessage("dtErorr"+i.toString(),"should be less than current date");
                                                   $(this).attr("value","");
                                                   return false;
                                           }
                                           else if(compareDates( $(this).attr("value"),$("#acqdate").attr("value"),0)==1)
                                           {

                                                   $("#ChkS"+i.toString()).attr("value","0");
                                                   setErrorMessage("dtErorr"+i.toString(),"should be greater than or equal to Acq. date");
                                                   $(this).attr("value","");
                                                   return false;
                                           }



                                        }
//

                                        if($("#oenddate"+i.toString()).attr("value")=="")
                                        {
                                          $("#ChkE"+i.toString()).attr("value","0");

                                          return false;
                                        }
                                        else
                                        {

                                           if(compareDates($("#oenddate"+i.toString()).attr("value"), $(this).attr("value"),0)==1)
                                           {
                                                   $("#ChkS"+i.toString()).attr("value","0");
                                                   setErrorMessage("dtErorr"+i.toString()," should be less than end date");
                                                    $(this).attr("value","");
                                                   $("#ostartdate"+i.toString()).attr("value","");
                                                   return false;
                                           }
                                           else
                                            {

                                               compareHistoryDates( $(this).attr("value"),$("#oenddate"+i.toString()).attr("value"),i.toString());

                                            }

                                        }
                                });


                        });

                        $(this).find(".inputTextboxEd").each(function(j,obj)
                        {

                            $(this).attr("id","oenddate"+i.toString())
                            $(this).attr("name","oenddate"+i.toString())
                            $(this).attr("class","inputTextboxEd")
                            $(this).datepicker({changeMonth:true,changeYear:true,dateFormat:"dd-M-yy"});
                             //$(this).datepicker();
                            if($(this).attr("value")!="")
                            {
                               var ddSplit = $(this).attr("value").split('-');
                               if(ddSplit[2].length < 4)
                                {
                                  var stDate=ddSplit[2]+'-'+months[ddSplit[1]-1] + '-' + ddSplit[0]
                                  $(this).attr("value", stDate.toString());
                                }
                            }
                             $(this).change(function()
                                {
                                    if($(this).attr("value")=="")
                                    {
                                          $("#ChkE"+i.toString()).attr("value","0");

                                      return false;
                                    }
                                    else
                                    {


                                       if((compareDates($(this).attr("value"),getCurrentDate(),0)>0)&&(compareDates($("#acqdate").attr("value"),$(this).attr("value"),0)>0))
                                       {

                                          $("#ChkE"+i.toString()).attr("value","1");
                                          setErrorMessage("dtErorr"+i.toString(),"");
                                       }
                                       else if(compareDates(getCurrentDate(),$(this).attr("value"),1)==1)
                                       {

                                               $("#ChkE"+i.toString()).attr("value","0");
                                               setErrorMessage("dtErorr"+i.toString(),"should be less than current date");
                                               $(this).attr("value","");
                                               return false;
                                       }
                                       else if(compareDates($(this).attr("value"),$("#acqdate").attr("value"),0)==1)
                                       {

                                               $("#ChkE"+i.toString()).attr("value","0");
                                               setErrorMessage("dtErorr"+i.toString(),"should be greater than or equal to Acq. date");
                                               $(this).attr("value","");
                                               return false;
                                       }

                                    }


                                    if($("#ostartdate"+i.toString()).attr("value")=="")
                                    {
                                      $("#ChkE"+i.toString()).attr("value","0");

                                      return false;
                                    }
                                    else
                                    {
                                       if(compareDates($(this).attr("value"),$("#ostartdate"+i.toString()).attr("value"),0)==1)
                                       {

                                               $("#ChkS"+i.toString()).attr("value","0");
                                               setErrorMessage("dtErorr"+i.toString(),"start date should be less than end date");

                                               $("#ostartdate"+i.toString()).attr("value","");
                                               $(this).attr("value","");
                                               return false;
                                       }
                                       else
                                        {
                                            compareHistoryDates($("#ostartdate"+i.toString()).attr("value"),$(this).attr("value"),i.toString());

                                        }

                                    }

                                });
                        });





            });

    }
    //$("#ostartdate").attr("value")
    
     function compareHistoryDates(dtValStart,dtValEnd,index)
        {

            if((dtValStart!="")&& (dtValEnd !=""))
             {
               var dtStDate = getDateObj(dtValStart);


               var dtEdDate = getDateObj(dtValEnd);


               counter=0;
               $(".mainTable").each(function(i,obj)
               {
                 i=i+1;


                 if(index != i)
                     {

                         if(($(("#ostartdate")+i.toString()).attr("value")!="")&& ($(("#oenddate")+i.toString()).attr("value") !=""))
                         {

                                    var dtStartDate = getDateObj($(("#ostartdate")+i.toString()).attr("value"));
                                    var dtEndDate = getDateObj($(("#oenddate")+i.toString()).attr("value"));


                                    if(((dtStartDate < dtStDate)&& (dtStartDate < dtEdDate) && (dtEndDate < dtStDate)&& (dtEndDate < dtEdDate))
                                    ||((dtStartDate > dtStDate)&& (dtStartDate > dtEdDate) && (dtEndDate > dtStDate)&& (dtEndDate > dtEdDate)))
                                    {
                                           setErrorMessage("dtErorr"+index.toString(),"");
                                    }
                                    else
                                    {
                                           setErrorMessage("dtErorr"+index.toString(),"Overlapping dates not allowed");
                                           $(("#enddate")+index.toString()).attr("value","");
                                           return false;
                                    }

                            }
              }


           });
         }
        }
