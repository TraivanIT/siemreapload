class Admin::MessagesController < Admin::ApplicationController
  def index
    if params[:search].present?
      @messages = Message.joins(:visitor).where(" fullname LIKE ? OR content LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%" ).page(params[:page]).per(10)
    else
      @messages = Message.order(id: :desc).page(params[:page]).per(10)
    end
  	
  end

  def show
    @message = Message.find(params[:id])
    if @message.status == false
      @message.update(status: true)
    end
  end

  def update
    @message = Message.find(params[:id])
    @message.update(status: params[:status])

    redirect_back fallback_location: admin_messages_url , notice: "message was successfull update"
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy
  	redirect_back fallback_location: admin_messages_url , notice: "message was successfull delete"
  end
  	
end
