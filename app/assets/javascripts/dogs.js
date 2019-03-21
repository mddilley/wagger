let dogArray = [];

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

function nextDog(){
  let userId = $("div.dog-show").data("uid");
  let id = $("div.dog-show").data("id");
  id = checkNext(userId, id);
  $.get("/users/" + userId + "/dogs/" + id, function(json){
    const source = $("#dog-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.dog-show").hide().html(content).fadeIn();
  });
}

function prevDog(){
  let userId = $("div.dog-show").data("uid");
  let id = $("div.dog-show").data("id");
  id = checkPrev(userId, id);
  $.get("/users/" + userId + "/dogs/" + id, function(json){
    const source = $("#dog-template").html();
    const template = Handlebars.compile(source);
    const content = template(json);
    $("div.dog-show").hide().html(content).fadeIn();
  });
}

function checkNext(userId, id){
  let index = dogArray.indexOf(id);
  if(index + 1 < dogArray.length){
    $("div.dog-show").data("id", dogArray[index + 1]);
    return dogArray[index + 1];
  } else {
    return dogArray[index];
  }
}

function checkPrev(userId, id){
  let index = dogArray.indexOf(id);
  if(index - 1 >= 0){
    $("div.dog-show").data("id", dogArray[index - 1]);
    return dogArray[index - 1];
  } else {
    return dogArray[index];
  }
}

function fillDogArray(){
  let userId = $("div.dog-show").data("uid");
  $.get("/users/" + userId + "/dogs", function(json){
    json.forEach(obj => dogArray.push(obj.id));
  });
}

$(function(){
  registerHelpers();
  listDogs();
  showDog();
  fillDogArray();
  $("div.dog-show").on('click', '#nextDog', function(){
      nextDog();
  });
  $("div.dog-show").on('click', '#prevDog', function(){
      prevDog();
  });
});
