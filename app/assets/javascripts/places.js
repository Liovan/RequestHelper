// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function () {
    $("#CreatePlace form").ready(function () {
        $("#Sb").click(function () {
            $("#CreatePlace form").submit();
        });
    });
    $("#EditPlace form").ready(function () {
        $("#Sb").click(function () {
            $("#EditPlace form").submit();
        });
    });
});
function SelectPlace(id,name) {
  $("#EditPlace form input[id=place_name]").val(name);


}