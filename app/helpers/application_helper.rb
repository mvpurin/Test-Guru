module ApplicationHelper
  
  def current_year
    Time.now.year
  end

  def github_url
    link_to "Test-Guru", "https://github.com/mvpurin/Test-Guru"
  end

  def flash_message
    flash.map do |key, message|
      content_tag :p, message, id: :key, class: 'flash' if flash[key]
    end.join.html_safe
  end

end


