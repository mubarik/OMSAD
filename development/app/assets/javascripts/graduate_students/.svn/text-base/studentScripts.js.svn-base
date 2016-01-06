//financial aid fields enable/disable on financial aid status
$(document).ready(function() {

      $('#user_photo').attr('size', 23);
//    if ($('#user_student_attributes_financialaidstatus').val() == 'Provided')
//        $('#financialAidFields').show();
//    else
//        $('#financialAidFields').hide();
//
//    $('#user_student_attributes_financialaidstatus').change(function() {
//        if ($(this).val() == 'Provided')
//            $('#financialAidFields').slideDown();
//        else
//            $('#financialAidFields').slideUp();
//    });
//
//    if($('#user_student_attributes_degreelevel').val() == 'PhD')
//        $('#phdDetailsExpander').show();
//    else
//        $('#phdDetailsExpander').hide();

    $('form#formStudent select#user_student_attributes_degreelevel').change(function() {
        if($(this).val() == 'PhD')
            $('div#financialAidField').slideUp();
        else
            $('div#financialAidField').slideDown();
    });

  /*function blink(selector){
      $(selector).faeOut('slow', function(){
          $(this).fadeIn('slow', function(){
              blink(this);
          });
      });
  }

  function classToggle(selector, className) {
      $(selector).toggleClass(className);
      $(selector).promise().done(function(){
      // will be called when all the animations on the queue finish
      classToggle(selector, className);
    });

  }

  classToggle('.expanderHeaderBar', 'expanderHeaderBar');
*/
//      blink('.expanderErrorHighlight');

});
