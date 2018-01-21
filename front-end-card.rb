#THIS IS IMPORTANT: a user will create a card and a citation at the same time. The site will use front-end-citation and the card will use front-end-card (this file)
require 'unirest'
while true
  p 'Welcome to the card selection'

  p '[1] View all cards'
  p '[2] View a specific card'
  p '[3] Create a card'
  p '[4] Update a card'
  p '[5] Delete a card'
  p '[exit] Exit'

  user_response = gets.chomp

  if user_response == '1'
    response = Unirest.get("http://localhost:3000/cards").body
    p response
  elsif user_response == '2'
    p "What is the card ID"
    card_id = gets.chomp
    response = Unirest.get("http://localhost:3000/cards/#{card_id}")
    p response.body
  elsif user_response == '3'
    p "Let's create a card!"
    the_params = {}
    p "What is the tag"
    the_params["tag"] = gets.chomp
    p "What is the citation ID"
    the_params["citation_id"] = gets.chomp
    p "What is the card text"
    the_params["card_text"] = gets.chomp
    p "What is the topic id"
    the_params["topic_id"] = gets.chomp
    p "What is the debate id"
    the_params["debate_id"] = gets.chomp
    p "What is the speech id"
    the_params["speech_id"] = gets.chomp
    p "What is the argument type"
    the_params["argument_type"] = gets.chomp

    response = Unirest.post("http://localhost:3000/cards", parameters: the_params)
    p response.body

  elsif user_response == '4'
    p "Let's update a card"
    the_params = {}
    p "What is the id"
    card_id = gets.chomp
    initial_card = Unirest.get("http://localhost:3000/cards/#{card_id}").body

    p "What is the tag"
    p initial_card["tag"]
    the_params["tag"] = gets.chomp
    p "What is the citation ID"
    p initial_card["citation_id"]
    the_params["citation_id"] = gets.chomp
    p "What is the card text"
    p initial_card["card_text"]
    the_params["card_text"] = gets.chomp
    p "What is the topic id"
    p initial_card["topic_id"]
    the_params["topic_id"] = gets.chomp
    p "What is the debate id"
    p initial_card["debate_id"]
    the_params["debate_id"] = gets.chomp
    p "What is the speech id"
    p initial_card["speech_id"]
    the_params["speech_id"] = gets.chomp
    p "What is the argument type"
    p initial_card["argument_type"]
    the_params["argument_type"] = gets.chomp

    the_params.delete_if {|key, value| value.empty?}

    response = Unirest.patch("http://localhost:3000/cards/#{card_id}", parameters: the_params)
    p response.body


  elsif user_response == '5'
    p "What is the id of the card you would like to delete"
    card_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/cards/#{card_id}")
    p response.body
    
  elsif user_response.downcase == 'exit'
    break
  else
    p "Please select a valid option"
  end

end