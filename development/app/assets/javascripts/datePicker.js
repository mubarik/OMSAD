/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function()
{
  
    $(".uidatePicker").datepicker(
    {
        yearRange   :"-100:+100",
        changeMonth :true,
        changeYear  :true,
        dateFormat  :"dd-M-yy"
    });

    $(".uidatePicker").attr("readonly", 'true');

    $(".uienddatePicker").datepicker(
    {
        yearRange   :"-100:+100",
        changeMonth :true,
        changeYear  :true,
        dateFormat  :"dd-M-yy"
    });
    $(".uienddatePicker").attr("readonly", 'true');

    $(".uidayMonthPicker").datepicker(
    {
        dateFormat  :"dd-M",
        changeMonth :true
    });
    $(".uidayMonthPicker").attr("readonly", 'true');

});


function attachDynamicDatePicker(element)
{
       element.datepicker(
        {
            yearRange   :"-100:+20",
            changeMonth :true,
            changeYear  :true,
            dateFormat  :"dd-M-yy"
        });
        element.attr("readonly", 'true');
}