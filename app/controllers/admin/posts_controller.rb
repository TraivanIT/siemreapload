class Admin::PostsController <  Admin::ApplicationController
  def index
    if params[:search].present?
      @posts = Post.post_search(params[:search]).page(params[:page])
    else
      @posts = Post.order(id: :desc).page(params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new

  end

  def create
     @post = Post.new(posts_params)
     @post.traivan_id = current_traivan.id
     if @post.save
      redirect_to admin_posts_path, notice: "There are successfull created"
    else
      flash[:alert] = "There are problem create post"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to admin_posts_path, notice: "There are successfull update"
    else
      flash[:alert] = "There are problem update post"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_url, notice: "There are successfull delete"
  end

  private
    def posts_params
      params.require(:post).permit(:id, :title, :content, :publish, tag_ids: [])
    end
end

