class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @comments= Comment.all
  end

  def new
      if params[:activity_id] && @activity= Activity.find_by(id: params[:activity_id])
        @comment= @activity.comments.build
      else
        flash[:message] = "Activity not found. Please try again."
        redirect_to(:back)
      end
  end

  def create
    if params[:activity_id] && @activity= Activity.find_by(id: params[:activity_id])
      @comment= @activity.comments.build
    if @comment.save
      redirect_to activity_comments_path(@activity)
    else
      render :new
    end
    end
  end

  def edit

  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(
      :user_id,
      :activity_id,
      :comment)
    end

end
