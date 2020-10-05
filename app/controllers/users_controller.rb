class UsersController < ApplicationController

before_action :authenticate_user!

  def index

      @users = User.search(params[:search])
     
  end


  def show
  	@user = User.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @user }
  	end

    @event = Event.all
  end

  def edit
     if (params[:id]).to_i == current_user.id.to_i || current_user.admin?
  	 @user = User.find params[:id]
     else
      redirect_to page_home_path
     end

  end

  def update
    respond_to do |format|
    @user = User.find(params[:id])
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
   
   # DELETE /recipes/1
   # DELETE /recipes/1.json
   def destroy
   	  @user = User.find params[:id]
      @user.destroy
         respond_to do |format|
         format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
         format.json { head :no_content }
      end
   end
def import
  User.import(params[:file])
  redirect_to users_path, notice: "Users imported."
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :designation, :facebook, :twitter, :linkedin, :rep?, :date_of_birth, :email, :password, :password_confirmation, :batch, :gender, :industry, :current_location, :education_qualification, :profession, :mobile, :address, :aboutme, :is_active, :avatar, :bloodgroup, :country_code, :native_place, :native_mandal, :native_pin, :admission_year, :passout_year, :current_state, :current_country, :working_sector, :admission_class, :passout_class)
    end
end
