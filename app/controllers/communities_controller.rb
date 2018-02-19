class CommunitiesController < ApplicationController


  def show
    id = params[:id] # retrieve community ID from URI route
    @commune = Community.find(id) # look up commune by unique ID

    # get the current logged in resident (if any)
    @current_resident = current_user
    
    # will render app/views/communities/show.<extension> by default
  end

  def new
    # want to be able to search
    # or create new
    @commune=Community.new
  end

  def index
    # want to be able to search
    # or create new
    @commune=Community.new
    @communes = Community.all
  end

  def create
    @commune = Community.new(community_params)
    if @commune.save
      flash[:notice] = "You signed up successfully."
      flash[:notice2] = "#{@commune.name} was successfully created!"
      redirect_to community_path(@commune)
    else
      render "new"
    end

  end

  def show
    id = params[:id] # retrieve ID from URI route
    @commune = Community.find(id) # look up community by unique ID
    # will render app/views/communities/show.<extension> by default
  end

  private

      def community_params
        params.require(:commune).permit(:name,
                                        :password,
                                        :password_confirmation,
                                        :password_digest,
                                        :street,
                                        :number)
      end

end
