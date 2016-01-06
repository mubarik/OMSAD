$(document).ready(function () {
    $("#cbpublication_type_id").change(function () {
    var publication_type = document.getElementById('cbpublication_type_id');

    $("#txconferencename").removeAttr("required")
    $("#txconferencewebsite").removeAttr("required")
    $("#txconferencestartdate").removeAttr("required")
    $("#txconferenceenddate").removeAttr("required")

    $("#txjournalname").removeAttr("required")

    $("#txworkshopname").removeAttr("required")
    $("#txworkshopconference").removeAttr("required")
    $("#txworkshopwebsite").removeAttr("required")
    $("#txworkshopstartdate").removeAttr("required")
    $("#txworkshopenddate").removeAttr("required")

    $("#txtechnicalreportnumber").removeAttr("required")

    $("#txbookchaptername").removeAttr("required")


    if(publication_type.value == 'Conference Publication')
    {
        $("#conferencepublication").show()
        
              
        $("#journalpublication").hide()
        $("#workshoppublication").hide()     
        $("#bookpublication").hide()     
        $("#bookchapterpublication").hide()       
        $("#technicalreportpublication").hide()
        

        $('#txconferencename').attr('required',true)
        $('#txconferencewebsite').attr('required',true)
        $('#txconferencestartdate').attr('required',true)
        $('#txconferenceenddate').attr('required',true)
 
    }
    if(publication_type.value == 'Workshop Publication')
    {
        $("#conferencepublication").hide()       
        $("#journalpublication").hide()

        $("#workshoppublication").show()
        
        $("#bookpublication").hide()       
        $("#bookchapterpublication").hide()       
        $("#technicalreportpublication").hide()
        

        $('#txworkshopname').attr('required',true)
        $('#txworkshopconference').attr('required',true)
        $('#txworkshopwebsite').attr('required',true)
        $('#txworkshopstartdate').attr('required',true)
        $('#txworkshopenddate').attr('required',true)
    }
    if(publication_type.value == 'Journal Publication')
    {
        $("#conferencepublication").hide()    

        $("#journalpublication").show()
              
        $("#workshoppublication").hide()      
        $("#bookpublication").hide()
        $("#bookchapterpublication").hide()
        $("#technicalreportpublication").hide()

        $('#txjournalname').attr('required',true)

    }
    if(publication_type.value == 'Book Publication')
    {
        $("#conferencepublication").hide()        
        $("#journalpublication").hide()
        $("#workshoppublication").hide()

        $("#bookpublication").show()
        
        $("#bookchapterpublication").hide()
        $("#technicalreportpublication").hide()
    }
    if(publication_type.value == 'Book Chapter Publication')
    {
        $("#conferencepublication").hide()
        $("#journalpublication").hide()
        $("#workshoppublication").hide()
        $("#bookpublication").hide()

        $("#bookchapterpublication").show()
        
        $("#technicalreportpublication").hide()

        $('#txbookchaptername').attr('required',true)

    }
    if(publication_type.value == 'Technical Report Publication')
    {
        $("#conferencepublication").hide()
        $("#journalpublication").hide()
        $("#workshoppublication").hide()
        $("#bookpublication").hide()
        $("#bookButton").hide()
        $("#bookchapterpublication").hide()
        
        $("#technicalreportpublication").show()

        $('#txtechnicalreportnumber').attr('required',true)

    }
});
});
