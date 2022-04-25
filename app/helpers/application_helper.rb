module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url
    link_to "Test-Guru", "https://github.com/mvpurin/Test-Guru"
  end
end
