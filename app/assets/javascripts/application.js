// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree

$(document).ready(function() {
  $('#more-phrases').click(function(event){
    event.preventDefault();
    var initial = $('#phrase-list li').length;
    $.ajax({
      url: "/phrases/new",
      success: function(listItem) {
        for(var i=initial;i<initial+3;i++){
          var parsed = $(listItem);
          parsed.children('.phrase-field').attr('name', 'theme[phrases_attributes]['+i+'][body]');
          parsed.children('.primary-key').attr('name', 'theme[phrases_attributes]['+i+'][id]');
          $('#phrase-list').append(parsed);
        }
      }
    });
  });
})