class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update, :destroy]
  # Identificar el post por el id en los metodos anteriores, evitar repetir en los 4 métodos

  def index
    @posts = Post.all.order(created_at: :asc) 
  end

  def show    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user    

    if @post.save 
      flash[:notice] = "Post creado satisfactoriamente"
      redirect_to posts_path
    else  
      render :new     
    end  
  end

  def edit 
     
  end

  def update    
    if @post.update(post_params)
      flash[:notice] = "Post actualizado satisfactoriamente"  
      redirect_to post_path(@post)
    else
      render :edit  
    end
  end 

  def destroy    
    if @post.destroy
      flash[:notice] = "Post eliminado satisfactoriamente"  

      redirect_to posts_path
    end
  end

  private
   
  def post_params
    params.require(:post).permit(:title, :content)
  end 
  
  def current_post
    @post = Post.find( params[:id]) 
  end  

end
