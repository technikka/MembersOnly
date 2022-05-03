class PostsController < ApplicationController
  before_action :authenticate_member!, except: [:index]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_member.posts.build
  end

  def create
    @post = current_member.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
