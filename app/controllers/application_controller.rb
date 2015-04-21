class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from URI::InvalidURIError, with: :invalid_uri_error
  rescue_from TypeError, with: :invalid_uri_error

  private

  def invalid_uri_error
    flash[:danger] = 'Вы ввели неверный адрес сайта'
    redirect_to :back
  end
end
