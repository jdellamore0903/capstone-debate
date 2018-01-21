require 'unirest'
while true
  p 'Welcome to the citation selection'

  p '[1] View all citations'
  p '[2] View a specific citation'
  p '[3] Create a citation'
  p '[4] Update a citation'
  p '[5] Delete a citation'
  p '[6] Vote on a citation'
  p '[exit] Exit'

  user_response = gets.chomp

  if user_response == '1'
    response = Unirest.get("http://localhost:3000/citations")
    p response.body
  elsif user_response == '2'
    p "What is the citation id"
    citation_id = gets.chomp
    response = Unirest.get("http://localhost:3000/citations/#{citation_id}")
    p response.body
  elsif user_response == '3'
    p "Let's create a cite"
    the_params = {}
    p "What is the authors first name"
    the_params["author_first"] = gets.chomp
    p "What is the authors last name"
    the_params["author_last"] = gets.chomp
    p "What is the cite URL"
    the_params["url_link"] = gets.chomp
    p "What is the article title"
    the_params["article_title"] = gets.chomp
    p "What is the date of the article"
    the_params["article_date"] = gets.chomp
    response = Unirest.post("http://localhost:3000/citations", parameters: the_params)
    p response.body
  elsif user_response == '4'
    p "Let's change a cite"
    p "What citation would you like to change"
    citation_id = gets.chomp
    initial_citation = Unirest.get("http://localhost:3000/citations/#{citation_id}").body
    the_params = {}
    p "What is the authors first name"
    p initial_citation["author_first"]
    the_params["author_first"] = gets.chomp
    p "What is the authors last name"
    p initial_citation["author_last"]
    the_params["author_last"] = gets.chomp
    p "What is the cite URL"
    p initial_citation["url_link"]
    the_params["url_link"] = gets.chomp
    p "What is the article title"
    p initial_citation["article_title"]
    the_params["article_title"] = gets.chomp
    p "What is the date of the article"
    p initial_citation["article_date"]
    the_params["article_date"] = gets.chomp

    the_params.delete_if {|key, value| value.empty?}

    response = Unirest.patch("http://localhost:3000/citations/#{citation_id}", parameters: the_params)
    p response.body
  elsif user_response == '5'
    p "What is the id of the citation you would like to delete"
    citation_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/citations/#{citation_id}")
    p response.body

  elsif user_response == '6'
    p "What is the cite id?"
    the_params = {}
    citation_id = gets.chomp
    initial_citation = Unirest.get("http://localhost:3000/citations/#{citation_id}").body

    p "Do you want to [1]Up Vote or [2]Down Vote"
    user_response = gets.chomp

    if user_response == '1'
      the_params["up_vote"] = initial_citation["up_vote"].to_i + 1
    elsif user_response == '2'
      the_params["down_vote"] = initial_citation["down_vote"].to_i + 1
    else
      p "Not a valid option"
    end

    response = Unirest.patch("http://localhost:3000/citations/#{citation_id}", parameters: the_params)

    p response.body

  else 
    break
  end
end