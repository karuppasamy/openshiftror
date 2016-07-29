class PostsController < ApplicationController
  before_action :collect_post

  def index
    render json: @post
  end

  def create
    @post = Post.new(permitted_params)

    respond_to do |format|
      if @post.save
        format.json { render json: { message: 'Success' } }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def collect_post
    @post = Post.all
  end

  def permitted_params
    params.permit(:image, :description, :amount_expected)
  end
end
