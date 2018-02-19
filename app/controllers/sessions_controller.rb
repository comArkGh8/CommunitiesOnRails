

class SessionsController < ApplicationController

  def new

    users = Resident.where(name: params[:session][:name])
    if users.size > 1 do
      @commune_list = Array.new
      users.each |res| do
        res_commune_id = res.community_id
        @commune_list << Community.find(res_commune_id)
      end
    end
    if users.size > 1 do
      # get commune of resident from page
      commune_id = params[:commune_id]
      @commune = Community.find(commune_id)
      # get the desired user
      @user = Resident.where(name: params[:session][:name], community_id: commune_id)
      # see if can authenticate the user
      if @user && @user.authenticate(params[:session][:password])

      # Log the user in and redirect to the user's show page.
  end

  def create
    render 'new'
  end

  def destroy
  end

end
