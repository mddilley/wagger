function hello(){
  let userId = $("a.btn.btn-success.btn-lg").data("id");
  $.get("/users/" + userId + "/dogs", function(json){
    json.map(obj => console.log(obj.name))
  });
}

$(function(){
  hello();

});
