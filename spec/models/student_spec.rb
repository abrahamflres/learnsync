require 'rails_helper'

RSpec.describe Student, type: :model do
  it "return fullname for user" do
    user = Student.create(firstname: "Abraham", lastname: "Flores")

    expect(user.fullname).to eq "Abraham, Flores"
  end
end
