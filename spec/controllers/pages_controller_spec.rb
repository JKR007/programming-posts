require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user_follower) { create(:user) }
  let!(:user_followee) { create(:user) }

  let!(:post1) { create(:post, :published, author: user) }
  let!(:post2) { create(:post, author: user) }

  describe 'network' do
    before { sign_in(user) }

    it 'assigns all users except current_user' do
      get :network
      expect(assigns(:users)).to match_array([user_follower, user_followee])
    end
  end

  describe 'my_network' do
    before do
      sign_in(user)
      user.follow(user_followee.id)
      user_follower.follow(user.id)
      get :my_network
    end

    it 'assigns current_user followers' do
      expect(assigns(:followers)).to match_array([user_follower])
    end

    it 'assigns current_user followees' do
      expect(assigns(:followees)).to match_array([user_followee])
    end
  end

  describe 'my_posts' do
    before { sign_in(user) }

    it 'assigns current_user posts' do
      get :my_posts
      expect(assigns(:posts)).to match_array([post2, post1])
    end
  end
end
