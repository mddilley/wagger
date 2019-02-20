module WelcomeHelper

  def last_five_play_dates
    PlayDate.last_five
  end
end
