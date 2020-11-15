class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides reCAPTCHA
        # set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_up_params
      params.require(:user).permit(:name, :surname, :designation, :facebook, :twitter, :linkedin, :rep?, :date_of_birth, :email, :password, :password_confirmation, :batch, :gender, :industry, :current_location, :education_qualification, :profession, :mobile, :address, :aboutme, :is_active, :avatar, :bloodgroup, :country_code, :native_place, :native_mandal, :native_pin, :admission_year, :passout_year, :current_state, :current_country, :working_sector, :admission_class, :passout_class)
    end
end