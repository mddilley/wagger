module DogsHelper

  def fixed_to_string(dog)
    dog.fixed ? "Yes" : "No"
  end

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

  def friendly_icons(dog)
    html_string = ""
    html_string.tap {
      dog.friendly_rating.times do
        html_string <<
        <<-HTML
          <i class="fas fa-smile yellow-text"></i>
        HTML
      end
      (10 - (dog.friendly_rating)).times do
        html_string <<
        <<-HTML
          <i class="fas fa-smile invert"></i>
        HTML
      end
    }
  end

  def aggressive_icons(dog)
    html_string = ""
    html_string.tap {
      dog.aggressive_rating.times do
        html_string <<
        <<-HTML
          <i class="fas fa-angry red-text"></i>
        HTML
      end
      (10 - (dog.aggressive_rating)).times do
        html_string <<
        <<-HTML
          <i class="fas fa-angry invert"></i>
        HTML
      end
    }
  end

  def has_no_play_dates?(dog)
    if !dog.play_dates.any?
      "#{dog.name} is not attending any playdates yet!"
    end
  end

end
