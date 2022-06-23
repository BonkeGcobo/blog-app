require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(name: "Bonke", photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Big dreams')}
  before {subject.save}

  it "user name should be present" do
    test_case = subject
    test_case.name = nil
    expect(test_case.valid?).to eq(false)
  end
end
