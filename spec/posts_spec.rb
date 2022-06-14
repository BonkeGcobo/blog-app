require 'rails_helper'

describe 'Posts', type: :request do
  before(:example) { get user_posts_path({ user_id: 2 }) }
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it 'Tests if the correct page will be rendered' do
    expect(response).to render_template(:index)
  end

  it 'Test if the user posts are present' do
    expect(response.body).to include('Here are user posts')
  end
end

describe 'Posts', type: :request do
  before(:example) { get user_post_path({ user_id: 2, id: 6 }) }
  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it 'Tests if the correct page will be rendered' do
    expect(response).to render_template(:show)
  end

  it 'Test if the user posts are present' do
    expect(response.body).to include('Here is post by user')
    fi
  end
end
