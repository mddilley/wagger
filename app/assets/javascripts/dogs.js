function listDogs(){
  let userId = $("a.btn.btn-success.btn-lg").data("id");
  $.get("/users/" + userId + "/dogs", function(json){
    // json.map(obj => console.log(obj.name))
    const source = $("#dogs-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.container.text-left.text-light.align-middle.form-group").append(content);
  });
}

$(function(){
  listDogs();

});
