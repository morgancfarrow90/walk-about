class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:activity_id]
      @comments = Activity.find(params[:activity_id]).comments
    else
    @comments= Comment.all
    end
  end

  def new
      if params[:activity_id] && @activity= Activity.find_by(id: params[:activity_id])
        @comment= Comment.new(activity_id: params[:activity_id])
      else
        flash[:message] = "Activity not found. Please try again."
        redirect_to(:back)
      end
  end

  def create
    @comment= Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def edit
    @comment= Comment.find_by(id: params[:id])
    redirect_to comments_path if !@comment || @comment.user != current_user
  end

  def update
    @comment= Comment.find_by(id: params[:id])
      redirect_to comments_path if !@activity || @activity.user != current_user
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    end
  end

  def show
    @comment= Comment.find_by(id: params[:id])
  end

  def destroy
    @comment= Comment.find_by(id: params[:id])
    if @comment.user_id = current_user.id
      @comment.destroy
      redirect_to comments_path
    else
      flash[:message] = "You can only delete your own comments."
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :user_id,
      :activity_id,
      :comment)
    end

end
