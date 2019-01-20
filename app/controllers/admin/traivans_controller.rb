class Admin::TraivansController < Admin::ApplicationController
  def index
  	@traivan = Traivan.all
  end

  def edit
  	@traivan = Traivan.find(params[:id])
  end

  def update
  	@traivan = Traivan.find(params[:id])
  	if @traivan.update(traivan_params)
  		redirect_to admin_traivans_path, notice: 'There are successful to update adminstrator'
  	else
  		flash[:alert] = 'There are problem to update adminstrator'
  		render :edit
  	end
  end

  private
  	def traivan_params
  		params.require(:traivan).permit(:fullname, :username, :password)
  	end
end

