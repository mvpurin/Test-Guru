class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :authenticate_user!
  around_action :hello, only: :after_sign_in_path_for


  def after_sign_in_path_for(resource)
    if resource.admin?
    admin_tests_path
  else
    tests_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def default_url_options
    { :lang => I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def hello
    flash.now[:alert] = "Hello, #{current_user.first_name} #{current_user.last_name}!" if current_user.present?
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end

    
