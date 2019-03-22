function showForm(){
  const source = $("#playdate-new-template").html();
  const template = Handlebars.compile(source);
  const content = template();
  $("div#playdate-new").hide().html(content).fadeIn();
}

$(function(){
  $("a#playdate-new-button").click(function(e){
    showForm();
    e.preventDefault();
  });

});
