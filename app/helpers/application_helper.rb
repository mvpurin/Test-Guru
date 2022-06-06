module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url
    link_to "Test-Guru", "https://github.com/mvpurin/Test-Guru"
  end

  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
