$("div#playdate-new").hide()

function showForm(){
  $("div#playdate-new").fadeIn();
  $('form').submit(function(event) {
      event.preventDefault();
      let values = $(this).serialize();
      let posting = $.post('/play_dates', values);
      posting.done(function(data) {
        debugger;
        //data received as json, create PlayDate and append
      });
    });
}

$(function(){
  $("a#playdate-new-button").click(function(e){
    showForm();
    e.preventDefault();
  });

});
