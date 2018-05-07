require 'rails_helper'

RSpec.describe User, type: :model do
  it "its not valid whitout an email" do
    expect(User.create(password: '123456')).to_not be_valid
  end

  it "its not valid whitout a password" do
    expect(User.create(email: 'test@test.com')).to_not be_valid
  end

  it "its valid with correct parameters" do
    expect(User.create(email: "test@test.com", password: "123456")).to be_valid
  end
end
