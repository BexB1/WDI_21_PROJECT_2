class HomeController < ApplicationController
  layout false

  def index
    @user = current_user
  end
end
