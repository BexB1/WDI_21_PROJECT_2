class PledgesController < ApplicationController

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
    if @pledge.update_attributes(pledge_params)
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

  private
  def pledge_params
    params.require(:pledge).permit(:name, :description, :category_id, :amount, :pledge_id)
  end

end
