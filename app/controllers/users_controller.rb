class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(5)
  end
  
end
