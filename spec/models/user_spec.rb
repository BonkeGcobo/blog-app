require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(name: "Bonke")}
  before {subject.save}

  it "user name should be present" do
    subject.name = nil
    expect(subject).to_not be_vaild
  end
end
