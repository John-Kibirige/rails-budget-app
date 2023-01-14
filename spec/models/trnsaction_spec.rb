require 'rails_helper'

RSpec.describe Trnsaction, type: :model do
  before :each do
    @user = User.create(name: 'Peter', email: 'pete@gmail.com', password: '12345678',
                        password_confirmation: '12345678')
    @trnsaction = Trnsaction.new(name: 'tran', amount: 14.5)
    @trnsaction.author = @user
  end

  context 'Validations:' do
    it 'passes with valid data' do
      @trnsaction.save
      expect(@trnsaction).to be_valid
    end

    it 'fails with name empty ' do
      @trnsaction.name = ''
      @trnsaction.save
      expect(@trnsaction).to_not be_valid
    end

    it 'fails with amount empty' do
      @trnsaction.amount = nil
      @trnsaction.save
      expect(@trnsaction).to_not be_valid
    end
  end
end
