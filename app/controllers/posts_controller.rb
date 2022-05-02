class PostsController < ApplicationController
  before_action :authenticate_member!, except: [:index]
end
