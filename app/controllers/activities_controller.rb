class ActivitiesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
  end

  def new
    if params[:user_id] && @user= User.find_by(id: params[:user_id])
      @activity= @user.activities.build
    else
      @activity= Activity.new
    end
  end

  def create

    @activity= current_user.activities.build(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      render new_activity_path
    end
  end

  def show
    @activity= Activity.find_by(id: params[:id])
    redirect_to activities_path if !@activity
  end

  private

  def activity_params
    params.require(:activity).permit(
      :name,
      :address,
      :city,
      :state,
      :zipcode,
      :description,
      :category_id,
      :user_id
    )
  end

end
