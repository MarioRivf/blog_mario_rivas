require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves a user' do
    user = User.new(email: 'user@example.com', password: '123456', password_confirmation: '123456')
    expect(user).to be_valid
    expect(user.save).to be(true)
  end

  it 'reads a user' do
    user = User.create(email: 'user@example.com', password: '123456', password_confirmation: '123456')
    expect(User.find(user.id).email).to eq('user@example.com')
  end

  it 'updates a user' do
    user = User.create(email: 'user@example.com', password: '123456', password_confirmation: '123456')
    user.update(email: 'new_email@example.com')
    expect(User.find(user.id).email).to eq('new_email@example.com')
  end

  it 'destroys a user' do
    user = User.create(email: 'user@example.com', password: '123456', password_confirmation: '123456')
    expect { user.destroy }.to change(User, :count).by(-1)
  end

  # Validations
  it 'is invalid without an email' do
    user = User.new(password: '123456', password_confirmation: '123456')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(email: 'user@example.com')
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid without a password confirmation' do
    user = User.new(email: 'user@example.com', password: '123456')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end
end
