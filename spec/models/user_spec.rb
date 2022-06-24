require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(name: "Bonke", photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Big dreams')}
  before {subject.save}

  it "user name should be present" do
    test_case = subject
    test_case.name = nil
    test_case.PostsCounter = 3
    expect(test_case.valid?).to eq(false)
  end

  it 'Test if the post counter is zero or more than zero' do
    test_case = subject
    test_case.PostsCounter = nil
    expect(test_case.valid?).to eq(false)
  end

  it 'Test if the post counter is zero or more than zero' do
    test_case = subject
    test_case.PostsCounter = -1
    expect(test_case.valid?).to eq(false)
  end
end
