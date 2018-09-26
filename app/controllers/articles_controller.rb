



class ArticlesController < ApplicationController

  def show
    id = params[:id] # retrieve article ID from URI route
    @article = Article.find(id) # look up resident by unique ID

  end

  def new
    resident_id = params[:id] # retrieve resident ID from URI route
    puts resident_id
    @person=Resident.find(resident_id)
    @commune = Community.find(@person.community_id)
    @article = Article.new
  end

  def index
    # presents a list of all articles of the community
  end

  def create
    @article=Article.new(article_params)

    if @article.save
      flash[:notice] = "#{@article.title} was added to your items list"
      redirect_to article_path(@article)
    else
      render "new"
    end

  end

  def edit
    article_id = params[:id]
    @article=Article.find(article_id)

    # does not render show, because want the owner to see the edits
  end

  def update
    # updates request array of article
    res_id = @article.resident_id
    if @article.request_array.include? res_id
      flash[:notice] = "You already have an outstanding request for #{@article.title}"
      redirect_to article_path(@article)
    else
      @article.request_array << res_id
      if @article.request_array.include? res_id
        flash[:notice] = "#{@article.title} was added to your items list"
        redirect_to article_path(@article)
      else
        flash[:notice] = "You cannot request #{@article.title}"
        redirect_to article_path(@article)
      end

    end

  end


  private

      def article_params
        params.require(:article).permit(:form,
                                        :title,
                                        :available,
                                        :community_id,
                                        :resident_id,
                                        :description)
      end

end
