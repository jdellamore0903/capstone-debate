class StructuredArgumentsController < ApplicationController
  def index
    structured_arguments = StructuredArgument.all
    render json: structured_arguments.as_json
  end

  def show
    structured_argument = StructuredArgument.find_by(id: params[:id])
    render json: structured_argument.as_json
  end

  def create
    structured_argument = StructuredArgument.new({
      argument_name: params["argument_name"],
      user_id: 1,
      speech_id: params["speech_id"]
      })
  end

  def update
  end

  def destroy
    structured_argument = StructuredArgument.find_by(id: params[:id])
    structured_argument.destroy
    render json: {message: "complete"}
  end



end
