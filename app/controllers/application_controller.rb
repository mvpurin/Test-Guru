class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  around_action :hello, only: :after_sign_in_path_for


  def after_sign_in_path_for(resource)
    if resource.admin?
    admin_tests_path
  else
    tests_path
    end
  end

  def hello
    flash.now[:alert] = "Hello, #{current_user.first_name} #{current_user.last_name}!" if current_user.present?
  end

end
