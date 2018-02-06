

class ResidentsController < ApplicationController


  def show
    id = params[:id] # retrieve resident ID from URI route
    @person = Resident.find(id) # look up commune by unique ID
    # will render app/views/residents/show.<extension> by default
  end

  def new
    @person=Resident.new
  end

  def index
    # presents a list of all Residents
    @all_people = Resident.all
  end

  def create
    @person = Resident.new(resident_params)
    if @person.save
      flash[:notice] = "You signed up successfully."
      flash[:notice2] = "#{@person.name} was added to the ADD COMMUNE!!!"
      redirect_to resident_path(@person)
    else
      render "new"
    end

  end



  private

      def resident_params
        params.require(:person).permit(:name,
                                        :articles,
                                        :community_id,
                                        :password,
                                        :password_confirmation,
                                        :password_digest)
      end

end
