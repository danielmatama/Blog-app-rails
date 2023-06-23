class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    render json: @comments
  end
  def new
    @comment = Comment.new
    render json: @comment
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    post = Post.find(params[:post_id])
    # if @comment.save
    #   redirect_to user_post_path(current_user.id, post)
    # else
    #   render :new
    # end
    respond_to do |format|
      if @comment.save
        format.html do
          flash[:success] = 'Comment created successfully'
          redirect_to user_post_url(@post.author, @post)
        end
        format.json { render json: @comment, status: :created }
      else
        format.html do
          flash[:error] = 'Error: Comment not created'
          redirect_to new_user_post_comment_url(@post.author, @post)
        end
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end

  end

  def destroy
    Comment.delete(params[:id])
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :post_id)
  end
end
