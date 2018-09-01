class PageController < ApplicationController

  before_action :authenticate_user!, only: [:members, :mypage, :batches,]

  def home
    @activities = Activity.all
    if current_user
    @activity = current_user.activities.build
    end
    @event = Event.all
    @users = User.all
  end

  def mypage
    @user = User.find(current_user.id)

    respond_to do |format|
      format.html 
      format.json { render json: @user }
    end

    @event = Event.all
  end

  def batches
    @users = User.all
    if params[:batch]
       @users = @users.select {|u| u.batch == params[:batch].to_i}
     end
  end
  def members
    if current_user
      redirect_to users_path
    end
  end

  def activities
    @activities = Activity.all
    if current_user
    @activity = current_user.activities.build
    end
  end

  def events
  end

  def photos
    @photos =Photo.all
  end

  def contact
    
  end

   private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:activity_id, :body, :user_id)
    end
end
