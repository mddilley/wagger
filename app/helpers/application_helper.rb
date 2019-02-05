module ApplicationHelper

  def show_navbar
    <<-HTML

    HTML
  end

  def logout_button
    if logged_in?
      <<-HTML
            <div><a class="btn btn-warning btn-sm" href="#{logout_path}" role="button">Logout</a></div>
      HTML
    end
  end

  def populate_data_list(array)
    string = ""
    string.tap {
      array.each do |d|
        string << "<option value=\"#{d}\">#{d}</option>"
      end
    }
  end

  def data_list(id_tag, array)
    <<-HTML
      <datalist id="#{id_tag}"><select>#{populate_data_list(array)}</select></datalist>
    HTML
  end


end
