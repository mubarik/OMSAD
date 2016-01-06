$(document).ready(function () {


    if ($('#streporttype').length > 0)
    {
        noSelectionRequired();
        var report_type = $('#streporttype').val();
        if(report_type == "2" || report_type == "3" || report_type == "5" || report_type == "6" || report_type == "7" || report_type == "8" || report_type == "9")
        {
            selectionRequired();
        }
    }

    $("#streporttype").change(function () {

    if($('#streporttype').val() == "1")//if Faculty Information is selected
    {
        noSelectionRequired();
    }

    if($('#streporttype').val() == "2")//if Research Grant is selected
    {
        selectionRequired();
    }

   if($('#streporttype').val() == "3")// if Faculty publications is selected
    {
        selectionRequired();
    }
    if($('#streporttype').val() == "4")//if department is selected
    {
        noSelectionRequired();
    }

    if($('#streporttype').val() == "5")//if PhD supervision is selected
    {
        selectionRequired();

    }

    if($('#streporttype').val() == "6")//if Faculty Courses is selected
    {
        selectionRequired();
    }

    if($('#streporttype').val() == "7")//if Faculty Awards Information is selected
    {
        selectionRequired();

    }
    if($('#streporttype').val() == "8")//if Faculty MS Thesis Supervision is selected
    {
        selectionRequired();

    }
    if($('#streporttype').val() == "9")//if Faculty MS Thesis Supervision is selected
    {
        selectionRequired();
    }
});

function noSelectionRequired()
{
    $("#nameLabel").hide()
    $("#csfaculty_id").hide()
    $("#csfaculty_id").attr("required",null)
}
function selectionRequired()
{
     $("#nameLabel").show()
     $("#csfaculty_id").show()
     $("#csfaculty_id").attr("required",'true')
}
});