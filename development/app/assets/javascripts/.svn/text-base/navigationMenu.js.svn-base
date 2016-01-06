$(document).ready(function() {
    $("#treeMenu li").click(
      function()
      {
          if ($(this).hasClass('contentContainerLevel1'))
          {
              $(this).siblings().children('ul').slideUp();
              $(this).siblings().children('ul').children('li').removeClass('contentViewingLevel2').addClass('contentContainerLevel2');
              $(this).siblings().removeClass('contentViewingLevel1').addClass('contentContainerLevel1');
              $(this).children('ul').slideDown();
              $(this).removeClass('contentContainerLevel1').addClass('contentViewingLevel1');              
          }
          else if ($(this).hasClass('contentContainerLevel2'))
          {
              $(this).siblings().removeClass('contentViewingLevel2').addClass('contentContainerLevel2');
              $(this).removeClass('contentContainerLevel2').addClass('contentViewingLevel2');
          }
      }
    );
});