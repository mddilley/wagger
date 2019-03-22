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
}

function showPlaydate(){
  let playDateId = $("div.playdate-show").data("id");
  $.get("/play_dates/" + playDateId, function(json){
    let playDate = new PlayDate(json);
    const source = $("#playdate-template").html();
    const template = Handlebars.compile(source);
    const content = template(playDate);
    $("div.playdate-show").hide().html(content).fadeIn();
  });
}

$(function(){
  showPlaydate();
});
