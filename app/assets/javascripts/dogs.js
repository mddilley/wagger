function hello(){
  let userId = $("a.btn.btn-success.btn-lg").data("id");
  $.get("/users/" + userId + "/dogs", function(json){
    console.log(json);
  });
}

$(function(){
  hello();

});
