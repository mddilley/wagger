function showForm(){
  const source = $("#playdate-new-template").html();
  const template = Handlebars.compile(source);
  const content = template();
  $("div#playdate-new").hide().html(content).fadeIn();
  $("div#playdate-new").on('click', '#playdate-create-button', function(e){
    alert("hi")
    e.preventDefault();
  });
}

$(function(){
  $("a#playdate-new-button").click(function(e){
    showForm();
    e.preventDefault();
  });

});
