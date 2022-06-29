class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  after_action :hello, only: :after_sign_in_path_for


  def after_sign_in_path_for(resource)
    byebug
    if current_user.admin?
    admin_tests_path
  else
    tests_path
    end
  end

  def hello
    flash[:notice] = "Hello, #{resource.first_name} #{resource.last_name}!" if current_user.present?
  end

end
