class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless AppConfig.http_basic_access_mode == "open"
    http_basic_authenticate_with name: AppConfig.http_basic_name, password: AppConfig.http_basic_password unless Rails.env == "test"
  end
end
