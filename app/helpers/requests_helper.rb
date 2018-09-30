

module RequestsHelper



  def return_array(string_of_res_ids)
    string_without_min = string_of_res_ids.split('-')
    string_without_blank = string_without_min.drop(1)
  end


  # updates an article with a new request Array
  # inputes article and name
  # assumes article has initialized array
  def add_id_to_list(article, id_to_add)

    # first make sure not already requested
    array_to_check = return_array(article.request_array)
    if array_to_check.include? id_to_add.to_s
      flash[:notice] = "You cannot request #{article.title} twice"

    else
      new_request_array = article.request_array
      new_request_array << '-' + id_to_add.to_s
      article.update(request_array: new_request_array)

      # now check if id is added
      array_to_check = return_array(article.request_array)
      if array_to_check.include? id_to_add.to_s
        flash[:notice] = "#{article.title} was added to your items requested list"
      else
        flash[:notice] = "You cannot request #{article.title}"
      end

    end

  end

end
