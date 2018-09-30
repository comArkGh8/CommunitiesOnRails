



class ArticlesController < ApplicationController

  def show
    id = params[:id] # retrieve article ID from URI route
    @article = Article.find(id) # look up resident by unique ID

  end

  def new
    resident_id = params[:id] # retrieve resident ID from URI route
    @person=Resident.find(resident_id)
    @commune = Community.find(@person.community_id)
    @article = Article.new
  end

  def index
    # presents a list of all articles of the community
  end

  def create
    @article=Article.new(article_params)
    new_request_array = ''
    @article.update(request_array: new_request_array)
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
    orig_request_array = @article.request_array
    request_id_array = return_array(orig_request_array)
    # now make new array of names
    @names_of_request_array = Array.new()
    if request_id_array.length >=1
      request_id_array.each do |res_num|
        name_to_add = Resident.find(res_num.to_i)
        @names_of_request_array.push(name_to_add)
      end
    end
    # does not render show, because want the owner to see the edits
  end

  # updates request array of article
  def ask_for
    article_id = params[:id]
    @article=Article.find(article_id)
    res_id = @article.resident.id
    res_name = Resident.find(res_id).name
    request_id_array = return_array(@article.request_array)
    if request_id_array.include? res_id.to_s
      flash[:notice] = "#{res_name}, you already have an outstanding request for #{@article.title}"
      redirect_to article_path(@article)
    #else add the name to the Array
    else
      add_id_to_list(@article, res_id)
      redirect_to article_path(@article)
    end

  end


  def update


    # only if owner
    # check if current_user (defined in sessions helper)
    # is same as resident to which article belongs
    article_id = params[:id]
    @article=Article.find(article_id)
    res_id = @article.resident.id
    res_id = @article.resident.id
    if res_id == current_id
      new_title = params[:article][:title]
      @article.update(title: new_title)
      new_descript = params[:article][:description]
      @article.update(description: new_descript)
      new_cat = params[:article][:form]
      @article.update(form: new_cat)
      redirect_to article_path(@article)
    else
      flash[:notice] = "Only the owner can change details of  #{@article.title}"
      redirect_to article_path(@article)
    end

  end


  private

      def article_params
        params.require(:article).permit(:form,
                                        :title,
                                        :available,
                                        :community_id,
                                        :resident_id,
                                        :description,
                                        :request_array)
      end


end
