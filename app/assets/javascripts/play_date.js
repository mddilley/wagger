if($("div#playdate-new").length){
  $("div#playdate-new").hide()
}

class PlayDate{
  constructor(obj){
    this.date = obj.date
    this.dogLimit = obj.dogLimit
    this.dogs = obj.dogs
    this.location = obj.location
    this.id = obj.id
    this.name = obj.name
    this.userId = obj.userId
    this.time = obj.time
  }
  formatTime(){
    let time = moment(this.time);
    time._isUTC = true;
    this.time = time.format('LT');
  }
  formatDate(){
    let date = moment(this.date)
    date._isUTC = true;
    this.date = date.format('LL');
  }
}

function appendPlayDate(){
  let playDateId = $("div.playdate-show").data("id");
  $.get("/play_dates/" + playDateId, function(json){
    $("div.playdate-show").hide().html(compilePlayDate(json)).fadeIn();
  });
}

function showForm(){
  $("div#playdate-new").fadeIn();
  $('form').submit(function(event) {
      event.preventDefault();
      let values = $(this).serialize();
      let posting = $.post('/play_dates', values);
      posting.done(function(json) {
        if(json.errors){
          json.errors.map(error => $("div#form-errors").append(`<p class="red-text">${error}</p>`));
        }else{
          $("div.playdates-show").hide().html(compilePlayDate(json)).fadeIn();
          $("div#playdate-new").fadeOut();
          $('form').trigger("reset");
          $("div#form-errors").html("");
        }
        $('#new_play_date > input:submit').removeAttr('disabled');
      });
    });
}

function compilePlayDate(json){
  let playDate = new PlayDate(json);
  playDate.formatTime();
  playDate.formatDate();
  const source = $("#playdate-template").html();
  const template = Handlebars.compile(source);
  const content = template(playDate);
  return content;
}

$(function(){
  if($("a#playdate-new-button").length){
    $("a#playdate-new-button").click(function(e){
      showForm();
      e.preventDefault();
    });
  }
  if($("div.playdate-show").length){
    appendPlayDate();
  }
});
