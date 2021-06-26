class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
<<<<<<< HEAD
    @timeline_posts = current_user.timelineposts
=======
    @timeline_posts = current_user.timeline_display
>>>>>>> 26237038bb83691be4be8992b770d0feb3f380ec
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
