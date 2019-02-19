module DogsHelper

  def breeds_for_select
    url = "https://raw.githubusercontent.com/dariusk/corpora/master/data/animals/dogs.json"
    @breed ||= JSON.parse(open(url).read)["dogs"]
  end

  def dog_image(dog)
    dog.img == nil || dog.img == "" ? "dogs.png" : dog.img
  end

  def div_open_freq(i)
    (i % 3 == 0) || i == 0
  end

  def div_close_freq(i)
    (i + 1) % 3 == 0
  end

end
