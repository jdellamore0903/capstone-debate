require 'unirest'
while(true)
  p "Welcome to the App"
  p "[1] New or [2] Returning user. Or [3] log out"

  user_response = gets.chomp

  if user_response == '1'
    the_params = {}
    p "It's nice to meet you"
    p "What is your name"
    the_params["name"] = gets.chomp
    p "What is your email"
    the_params["email"] = gets.chomp
    p "Please type your password"
    the_params["password"] = gets.chomp
    p "Please confirm your password"
    the_params["password_verification"] = gets.chomp

    response = Unirest.post("http://localhost:3000/users", parameters: the_params)

    p response.body


  elsif user_response == '2'
    p "Welcome back"
    p "What is your email"
    user_email = gets.chomp
    p "What is your password"
    user_password = gets.chomp
    response = Unirest.post('localhost:3000/user_token', parameters: {
      auth: {
        email: user_email,
        password: user_password
      }
      })

    if response.body == ""
      p "Not a real user. Please try again or create an account"
    else
      p response.body
      jwt = response.body["jwt"]
      Unirest.default_header("Authorization", "Bearer #{jwt}")
    end

  elsif user_response == '3'
    jwt = ""
    Unirest.clear_default_headers()
    p "You just logged out"

  else
    p "Please choose a real option"
    break
  end
end
      
    

