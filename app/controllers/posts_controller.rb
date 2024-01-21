class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
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
      render :new
    end
  end

  def edit; end

  def update
    @post.update(post_params)

    redirect_to posts_path, notice: 'Post was successfully updated!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def publish?
    params[:commit] == 'Publish'
  end

  def update_resource(resource)
    if publish?
      resource.published_at = Time.now.in_time_zone('Asia/Tashkent')
      resource.author = current_user
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
