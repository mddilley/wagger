module DogsHelper

  def breeds_for_select
    breed = open('https://raw.githubusercontent.com/dariusk/corpora/master/data/animals/dogs.json')
    JSON.parse(breed.read)["dogs"]
  end

end
