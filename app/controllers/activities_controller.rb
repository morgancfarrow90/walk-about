class ActivitiesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] && @user= User.find_by(id: params[:user_id])
      @activities= @user.activities
    else
      @error = "That user doesn't exist" if params[:user_id]
      @activities= Activity.includes(:category, :user)
    end

    @activities = @activities.search(params[:q].downcase) if params[:q] && !params[:q].empty?

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
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity= Activity.find_by(id: params[:id])
    redirect_to activities_path if !@activity || @activity.user != current_user
  end

  def update
    @activity= Activity.find_by(id: params[:id])
      redirect_to activities_path if !@activity || @activity.user != current_user
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity= Activity.find_by(id: params[:id])
    if @activity.user_id = current_user.id
      @activity.destroy
      redirect_to user_activities_path(current_user)
    else
      flash[:message] = "You are not permitted to delete this entry."
      redirect_to root_path
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
