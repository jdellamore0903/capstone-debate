require 'unirest'
while true
  p 'Welcome to the citation selection'

  p '[1] View all citation comment'
  p '[2] View a specific citation comment'
  p '[3] Create a citation comment'
  p '[4] Update a citation comment'
  p '[5] Delete a citation comment'
  p '[exit] Exit'

  user_response = gets.chomp

  if user_response == '1'
    response = Unirest.get("http://localhost:3000/citation_comments")
    p response.body
  elsif user_response == '2'
    p "What citation comment would you like to view the comments on"
    citation_id = gets.chomp
    response = Unirest.get("http://localhost:3000/citation_comments/#{citation_id}")
    p response.body
  elsif user_response == '3'
    p "Let's create a citation"
    the_params = {}
    p "What is the citation id you would like to comment on"
    the_params["citation_id"] = gets.chomp
    p "Please type in your comment"
    the_params["comment"] = gets.chomp
    p "Is this a [1]positive or [2]negative"
    user_response = gets.chomp
    if user_response == '1'    
      the_params["positive"] = true
    else
      the_params["positive"] = false
    end

    response = Unirest.post("http://localhost:3000/citation_comments", parameters: the_params)
    p response.body
  elsif user_response == '4'
    p "What citation_id do you want to find"
    the_params = {}
    the_id = gets.chomp
    
    initial_citation_comment = Unirest.get("http://localhost:3000/citation_comments/#{the_id}").body

    p "What citation does it belong to?"
    p initial_citation_comment["citation_id"]
    the_params["citation_id"] = gets.chomp
    p "What is the comment"
    p initial_citation_comment["comment"]
    the_params["comment"] = gets.chomp
    p "Is it [1]positive or [2]negative"
    p initial_citation_comment["positive"]
    user_response = gets.chomp
    if user_response == '1'
      the_params["positive"] = "true"
    else
      the_params["positive"] = "false"
    end

    the_params.delete_if {|key, value| value.empty?}

    response = Unirest.patch("http://localhost:3000/citation_comments/#{the_id}", parameters: the_params)
    p response.body

  elsif user_response == '5'
    p "What comment would you like to delete"
    the_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/citation_comments/#{the_id}")
    p response.body
  elsif user_response.downcase == 'exit'
    break
  else
    p "Please choose a valid option"
  end
      
      
      
      
      

end
