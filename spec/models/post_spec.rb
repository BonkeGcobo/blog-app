require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(name: "Bonke", photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Big dreams', PostsCounter: 0)
  subject {Post.new(user: user, Title: "Bornfire", Text:"My name is Earl", CommentsCounter:0, LikesCounter:0)}
  before{subject.save}
  
  it "Test if title must not be blank" do
    test_case= subject
    test_case.Title = nil
    expect(test_case.valid?).to eq(false)
  end

  it "Test comment counter is integer greater or equal to zero" do
    test_case= subject
    test_case.CommentsCounter = -1
    expect(test_case.valid?).to eq(false)
  end


  it "Test if likes counter is greater or equal to zero" do
    test_case= subject
    test_case.LikesCounter = -1
    expect(test_case.valid?).to eq(false)
  end


end
