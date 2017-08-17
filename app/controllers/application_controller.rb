class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  protected

  def render_404
    # render :template => "public/404", :status => "404 Not Found"
    # redirect_to status: 404
    render file: "#{Rails.root}/public/404.html" , status: 404, layout: false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :address, :phone_number, :photo, :photo_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :address, :phone_number, :photo, :photo_cache])
  end
end
