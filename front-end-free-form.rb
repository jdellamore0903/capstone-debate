require 'unirest'

p '[1] See all free form'
p '[2] See a free form'
p '[3] Create a free form'
p '[4] Update a free form'
p '[5] Delete a free form'

user_response = gets.chomp

if user_response == '1'
  response = Unirest.get("http://localhost:3000/freeform")
  p response.body
elsif user_response == '2'
  p "What is the id?"
  free_form_id = gets.chomp
  response = Unirest.get("http://localhost:3000/freeform/#{free_form_id}")
  p response.body
elsif user_response == '3'
elsif user_response == '4'
elsif user_response == '5'
else
  p "Please choose a legit one"
end
    
    
    
    