$(document).ready(function() {

 //alert($("#normalSelectid").val())
      //in case of edit record
      
          try{
                if(($("#normalSelectid").val())=="1")//cpu
                {
                    //alert("")
                     $("#inventory_cpu_attributes_processorname").attr("required","true");
                }
                else if($("#normalSelectid").val().toString()=="2")//printer
                {
                   
                     $("#inventory_printer_attributes_technology").attr("required","false");
                }
                else if(($("#normalSelectid").val())=="3")//scanner
                {
                   
                     $("#inventory_scanner_attributes_scannertype").attr("required","true");
                }
                else if(($("#normalSelectid").val())=="4")//lcd
                {

                    $("#inventory_lcd_attributes_lcdtype").attr("required","true");
                  
                }
           }catch(err){}

      
       
       function hide_div()
       {
         $("#target_div").hide();
         $("#divPrinterDetails").hide();
         $("#divScannerDetails").hide();
         $("#divLCDDetails").hide();
         $("#divCPUDetails").hide();
       }

       $("#hide_link").click(hide_div);

       function toggle_div()
       {
           $("#target_div2").toggle().highlight();

       }

       $("#toggle_link").click(toggle_div);

       $("#normalSelectid").change(show_hide_other);
        $("#name_id").change(show_hide_other);
       $("#other_fruit").hide();

       function show_hide_other()
       {
           var selected_inventoryType = $("#normalSelectid").val();
                if(selected_inventoryType == "1")//cpu
                  {
                      
                      $("#divCPUDetails").show();
                      $("#divLCDDetails").hide(); 
                      $("#divPrinterDetails").hide();
                      $("#divScannerDetails").hide();

                      $("#technology").val('');
                      $("#speed").val('');
                      $("#memory").val('');
                      $("#mediatype").val('');

                      $("#scannertype").val('');
                      $("#resolutionscanner").val('');
                      $("#scansize").val('');
                      $("#fileformate").val('');

                      $("#lcdtype").val('');
                      $("#resolutionlcd").val('');
                      $("#sizelcd").val('');
                      $("#inventory_cpu_attributes_processorname").attr("required","true");
                      $("#inventory_printer_attributes_technology").removeAttr("required")
                      $("#inventory_lcd_attributes_lcdtype").removeAttr("required")
                      $("#inventory_scanner_attributes_scannertype").removeAttr("required")
                  }
                else if(selected_inventoryType == "2")//printer
                        {
                            $("#divCPUDetails").hide();
                            $("#divLCDDetails").hide();
                            $("#divPrinterDetails").show();
                            $("#divScannerDetails").hide();

                            $("#processorname").val('');
                            $("#numberofcores").val('');
                            $("#numberofthreads").val('');
                            $("#cpumemory").val('');
                            $("#harddisk").val('');
                            $("#dvdrom").val('');
                            $("#cdrom").val('');
                            $("#keyboard").val('');
                            $("#mouse").val('');
                            $("#soundcard").val('');
                            $("#vga").val('');
                            $("#ram").val('');

                            $("#scannertype").val('');
                            $("#resolutionscanner").val('');
                            $("#scansize").val('');
                            $("#fileformate").val('');

                            $("#lcdtype").val('');
                            $("#resolutionlcd").val('');
                            $("#sizelcd").val('');
                            $("#inventory_cpu_attributes_processorname").removeAttr("required")
                            $("#inventory_printer_attributes_technology").attr("required","true");
                            $("#inventory_lcd_attributes_lcdtype").removeAttr("required")
                            $("#inventory_scanner_attributes_scannertype").removeAttr("required")
                        }
                        else if(selected_inventoryType == "3")//scanner
                                  {
                                      $("#divCPUDetails").hide();
                                      $("#divLCDDetails").hide();
                                      $("#divPrinterDetails").hide();
                                      $("#divScannerDetails").show();

                                      $("#technology").val('');
                                      $("#speed").val('');
                                      $("#memory").val('');
                                      $("#mediatype").val('');

                                      $("#processorname").val('');
                                      $("#numberofcores").val('');
                                      $("#numberofthreads").val('');
                                      $("#cpumemory").val('');
                                      $("#harddisk").val('');
                                      $("#dvdrom").val('');
                                      $("#cdrom").val('');
                                      $("#keyboard").val('');
                                      $("#mouse").val('');
                                      $("#soundcard").val('');
                                      $("#vga").val('');
                                      $("#ram").val('');

                                      $("#lcdtype").val('');
                                      $("#resolutionlcd").val('');
                                      $("#sizelcd").val('');
                                      $("#inventory_cpu_attributes_processorname").removeAttr("required")
                                      $("#inventory_printer_attributes_technology").removeAttr("required")
                                      $("#inventory_lcd_attributes_lcdtype").removeAttr("required")
                                      $("#inventory_scanner_attributes_scannertype").attr("required","true");
                                  }
                                  else if(selected_inventoryType == "4")//lcd
                                            {
                                                $("#divCPUDetails").hide();
                                                $("#divLCDDetails").show();
                                                $("#divPrinterDetails").hide();
                                                $("#divScannerDetails").hide();

                                                $("#technology").val('');
                                                $("#speed").val('');
                                                $("#memory").val('');
                                                $("#mediatype").val('');

                                                $("#processorname").val('');
                                                $("#numberofcores").val('');
                                                $("#numberofthreads").val('');
                                                $("#cpumemory").val('');
                                                $("#harddisk").val('');
                                                $("#dvdrom").val('');
                                                $("#cdrom").val('');
                                                $("#keyboard").val('');
                                                $("#mouse").val('');
                                                $("#soundcard").val('');
                                                $("#vga").val('');
                                                $("#ram").val('');

                                                $("#scannertype").val('');
                                                $("#resolutionscanner").val('');
                                                $("#scansize").val('');
                                                $("#fileformate").val('');
                                                $("#inventory_cpu_attributes_processorname").removeAttr("required")
                                                $("#inventory_printer_attributes_technology").removeAttr("required")
                                                $("#inventory_lcd_attributes_lcdtype").attr("required","true");
                                                $("#inventory_scanner_attributes_scannertype").removeAttr("required")
                                            }
                                       else
                                       {
                                           $("#divCPUDetails").hide();
                                           $("#divLCDDetails").hide();
                                           $("#divPrinterDetails").hide();
                                           $("#divScannerDetails").hide();

                                           $("#technology").val('');        //printer
                                           $("#speed").val('');
                                           $("#memory").val('');
                                           $("#mediatype").val('');

                                           $("#processorname").val('');     //cpu
                                           $("#numberofcores").val('');
                                           $("#numberofthreads").val('');
                                           $("#cpumemory").val('');
                                           $("#harddisk").val('');
                                           $("#dvdrom").val('');
                                           $("#cdrom").val('');
                                           $("#keyboard").val('');
                                           $("#mouse").val('');
                                           $("#soundcard").val('');
                                           $("#vga").val('');
                                           $("#ram").val('');

                                           $("#scannertype").val('');       //scanner
                                           $("#resolutionscanner").val('');
                                           $("#scansize").val('');
                                           $("#fileformate").val('');

                                           $("#lcdtype").val('');           //lcd
                                           $("#resolutionlcd").val('');
                                           $("#sizelcd").val('');
                                           $("#inventory_cpu_attributes_processorname").removeAttr("required")
                                           $("#inventory_printer_attributes_technology").removeAttr("required")
                                           $("#inventory_lcd_attributes_lcdtype").removeAttr("required")
                                           $("#inventory_scanner_attributes_scannertype").removeAttr("required")
                                       }


           
       }
});




