

class ResidentsController < ApplicationController


  def show
    resident_id = params[:id] # retrieve resident ID from URI route
    @person = Resident.find(resident_id) # look up resident by unique ID
    @commune = Community.find(@person.community_id)
  end

  def new
    commune_id = params[:id] # retrieve community ID from URI route
    @resident=Resident.new
    @commune = Community.find(commune_id)
  end

  def index
    # presents a list of all Residents
    @all_people = Resident.all
  end

  def create
    commune_id = params[:community_id]
    @commune = Community.find(commune_id)

    @person = Resident.new(resident_params)
    @person.community_id = commune_id


    if @person.save
      flash[:notice] = "You signed up successfully."
      flash[:notice2] = "#{@person.name} was added to the #{@commune.name} community"
      redirect_to resident_path(@person)
    else
      render "new"
    end

  end


  def index
    # presents a list of all Residents
    @all_people = Resident.all
  end




  private

      def resident_params
        params.require(:resident).permit(:name,
                                        :articles,
                                        :community_id,
                                        :email,
                                        :phone,
                                        :password,
                                        :password_confirmation,
                                        :password_digest)
      end

end
