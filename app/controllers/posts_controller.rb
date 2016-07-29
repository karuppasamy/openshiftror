class PostsController < ApplicationController
  before_action :collect_post

  def index
    render json: @posts
  end

  def create
    @post = @posts.build(permitted_params)

    respond_to do |format|
      if @post.save
        format.json { render json: { message: 'Success' } }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    render json: @posts.find(params[:id])
  end

  private

  def collect_post
    @posts = current_user.posts.all
  end

  def permitted_params
    params.permit(:image, :description, :amount_expected)
  end
end
