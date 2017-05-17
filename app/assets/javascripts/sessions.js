$(document).ready(function () {
    var student=$("#student");
    $("#student").remove();
    var employee=$("#employee");
    $("#employee").remove();

    $("#frm_student").on("click",function(){

        $(".block-forms").html(student);
        $(".block-forms").hide();
        $(".block-forms").fadeIn(800);
        $("#employee").remove();

    });

    $("#frm_employee").on("click",function(){
        $(".block-forms").html(employee);
        $(".block-forms").hide();
        $(".block-forms").fadeIn(800);
        $("#student").remove();

    });

    $(".block-forms").html(student);
   

});