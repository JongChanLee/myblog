class MainController < ApplicationController
  def index
    @post = Post.new
  end

end
