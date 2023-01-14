require 'rails_helper'

RSpec.describe TransactionCategory, type: :model do
  before :each do
    @user = User.create(name: 'Peter', email: 'pete@gmail.com', password: '12345678',
                        password_confirmation: '12345678')
    @category = Ctegory.create(name: 'Calls', icon: 'calls.svg', author_id: @user.id)
    @trnsaction = Trnsaction.create(name: 'tran', amount: 14.5, author_id: @user.id)

    @transaction_category = TransactionCategory.new(ctegory_id: @category.id, trnsaction_id: @trnsaction.id)
  end

  context 'Validations:' do
    it 'passes with valid data' do
      @transaction_category.save
      expect(@transaction_category).to be_valid
    end

    it 'fails with nil category ' do
      @transaction_category.ctegory = nil
      @transaction_category.save
      expect(@transaction_category).to_not be_valid
    end

    it 'fails with nil transaction' do
      @transaction_category.trnsaction = nil
      @transaction_category.save
      expect(@transaction_category).to_not be_valid
    end
  end
end
