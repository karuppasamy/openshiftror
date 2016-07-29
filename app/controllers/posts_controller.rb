class PostsController < ApplicationController
  before_action :collect_post

  def index
    render json: @post
  end

  private

  def collect_post
    @post = Post.all
  end

  def person_params
    params.require(:post).permit(:image, :description, :amount_expected)
  end
end
