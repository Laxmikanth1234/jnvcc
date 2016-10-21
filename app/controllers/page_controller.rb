class PageController < ApplicationController

  before_action :authenticate_user!, only: [:members, :mypage, :batches,]

  def home

    # if current_user
    #   redirect_to users_path
    # end

  end

  def mypage
  end

  def members
    if current_user
      redirect_to users_path
    end
  end

  def activities
  end

  def events
  end

  def batches
  end

  def contact
  end
end
