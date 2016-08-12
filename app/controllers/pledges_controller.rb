class PledgesController < ApplicationController
  before_action :load_activities, only: [:index, :show, :new, :edit]
  before_filter :authenticate_user!, only: [:new]

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

    @owner = @pledge.owner
    @sponsor = @pledge.sponsor

    if @owner.coins > 5
      flash[:success] = "Pledge created! Good luck!"
      @owner.coins -= 5
      @owner.save
    else
      flash[:danger] = "You don't have enough coins to make a new pledge!"
      redirect_to pledges_path
    end


    respond_to do |format|
      if @pledge.save
        format.html { redirect_to pledges_path, notice: 'pledge was successfully created.' }
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

    @owner = @pledge.owner
    @sponsor = @pledge.sponsor

    @pledge.first_checkin

    if @pledge.is_failed?
      ## pledge is over!
      flash[:danger] = "Pledge failed!"
      @sponsor.coins += 5
      @sponsor.save
    else
      @pledge.update(daily_post: Time.now.utc)
      flash[:success] = "Checked in!"
    end

    if @pledge.days_won == 30
      flash[:success] = "Congratulations, you have completed your pledge!"
      @owner.coins += 10
      @owner.save
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
