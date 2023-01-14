require 'rails_helper'

RSpec.describe Ctegory, type: :model do
  before :each do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '12345678',
                        password_confirmation: '12345678')
    @category = Ctegory.new(name: 'Calls', icon: 'calls.svg')
    @category.author = @user
  end

  context 'Validations:' do
    it 'Category with valid data' do
      @category.save
      expect(@category).to be_valid
    end

    it 'Category with name empty ' do
      @category.name = ''
      @category.save
      expect(@category).to_not be_valid
    end

    it 'Category with icon empty' do
      @category.icon = nil
      @category.save
      expect(@category).to_not be_valid
    end
  end
end
