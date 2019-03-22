let dogArray = [];

class Dog{
  constructor(obj){
    this.id = obj.id
    this.name = obj.name
    this.age = obj.age
    this.breed = obj.breed
    this.weight = obj.weight
    if(obj.fixed === true){
	     this.fixed = "Yes"
     } else {
	     this.fixed = "No"
     }
    this.userId = obj. userId
    this.img = obj.img
    this.friendlyRating = obj.friendlyRating
    this.aggressiveRating = obj.aggressiveRating
    this.sex = obj.sex
    this.playDates = obj.playDates
  }
}

function registerHelpers(){
Handlebars.registerHelper('imgLink', function(dogObj) {
  if(this.img === ""){
    this.img = "/assets/dogs.png";
  }
  else if(this.img.substring(0,4).toLowerCase() !== "http"){
    this.img = `/assets/${this.img}`;
  }
});
}

function showDog(id, userId){
  $.get("/users/" + userId + "/dogs/" + id, function(json){
    let dog = new Dog(json);
    const source = $("#dog-template").html();
    const template = Handlebars.compile(source);
    const content = template(dog);
    $("div.dog-show").hide().html(content).fadeIn();
  });
}

function checkNext(id){
  let index = dogArray.indexOf(id);
  if(index + 1 < dogArray.length){
    $("div.dog-show").data("id", dogArray[index + 1]);
    return dogArray[index + 1];
  } else {
    return dogArray[index];
  }
}

function checkPrev(id){
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
  let id = $("div.dog-show").data("id");
  let userId = $("div.dog-show").data("uid");
  showDog(id, userId);
  fillDogArray();
  $("div.dog-show").on('click', '#nextDog', function(){
      let id = $("div.dog-show").data("id");
      showDog(checkNext(id), userId);
  });
  $("div.dog-show").on('click', '#prevDog', function(){
      let id = $("div.dog-show").data("id");
      showDog(checkPrev(id), userId);
  });
});
