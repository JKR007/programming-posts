class PagesController < ApplicationController
  def network
    @users = User.all_except(current_user)
  end

  def my_network
  end

  def my_posts
  end
end
