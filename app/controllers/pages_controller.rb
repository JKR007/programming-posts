class PagesController < ApplicationController
  def network
    @users = User.all_except(current_user)
  end

  def my_network
    @followers = current_user.followers
    @followees = current_user.followees
  end

  def my_posts
    @posts = current_user.posts.order(published_at: :desc)
  end
end
