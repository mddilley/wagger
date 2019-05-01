function demoMessage(){
  $(".demo").hide();
}

$(function(){
  $(".demo").click(function() {
    demoMessage();
  });
});
