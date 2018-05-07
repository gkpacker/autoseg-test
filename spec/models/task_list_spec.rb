require 'rails_helper'

RSpec.describe TaskList, type: :model do
  it "its not valid whitout a user assigned" do
    expect(TaskList.create).to_not be_valid
  end

  it "its valid whit a user assigned" do
    user = User.create(email: "test@test.com", password: "123456")

    expect(TaskList.create(user_id: user.id)).to be_valid
  end
end
