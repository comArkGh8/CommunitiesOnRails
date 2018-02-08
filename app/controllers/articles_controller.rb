



class ArticlesController < ApplicationController


  def new
    resident_id = params[:id] # retrieve community ID from URI route
    @person=Resident.find(resident_id)
    @commune = Community.find(@person.community_id)
    @article = Article.new
  end

  def index
    # presents a list of all articles of the community
  end

  def create
    @person = params[:resident]
    render "new"
  end




  private

      def article_params
        params.require(:article).permit(:form,
                                        :community_id,
                                        :resident_id,
                                        :description)
      end

end
