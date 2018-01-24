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
    #need to verify password!
    @communes = Community.all
  end
 
end
