class PostsController < ApplicationController
  before_action :set_post, [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(state: 1).all
  end

  def new
    Post.create()
  end

  def create
    post = Post.find_by_state (0)
    post.update (post_params)

    redirect_to post_path(post)
  end
4
  def show
    redirect_to post_path(@post)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def tinymce_img_create
    image = Image.new params.permit(:file, :alt, :hint)

    if image.save
      render json: {
          image: {
              url: image.file.url
          }
      }, content_type: 'text/html'
    else
      redirect_to root_path
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
