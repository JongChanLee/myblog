class TagsController < ApplicationController
  def index
    @tags = Tag.tags(params[:q])

    respond_to do |format|
      format.json {render json: @tags}
    end
  end
end
