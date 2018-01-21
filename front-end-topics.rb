require 'unirest'
while(true)
  p '[1] See all topics'
  p '[2] See a specific topic'
  p '[3] Create a topic'
  p '[4] Update a topic'
  p '[5] Delete a topic'
  p '[6] Vote on a topic'
  p '[7] Vote on topicssss'
  p '[exit]'

  user_response = gets.chomp

  if user_response == '1'
    response = Unirest.get("http://localhost:3000/topics")
    p response.body

  elsif user_response == '2'
    p "What is the topic id"
    topic_id = gets.chomp
    response = Unirest.get("http://localhost:3000/topics/#{topic_id}")
    p response.body

  elsif user_response == '3'
    the_params = {}
    p "What is the topic?"
    the_params["topic_title"] = gets.chomp

    the_params.delete_if {|key, value| value.empty?}

    response = Unirest.post("http://localhost:3000/topics", parameters: the_params)
    p response.body

  elsif user_response == '4'
    the_params = {}
    p "What is the topic id you would like to change?"
    topic_id = gets.chomp
    initial_topic = Unirest.get("http://localhost:3000/topics/#{topic_id}").body
    p "What would you like to change it to?"
    p initial_topic["topic_title"]
    the_params["topic_title"] = gets.chomp

    the_params.delete_if {|key, value| value.empty?}

    p '--------'
    p the_params
    p '--------'

    response = Unirest.patch("http://localhost:3000/topics/#{topic_id}", parameters: the_params)

    p response.body

  elsif user_response == '5'
    p "What topic do you want to choose"
    topic_id = gets.chomp
    initial_topic = Unirest.delete("http://localhost:3000/topics/#{topic_id}")
  elsif user_response == '6'
  elsif user_response == '7'
  elsif user_response == 'exit'
    break
  else
    p "Please choose a valid option"
  end
end