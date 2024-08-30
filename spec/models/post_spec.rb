require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: '123456', password_confirmation: '123456') }

  # Validaciones
  it 'is invalid without a title' do
    post = Post.new(body: 'This is a test post', user_id: user.id)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without a body' do
    post = Post.new(title: 'Test Post', user_id: user.id)
    post.valid?
    expect(post.errors[:body]).to include("can't be blank")
  end

  it 'is invalid without a user' do
    post = Post.new(title: 'Test Post', body: 'This is a test post')
    post.valid?
    expect(post.errors[:user]).to include("must exist")
  end

  # Pruebas existentes
  it 'saves a post' do
    post = Post.new(title: 'Test Post', body: 'This is a test post', user_id: user.id)
    expect(post).to be_valid
    expect(post.save).to be(true)
  end

  it 'reads a post' do
    post = Post.create(title: 'Test Post', body: 'This is a test post', user_id: user.id)
    expect(Post.find(post.id).title).to eq('Test Post')
  end

  it 'updates a post' do
    post = Post.create(title: 'Test Post', body: 'This is a test post', user_id: user.id)
    post.update(title: 'Updated Test Post')
    expect(Post.find(post.id).title).to eq('Updated Test Post')
  end

  it 'destroys a post' do
    post = Post.create(title: 'Test Post', body: 'This is a test post', user_id: user.id)
    expect { post.destroy }.to change(Post, :count).by(-1)
  end
end
