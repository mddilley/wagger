function showPlaydate(){
  let playDateId = $("div.playdate-show").data("id");
  $.get("/play_dates/" + playDateId, function(json){
    debugger;
  });
}

$(function(){
  showPlaydate();
});
