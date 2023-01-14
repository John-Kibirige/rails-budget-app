require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'john', email: 'jo@john.com', password: '12345678', password_confirmation: '12345678')
  end

  describe 'User ' do
    it 'is not valid with invalid attributes' do
      expect(User.new).to_not be_valid
    end

    it 'is valid with valid attributes' do
      subject.save
      expect(subject).to be_valid
    end

    it 'is valid when name is edited' do
      subject.name = 'joh'
      expect(subject).to be_valid
    end
  end
end
