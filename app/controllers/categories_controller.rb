class CategoriesController < ApplicationController

  def index
    @categories= Category.all
  end

  def show
    if params[:category_id] && @category= Category.find_by(id: params[:category_id])
    @category= Category.find_by(id: params[:id])
  end

end
