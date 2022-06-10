require 'rails_helper'
describe 'Users', type: :request do
  before(:example) { get users_path }
  it "is a success" do
    expect(response).to have_http_status(:ok)
  end

  it "renders a template" do
    expect(response).to render_template(:index)
  end

  it "Test if the texts is visible" do
    expect(response.body).to include('Here is a list of users')
  end
end

describe 'Users', type: :request do
  before(:example) {get user_path({id:2})}
  it "Test http works" do
    expect(response).to have_http_status(:ok)
  end

  it "Test if renders the template" do
    expect(response).to render_template(:show)
  end
end
