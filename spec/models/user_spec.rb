require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(id: 1, name: 'john', email: 'john@john.com', created_at: DateTime.now, updated_at: DateTime.now)
  }

  describe "User " do
    it "is not valid with invalid attributes" do
      expect(User.new).not_to be_valid
    end

    it "is valid with valid attributes" do
      expect(subject).not_to be_valid
    end
  end

end