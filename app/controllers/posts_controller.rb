class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :main, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_top_categories, only: [:index, :show]
  before_action :set_bottom_categories, only: [:new, :edit]

  def index
    if params[:category]
      @posts = Category.where(name: params[:category]).first.posts.where(published: true).order(created_at: 'desc')
    else
      @posts = Post.where(published: true).order(created_at: 'desc')
    end
    @unpublished_posts = Post.where(published: false).all

    set_meta_tags title: params[:category] ? "#{params[:category]} Posts" : 'All Posts',
                  image_src: ActionController::Base.helpers.asset_path('profile.png', host: root_url),
                  og: {
                      title: params[:category] ? "#{params[:category]} Posts" : 'All Posts',
                      type: 'website',
                      url: posts_url,
                      image: ActionController::Base.helpers.asset_url('profile.png', host: root_url)
                  }
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
    if !@post.published && current_user.id != 1
      redirect_to posts_path
    end
    set_meta_tags title: @post.title,
                  keywords: @post.tags.map {|tag| tag.name},
                  description: @post.content,
                  og: {
                    title: @post.title,
                    type: 'article',
                    url: post_url(@post),
                    image: @post.tinymce_images.map {|image| image.url},
                  },
                  article: {
                      published_time: @post.created_at,
                      modified_time: @post.updated_at,
                      tag: @post.tags.map {|tag| tag.name},
                      author: ['JongChan Lee', 'TuTanKhamen']
                  }
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
    logger.info image.file
    if image.save
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
    params.require(:post).permit(:title, :content, :category_id, :tag_tokens)
  end

  def set_top_categories
    @categories = Category.where(depth: 1)
    # @categories = []
    # Category.all.each do |category|
    #   @categories << category if category.child_categories.empty?
    # end
  end

  def set_bottom_categories
    @categories = []
    Category.all.each do |category|
      @categories << category if category.child_categories.empty?
    end
    # Category.where(depth: Category.maximum(:depth))
  end
end
