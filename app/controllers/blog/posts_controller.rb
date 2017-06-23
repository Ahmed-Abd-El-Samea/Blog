module Blog
	class PostsController < BlogController

	  # GET /posts
	  # GET /posts.json
	  def index
	  	if params[:tag]
	    	@posts = Post.most_recent.published.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
	  	else
	  		@posts = Post.most_recent.published.paginate(:page => params[:page], :per_page => 5)
	  	end
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
	  	@post = Post.published.friendly.find(params[:id])
	  end
	end
end