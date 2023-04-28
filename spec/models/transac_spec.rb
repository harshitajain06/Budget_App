require 'rails_helper'

RSpec.describe Transac, type: :model do
  before(:example) do
    @user = User.create(name: 'Harshita', email: 'harshita@gmail.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Grocieries', author: @user)
    @transac = Transac.create(name: 'apple', amount: 45, author: @user)
    @transac.categories << @category
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@transac).to be_valid
    end
    it 'is not valid without a name' do
      @transac.name = nil
      expect(@transac).to_not be_valid
    end
    it 'is not valid without an amount' do
      @transac.amount = nil
      expect(@transac).to_not be_valid
    end
    it 'is not valid with a name shorter than 3 characters' do
      @transac.name = 'as'
      expect(@transac).to_not be_valid
    end
    it 'is not valid with a name longer than 50 characters' do
      @transac.name = 'a' * 51
      expect(@transac).to_not be_valid
    end
    it 'is not valid with an amount less than 1' do
      @transac.amount = 0
      expect(@transac).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(@transac.author).to eq(@user)
    end
    it 'has name' do
      expect(@transac.name).to eq('apple')
    end
    it 'has amount' do
      expect(@transac.amount).to eq(45)
    end
    it 'has categories' do
      expect(@transac.categories).to eq([@category])
    end
  end
end