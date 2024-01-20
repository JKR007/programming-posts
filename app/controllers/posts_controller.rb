class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.published
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    update_resource(@post)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def publish?
    params[:commit] == 'Publish'
  end

  def update_resource(resource)
    resource.published_at = Time.now.in_time_zone('Asia/Tashkent') if publish?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
