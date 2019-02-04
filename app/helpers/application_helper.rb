module ApplicationHelper

  def show_navbar
    <<-HTML
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <strong><span class="navbar-brand" >Wagger</span></strong>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="#{user_dogs_path(current_user)}">My Dogs<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">My Playdates</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#{user_path(current_user)}">Preferences</a>
            </li>
          </ul>
        </div>
      </nav>
    HTML
  end


end
