//   $(document).ready(function()
//   {
//     var count = 0
//     $('#saveButton').click(function(e)
//     {
//        if ($form.data('submitted') === true && !$form.valid()) {
//          // Previously submitted - don't submit again
//          e.preventDefault();
//        } else {
//          // Mark it so that the next submit can be ignored
//          $form.data('submitted', true);
//        }
//
//      });
//    });


/////*
// * To change this template, choose Tools | Templates
// * and open the template in the editor.
// */
//
//$(function() {
//
//        // select all desired input fields and attach tooltips to them
//      $("#myform :input").tooltip({
//
//      // place tooltip on the right edge
//      position: "center right",
//
//      // a little tweaking of the position
//      offset: [-2, 10],
//
//      // use the built-in fadeIn/fadeOut effect
//      effect: "fade",
//
//      // custom opacity setting
//      opacity: 0.7
//
//      });
//     $("#rightImageButtons img[title]").tooltip({
//
//           // tweak the position
//           offset: [10, 2],
//
//           // use the "slide" effect
//           effect: 'slide'
//
//        // add dynamic plugin with optional configuration for bottom edge
//     }).dynamic({ bottom: { direction: 'down', bounce: true } });
//    });
//
//
////Ajax functionality in reports
//$(document).ready(function() {
//$("#postform")
//      .bind('ajax:complete', function(evt, data, status, xhr) {
//        $('.reportsGrid').html(data.responseText);
//      });
//});
//
//
//
