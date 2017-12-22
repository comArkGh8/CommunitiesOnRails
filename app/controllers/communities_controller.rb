class CommunitiesController < ApplicationController

  def community_params
    params.require(:name).permit(:street, :number)
  end
  
  def show
    id = params[:id] # retrieve community ID from URI route
    @commune = Community.find(id) # look up commune by unique ID
    # will render app/views/community/show.<extension> by default
  end
  
  # now do view!
 
end
