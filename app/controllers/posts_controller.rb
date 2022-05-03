class PostsController < ApplicationController
  before_action :authenticate_member!, except: [:index]

  def index
    @posts = Post.all
  end

  def new; end

  def create; end
end
