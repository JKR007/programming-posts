require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create(:user) }

  describe '#index' do
    let!(:post1) { create(:post, :published) }
    let!(:post2) do
      Timecop.freeze 1.days.ago do
        create(:post, :published)
      end
    end

    before do
      sign_in(user)
      get :index
    end

    it 'returns status code 200' do
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end

    it 'assigns published posts' do
      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end

  describe '#show' do
    let!(:post) { create(:post, :published) }
    before { sign_in(user) }

    it 'renders show page' do
      get :show, params: { id: post.id }
      expect(response).to render_template :show
    end
  end

  describe '#new' do
    before { sign_in(user) }

    it 'renders new page' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let!(:params) { { post: attributes_for(:post, title: 'Post Title', content: 'Post Content') } }
    before(:each) { sign_in(user) }

    it 'creates new post' do
      expect { post :create, params: params }.to change(Post, :count).by(1)
    end

    it 'redirects to posts path' do
      post :create, params: params
      expect(response).to redirect_to(posts_path)
    end

    it 'does not publish post' do
      post :create, params: params
      expect(Post.last.published_at).to be_nil
    end

    context 'when commit type is publish' do
      before(:each) do
        params.merge!(commit: 'Publish')
        post :create, params: params
      end

      it 'publishes post' do
        expect(Post.last.published_at).not_to be_nil
      end
    end
  end

  describe '#edit' do
    let!(:post) { create(:post, :published) }

    before do
      sign_in(user)
      get :edit, params: { id: post }
    end

    it 'renders edit page' do
      expect(response).to render_template('edit')
    end

    it 'returns status code 200' do
      expect(response.status).to eq 200
    end
  end

  describe '#update' do
    let!(:post) { create(:post, :published) }

    before do
      sign_in(user)
      put :update, params: { id: post, post: { title: 'Updated Title', content: 'Updated Content' } }
    end

    it 'updates post' do
      expect(post.reload.title).to eq('Updated Title')
      expect(post.content.body.to_s).to eq("<div class=\"trix-content\">\n  Updated Content\n</div>\n")
    end

    it 'redirects to posts path' do
      expect(subject).to redirect_to(posts_path)
    end
  end
end
