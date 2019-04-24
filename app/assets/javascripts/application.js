// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require materialize-sprockets
//= require_tree .


//some javascript not working in the documnet ready due to turbolinks clash
$( document ).ready(function () {
    $('.sidenav').sidenav();
    $('.dropdown-trigger').dropdown();
     $('.datepicker').datepicker({
 format: 'mmmm dd, yyyy',
 formatSubmit: 'mmmm dd, yyyy',
 selectMonths: true, // Creates a dropdown to control month
 selectYears: 15, // Creates a dropdown of 15 years to control year,
 today: 'Today',
 clear: 'Clear',
 close: 'Ok',
 closeOnSelect: false // Close upon selecting a date,
});
    $('select').formSelect();
   $(".dropdown-button").dropdown({
       coverTrigger: false
   });
   $(".dropdown-trigger").dropdown({
       coverTrigger: false
   });





 Materialize.updateTextFields(); //used so text fields dont clash in edit 
 $('.materialboxed').materialbox(); //used for images
 $('.parallax').parallax(); //used on the mainpage for the parallax images 
});
  

//these functions only work outside of the document ready, likely due to version clashes and turbolinks

$('.parallax').parallax(); 













