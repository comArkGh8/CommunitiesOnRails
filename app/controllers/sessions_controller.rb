

class SessionsController < ApplicationController

  def new

  end

  def create

    @users = Resident.where(name: params[:session][:name])
    if @users.size > 1
      @commune_list = Array.new
      @users.each do |res|
        res_commune_id = res.community_id
        @commune_list << Community.find(res_commune_id)
      end
    end


    if @users.size > 1
      # get commune of resident from page
      commune_id = params[:commune_id]
      @commune = Community.find(commune_id)
      # get the desired user
      @user = Resident.where(name: params[:session][:name], community_id: commune_id)

    else
      @user=@users.first
    end

    # see if can authenticate the user
    if @user && @user.authenticate(params[:session][:password])
        # Log the user in (save res_id and comm_id
        log_in @user
        # and redirect to the user's show page.
        redirect_to @user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end

  end

  def destroy

    log_out
    redirect_to root_url

  end

end
