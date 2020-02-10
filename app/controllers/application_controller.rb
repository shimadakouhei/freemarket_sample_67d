class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?




  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:hurigana_family_name,:hurigana_first_name,:birth_year,:birth_month,:birth_date,:first_name])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end


    # def after_sign_in_path_for(resource)
    #   admin_root_path
    # end

    # def after_sign_out_path_for(resource)
    #   root_path
    # end
end
