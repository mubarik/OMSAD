
$(document).ready(function () {
    $('#invtype_id').hide();
    $('#invprinter_id').hide();
    $('#invstatus_id').hide();
    $('#room_id').hide();
    
    $("#selectreport").change(function () {
        
    var report_type = document.getElementById('selectreport');

    if(report_type.value == "3")// if Inventory type is selected
    {
        $("#invtype_id").show()
        $("#invtype_id").attr("required","required")
    }
    if(report_type.value == "" || report_type.value == "0" || report_type.value == "1" || report_type.value == "2" || report_type.value == "4" || report_type.value == "5")
    {
        $("#invtype_id").hide()
        $("#invtype_id").attr("required",null)

    }

// if Inventory history is selected
    if(report_type.value == "2")
    {
        $("#invprinter_id").show()
        $("#invprinter_id").attr("required","required")
    }
    if(report_type.value == "" || report_type.value == "0" || report_type.value == "1" || report_type.value == "3" || report_type.value == "4" || report_type.value == "5")
    {
        $("#invprinter_id").hide()
        $("#invprinter_id").attr("required",null)

    }

    if(report_type.value == "4")
    {
        $("#invstatus_id").show()
        $("#invstatus_id").attr("required","required")
    }
    if(report_type.value == "" || report_type.value == "0" || report_type.value == "1" || report_type.value == "3" || report_type.value == "2" || report_type.value == "5")
    {
        $("#invstatus_id").hide()
        $("#invstatus_id").attr("required",null)

    }

    //Inventory room allocation report
    if(report_type.value == "5")
    {
        $("#room_id").show()
        $("#room_id").attr("required","required")
    }
    if(report_type.value == "" || report_type.value == "0" || report_type.value == "1" || report_type.value == "3" || report_type.value == "2" || report_type.value == "4")
    {
        $("#room_id").hide()
        $("#room_id").attr("required",null)

    }



});



   try{

       $("#selectreportTA").change(function(e)
       {
            var report_type = document.getElementById("selectreportTA");
            var tauserid = document.getElementById('#tauser_id');

            if(report_type.value == "1")// if Inventory type is selected
            {
           
                $("#tacombo").show()

            }
            else
                 {
                     $("#tacombo").hide()
                     
                 }
       });


    }catch(err){alert("error")}

    try{

       $("#selectreportRA").change(function(e)
       {
            var report_type = document.getElementById("selectreportTA");
            var tauserid = document.getElementById('#tauser_id');

            if(report_type.value == "1")// if Inventory type is selected
            {

                $("#tacombo").show()

            }
            else
                 $("#tacombo").hide()
       });


    }catch(err){alert("error")}

});

