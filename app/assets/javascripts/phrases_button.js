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