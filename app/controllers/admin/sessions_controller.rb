class Admin::SessionsController < Admin::ApplicationController
	before_action :authorize, except: [:new , :create, :destroy]
  def new

  end

  def create
  	@traivan = Traivan.find_by(username: params[:username]).try(:authenticate, params[:password])
  	if @traivan
  		session[:current_traivan_id] = @traivan.id
  		redirect_to admin_traivans_path, notice: "You have successfull login"
  	else
  		flash[:alert] = "There are problem with your password or username"
  		render :new
  	end
  end

  def destroy
  	session[:current_traivan_id] = nil
  	redirect_to '/login', notice: 'You have successfull logout'
  end
end
