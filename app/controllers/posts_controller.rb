class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.page(params[:page]).per(4)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, notice: "Post was successfully destroyed."
    else
      flash[:alert] = "Failed to delete the post. Please try again."
      redirect_to posts_path
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  # Set post via API
  def set_post
    @post = Post.find(params[:id])
    if @post.nil?
      redirect_to posts_path, notice: "The post you're trying to access has been deleted or does not exist."
    end
  end

  # Ensure the current user is the owner of the post
  def correct_user
    @post = Post.find(params[:id])
    if @post && @post.user_id != current_user.id
      redirect_to posts_path, alert: "Not authorized to edit this post."
    end
  end
end
