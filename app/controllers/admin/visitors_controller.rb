class Admin::VisitorsController < Admin::ApplicationController
  def index
  	@visitors = Visitor.order(id: :desc).page(params[:page]).per(5)
  end

  def destroy
  	@visitor = Visitor.find(params[:id])
  	@visitor.destroy
  	redirect_to admin_visitors_url, notice: "visitor was successfull delete"
  end
end
