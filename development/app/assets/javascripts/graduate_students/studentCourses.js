$(document).ready(function() {

    $('#formstudentCourses #student_course_coursestatus').change(function(){
      if($('#student_course_coursestatus').val() == "In progress")
          $('#formstudentCourses #student_course_coursegrade').attr('disabled', true);
      else
          $('#formstudentCourses #student_course_coursegrade').attr('disabled', false);
  });


    $('#formstudentCourses div#coursesFields').hide();
    $('#formstudentCourses div#coursesCollection').hide();
    $('#formstudentCourses #student_course_semester_id').change(function(){
        
        jQuery.ajax({
          url: "/GraduateStudents/student_courses/populate_courses",
          async: false,
          dataType: "json",
          data:'mode=populate'+'&'+'id='+$('#formstudentCourses #student_course_student_id').val()+'&'+'seid=' + $('#formstudentCourses #student_course_semester_id').val(),
          success: function(response)
          {
              //alert(response);
               $("#student_course_course_id").get(0).options.length = 0;
               $("#student_course_course_id").get(0).options[0] = new Option("Select course", "");
                var i = 1;
               $.each(response, function(index, item) {
                      $("#student_course_course_id").get(0).options[i] = new Option(item, index);
                      i++;
                });
                $('#formstudentCourses div#coursesCollection').slideDown();
          }
          //error: function() { alert("Failed to load courses");}
          
      });
  });
    $('#formstudentCourses #student_course_course_id').change(function(){
        $('#formstudentCourses div#coursesFields').slideDown();
    });
    




});