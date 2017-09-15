 class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin?

  layout false
  # TODO: 나중에 시간되면 카테고리 수정페이지 디자인하기. (현재 css 안되있음)
  def create
    @category = Category.new
    @category.name = params[:new_category_name]
    @category.parent_category_id = params[:parent_category_id] if params[:parent_category_id]
    unless @category.save
      render json: {status: 'fail'}
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:edit_category_id])
    @category.update(name: params[:edit_category_name])
  end

  def destroy
    @category = Category.find(params[:destroy_category_id]).destroy
  end
  
  private

  def user_admin?
    unless current_user.id == 1
      redirect_to posts_path
    end
  end
end
