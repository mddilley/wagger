let dogArray = [];

function registerHelpers(){
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
  showDog();
  fillDogArray();
  $("div.dog-show").on('click', '#nextDog', function(){
      nextDog();
  });
  $("div.dog-show").on('click', '#prevDog', function(){
      prevDog();
  });
});
