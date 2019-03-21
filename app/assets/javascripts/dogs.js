function registerHelpers(){
Handlebars.registerHelper('bootstrapRows', function(perRow, context, options) {
  let out = "", subcontext = [], i;
    if (context && context.length > 0) {
        for (i = 0; i < context.length; i++) {
            if (i > 0 && i % perRow === 0) {
                out += options.fn(subcontext);
                subcontext = [];
            }
            subcontext.push(context[i]);
        }
        out += options.fn(subcontext);
    }
    return out;
});
Handlebars.registerHelper('imgLink', function(dogObj) {
  if(this.img === ""){
    this.img = "/assets/dogs.png";
  }
  else if(this.img.substring(0,4).toLowerCase() !== "http"){
    this.img = `/assets/${this.img}`;
  }
});
Handlebars.registerHelper('fixedString', function(dogObj) {
  if(this.fixed === true){
    this.fixed = "Yes";
  }
  else {
    this.fixed = "No";
  }
});
}

function listDogs(){
  let userId = $("a.btn.btn-success.btn-lg").data("id");
  $.get("/users/" + userId + "/dogs", function(json){
    const source = $("#dogs-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.dogs-show").hide().html(content).fadeIn();
  });
}

function showDog(){
  let userId = $("div.dog-show").data("uid");
  let id = $("div.dog-show").data("id");
  $.get("/users/" + userId + "/dogs/" + id, function(json){
    const source = $("#dog-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.dog-show").hide().html(content).fadeIn();
  });
}

$(function(){
  registerHelpers();
  listDogs();
  showDog();
});
