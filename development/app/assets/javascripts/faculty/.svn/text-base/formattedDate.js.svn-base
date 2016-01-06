    function changeInputDateFormat(element)
    {
        var months = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
         
        var date;
         if(element.attr("value") != '')
         {
             var ddSplit = element.attr("value").split('-');

            if(ddSplit[2].length < 4)
             {
                 date = ddSplit[2]+'-'+months[ddSplit[1]-1] + '-' + ddSplit[0]
                 element.attr("value", date.toString());
             }
             else
                 date=ddSplit[0]+'-'+ddSplit[1] + '-' + ddSplit[2]

             element.attr("value", date);
         }

    }

    function changeLabelDateFormat(element)
    {
        var months = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

        var date;
         if(element.text() != '')
         {
             var ddSplit = element.text().split('-');
            if(ddSplit[2].length < 4)
             {
                 date = ddSplit[2]+'-'+months[ddSplit[1]-1] + '-' + ddSplit[0]
                 element.attr("value", date.toString());
             }
             else
                 date=ddSplit[0]+'-'+ddSplit[1] + '-' + ddSplit[2]

             element.text(date);
         }

    }
    
$(document).ready(function()
{
    $(this).find("input[id*=date]").each(function()
    {
          changeInputDateFormat($(this))
        
    })
    $(this).find("label[id*=date]").each(function()
    {
        changeLabelDateFormat($(this))

    })
});