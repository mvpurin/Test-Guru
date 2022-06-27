class ApplicationController < ActionController::Base

  before_action :hello

  def after_sign_in_path_for(resource)
    if current_user.is_a?(Admin)
    '/admin/tests'
  else
    '/tests'
    end
  end

  def hello
    flash.now[:alert] = "Hello, #{current_user.first_name} #{current_user.last_name}!" if !current_user.nil?
  end

end
