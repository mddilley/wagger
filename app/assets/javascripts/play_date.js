if($("div#playdate-new").length){
  $("div#playdate-new").hide()
}

function registerHelpers(){
  Handlebars.registerHelper('deleteButton', function() {
    if(this.userId === $('body').data("user-id")){
      return `<a data-confirm=\"Are you sure you want to remove this dog?\" data-method=\"delete\" href=\"/dog_play_dates/${this.id}\"><i class=\"far fa-times-circle red-link\"></i></a>`
    }
    else{
      return ""
    }
  });
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
    this.playDates = obj.playDates
  }
}

PlayDate.prototype.formatTime = function(){
  let time = moment(this.time);
  time._isUTC = true;
  this.time = time.format('LT');
}

PlayDate.prototype.formatDate = function(){
  let date = moment(this.date)
  date._isUTC = true;
  this.date = date.format('LL');
}

PlayDate.prototype.playDateIcons = function(){
  let html = "";
  let ownerIcon = "<i class=\"fas fa-user-edit invert\"></i>";
  if(this.userId === $('body').data("user-id")){
      ownerIcon = "<i class=\"fas fa-user-edit white-text\"></i>";
  }
  let attendingIcon = "<i class=\"fas fa-calendar-check white-text\"></i>";
  html = ownerIcon + "&nbsp&nbsp&nbsp" + attendingIcon + "&nbsp&nbsp&nbsp&nbsp";
  return html;
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

function appendPlayDate(){
  let playDateId = $("div.playdate-show").data("id");
  $.get("/play_dates/" + playDateId, function(json){
    $("div.playdate-show").hide().html(compilePlayDate(json)).fadeIn();
  });
}

function showForm(){
  $("div#playdate-new").fadeIn();
  $("button#cancel-button").click(function(event){
    event.preventDefault();
    $("div#playdate-new").fadeOut();
  });
  $('form').submit(function(event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      let values = $(this).serialize();
      let posting = $.post('/play_dates', values);
      posting.done(function(json) {
        if(json.errors){
          json.errors.map(error => $("div#form-errors").append(`<p class="red-text">${error}</p>`));
        }else{
          $("div.playdates-show").hide().append(compilePlayDate(json)).fadeIn();
          $("div#playdate-new").fadeOut();
          $('form').trigger("reset");
          $("div#form-errors").html("");
        }
        $('#new_play_date > input:submit').removeAttr('disabled');
      });
    });
}

function getPlaces(value){
  const token = "pk.eyJ1IjoibWRkaWxsZXkiLCJhIjoiY2p3MHZncXNzMGZmbDQzb2RmNzEwMjA4MiJ9.OQylqbWMWhsi5Evpe9SbGg";
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/Yard%20Bar.json?access_token=${token}&country=us&types=poi`
  $.get(url, function(json){
    console.log(json);
  });
}

$(function(){
  if($("a#playdate-new-button").length){
    $("a#playdate-new-button").click(function(e){
      showForm();
      e.preventDefault();
    });
    $("input#play_date_location").keydown(function(e){
      console.log(e.target.value);
      getPlaces(e.target.value);
    })
  }
  if($("div.playdate-show").length){
    appendPlayDate();
  }
  registerHelpers();
});
