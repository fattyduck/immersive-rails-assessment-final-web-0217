class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:show, :edit, :update]
  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @appearance.user = User.find_by(id: session[:user_id])
    if @appearance.save
      redirect_to @appearance
    else
      redirect_to new_appearance_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @appearance.assign_attributes(appearance_params)
    if(@appearance.save)
      redirect_to @appearance
    else
      redirect_to edit_appearance_path
    end
  end


  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

  def set_appearance
    @appearance = Appearance.find_by(id: params[:id])
  end
end
