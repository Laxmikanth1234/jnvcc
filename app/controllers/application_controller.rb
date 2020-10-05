class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :designation, :facebook, :twitter, :linkedin, :rep?, :date_of_birth, :email, :password, :batch, :gender, :industry, :current_location, :education_qualification, :profession, :mobile, :address, :aboutme, :is_active, :avatar, :bloodgroup, :country_code, :native_place, :native_mandal, :native_pin, :admission_year, :passout_year, :current_state, :current_country, :working_sector, :admission_class, :passout_class) }
   end
end
