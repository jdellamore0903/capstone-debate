class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def create
    user = User.new({
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_verification: params[:password_verification]
      })

    if user.save
      render json: {message: "You created a user"}
    else
      render json: {errors: user.errors.full_messages}
    end

  end

end
