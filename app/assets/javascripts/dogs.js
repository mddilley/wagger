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
  if(this.img === "" || this.img === null){
    this.img = "/assets/dogs.png";
  }
  else if(this.img.substring(0,4).toLowerCase() !== "http"){
    this.img = `/assets/${this.img}`;
  }
});
}

function sortDogs(){
  let userId = $("body").data("user-id");
  $.get("/users/" + userId + "/dogs", function(json){
      json.sort(function(a, b) {
      const nameA = a.name.toUpperCase();
      const nameB = b.name.toUpperCase();
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }
      return 0;
    });
    const source = $("#dogs-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.dogs-show").hide().html(content).fadeIn();
  });
}

function listDogs(){
  let userId = $("body").data("user-id");
  $.get("/users/" + userId + "/dogs", function(json){
    const source = $("#dogs-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.dogs-show").hide().html(content).fadeIn();
  });
}

$(function(){
  $('#sort-dog').on('click', function(){
    sortDogs();
  });
  registerHelpers();
  listDogs();
});
