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
    if params["aff_user_id"]
      debate = Debate.new({
        aff_user_id: current_user.id,
        affirmative_votes: 0,
        negative_votes: 0,
        topic_id: params["topic_id"]
        })

      if debate.save
        render json: debate.as_json
      else
        render json: {errors: debate.errors.full_message}
      end
    else
      debate = Debate.new({
        neg_user_id: current_user.id,
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
  end

  def update
    if params["aff_user_id"]
      id = params["id"]
      debate = Debate.find_by(id: id)
      debate["aff_user_id"] = current_user.id
      debate["neg_user_id"] = params["neg_user_id"] || debate["neg_user_id"]
      debate["affirmative_votes"] = params["affirmative_votes"] || debate["affirmative_votes"]
      debate["negative_votes"] = params["negative_votes"] || debate["negative_votes"]
      debate["topic_id"] = params["topic_id"] ||  debate["topic_id"]

      debate.save
    else
      id = params["id"]
      debate = Debate.find_by(id: id)
      debate["aff_user_id"] = params["aff_user_id"] || debate["aff_user_id"]
      debate["neg_user_id"] = current_user.id
      debate["affirmative_votes"] = params["affirmative_votes"] || debate["affirmative_votes"]
      debate["negative_votes"] = params["negative_votes"] || debate["negative_votes"]
      debate["topic_id"] = params["topic_id"] ||  debate["topic_id"]

      debate.save
    end
    

  end

  def destroy
    id = params["id"]
    debate = Debate.find_by(id: id)
    debate.destroy
    render json: {message: "It was deleted!"}
  end

  def vote
    debate = Debate.find_by(id: params["id"])
    if params["side"] == "aff"
      debate["affirmative_votes"] = debate["affirmative_votes"] + 1
    else
      debate["negative_votes"] = debate["affirmative_votes"] + 1
    end
    p debate
    p "---------"
    p "This works"
    p "---------"
    debate.save
  end

end
