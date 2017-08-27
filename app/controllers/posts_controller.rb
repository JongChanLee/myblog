class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(published: true).all
  end

  def new
    # unless Post.where(published: false).last.title.blank?
    #   Post.create(user: current_user)
    # end
    @post = Post.new
  end

  def create
    case params[:commit]
      when '저장'
        @post = Post.new(post_params)
        @post.published = true
      when '임시저장'
        @post = Post.new(post_params)
      else
        render :new
    end

    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to posts_path
    end
  end

  def show
    unless @post.published
      redirect_to posts_path
    end
  end

  def edit
  end

  def update
    case params[:commit]
      when '저장'
        @post.published = true
        @post.update(post_params)
        redirect_to post_path(@post)
      when '임시저장'
        @post.published = false
        @post.update(post_params)
        redirect_to posts_path
      else
        render :show
    end

  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  def tinymce_img_create
    image = TinymceImage.new params.permit(:file, :alt, :hint)

    if image.save
      logger.info image.file.url
      render json: {
          image: {
              url: image.file.url
          }
      }, content_type: 'text/html'
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
