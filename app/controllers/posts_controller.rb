class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit_comment, :update_comment, :destroy_comment]

  def index
    @posts = Post.where(published: true).all
    @unpublished_posts = Post.where(published: false).all
  end

  def new
    # unless Post.where(published: false).last.title.blank?
    #   Post.create(user: current_user)
    # end
    # TODO: 임시저장 기능
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
    if !@post.published && current_user.id != 1
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
      render json: {
          image: {
              url: image.file.url
          }
      }, content_type: 'text/html'
    end
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.js
      # TODO: comment 컨트롤러 개발(ajax 처리 해서)
    end
  end

  def edit_comment

  end

  def update_comment
    @comment.update(comment_params)
  end

  def destroy_comment
    @comment.destroy
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
