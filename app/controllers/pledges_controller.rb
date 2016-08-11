class PledgesController < ApplicationController
  before_action :load_activities, only: [:index, :show, :new, :edit]

  def index
    @pledges = Pledge.all
    @user = current_user
  end

  def show
    @pledge = Pledge.find(params[:id])
    @user = current_user
  end

  def new
    @pledge = Pledge.new
    @user = current_user
  end

  def edit
    @pledge = Pledge.find(params[:id])
    @user = current_user
  end

  def create
    @pledge = current_user.pledges.create(pledge_params)
    @user = current_user

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to @pledge, notice: 'pledge was successfully created.' }
        format.json { render :show, status: :created, location: @pledge }
      else
        format.html { render :new }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pledge = Pledge.find(params[:id])
    @user = current_user

    p pledge_params

    if @pledge.update(pledge_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    respond_to do |format|
      format.html { redirect_to pledges_url, notice: 'Pledge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkin
    @pledge = Pledge.find(params[:id])

    @pledge.first_checkin

    if @pledge.is_failed?
      ## pledge is over!
      flash[:danger] = "Pledge failed!"
    else
      @pledge.update(daily_post: Time.now.utc)
      flash[:success] = "Checked in!"
    end

    redirect_to @pledge
  end

  private
  def pledge_params
    params.require(:pledge).permit(:name, :description, :category_id, :amount, :sponsor_id)
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(5)
  end

end
