class CommunitiesController < ApplicationController

  def community_params
    params.require(:name).permit(:street, :number)
  end

  def show
    id = params[:id] # retrieve community ID from URI route
    @commune = Community.find(id) # look up commune by unique ID
    # will render app/views/communities/show.<extension> by default
  end
  
  def index
    # want to be able to search
    # or create new
    @commune=Community.new
    @communes = Community.all
  end
  
  def create
    @commune = Community.new(params[:commune])
    if @commune.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Data is invalid"
      flash[:color]= "invalid"
    end
    render "index"
  end
 
end
