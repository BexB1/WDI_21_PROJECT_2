// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require gritter

// jQuery(function($){
//   $(".menu").hide();
//   $(".hamburger").click(function() {
//     $(".menu").slideToggle("slow", function() {
//     });
//   });
// });

  var ready = function() {
    $('.menu').hide();

    $("body").css("opacity", 0).animate({ opacity: 1}, 1000);

    $("body a").on('click', function() {
      $("body").css("opacity", 1).animate({ opacity: 0}, 1000);
    });

    $('.hamburger').on('click', function() {
      $('.menu').slideToggle('slow'); 
    });

  };

  $(document).on('turbolinks:load', ready);


// $(document).on('ready', ready);
// // Rails 5 || Turbolinks 5
// $(document).on('turbolinks:load', ready);


