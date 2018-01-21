class DebatesController < ApplicationController
  def index
    debates = Debate.all
    render json: debates.as_json
  end

  def show
    id = params["id"]
    debate = Debate.find_by(id: id)
    render json: debate.as_json
  end

  def create
    debate = Debate.new({
      aff_user_id: params["aff_user_id"],
      neg_user_id: params["neg_user_id"],
      affirmative_votes: 0,
      negative_votes: 0,
      topic_id: params["topic_id"]
      })

    if debate.save
      render json: debate.as_json
    else
      render json: {errors: debate.errors.full_message}
    end
  end

  def update
    id = params["id"]
    debate = Debate.find_by(id: id)
    debate["aff_user_id"] = params["aff_user_id"] || debate["aff_user_id"]
    debate["neg_user_id"] = params["neg_user_id"] || debate["neg_user_id"]
    debate["affirmative_votes"] = params["affirmative_votes"] || debate["affirmative_votes"]
    debate["negative_votes"] = params["negative_votes"] || debate["negative_votes"]
    debate["topic_id"] = params["topic_id"] ||  debate["topic_id"]

  end

  def destroy
    id = params["id"]
    debate = Debate.find_by(id: id)
    debate.destroy
    render json: {message: "It was deleted!"}
  end

end
