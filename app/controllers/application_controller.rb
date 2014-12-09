class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_admin
    authenticate_or_request_with_http_basic "Application" do |name, password|
      name = ENV.fetch('KEY1') && password = ENV.fetch('KEY2')
    end
  end
end
