module Api
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
  
      # GET /api/posts
      def index
        @posts = Post.all
        render json: @posts
      end
  
      # GET /api/posts/:id
      def show
        render json: @post
      end
  
      # POST /api/posts
      def create
        @post = Post.new(post_params)
        if @post.save
            render json: @post
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/posts/:id
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/posts/:id
      def destroy
        @post.destroy
        head :no_content
      end
  
      private
  
      # Método para encontrar la publicación por ID
      def set_post
        @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Post not found" }, status: :not_found
      end
  
      # Permite solo los parámetros necesarios
      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
    end
  end
  