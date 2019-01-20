class Admin::CommentsController < Admin::ApplicationController

  def index
  	if params[:search].present?
  		@comments = Comment.joins(:visitor).where("fullname LIKE ? OR message LIKE ?" , "%#{params[:search]}%" , "%#{params[:search]}%").page(params[:page]).per(5)
  	else
  		@comments = Comment.where(status: to_boo(params[:status])).page(params[:page]).per(5)
  	end
  	
  end

  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(status: params[:status])
  		redirect_back fallback_location: admin_comments_url, notice: 'Comment successfully updated'
  	else
  		redirect_to admin_comments_url, alert: "Comment status was problem update"
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to admin_comments_url, notice: "Comment was successfull delete"
  end
end
