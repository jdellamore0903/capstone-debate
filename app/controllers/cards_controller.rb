class CardsController < ApplicationController
  def index
    cards = Card.all
    render json: cards.as_json
  end

  def show
    card = Card.find_by(id: params["id"])
    render json: card.as_json
  end

  def create
    card = Card.new({
      tag: params["tag"],
      citation_id: params["citation_id"],
      card_text: params["card_text"],
      topic_id: params["topic_id"],
      debate_id: params["debate_id"],
      speech_id: params["speech_id"],
      argument_type: params["argument_type"]
      })

    if card.save
      render json: card.as_json
    else
      render json: {errors: card.errors.full_message}
    end
  end

  def update
    card = Card.find_by(id: params["id"])
    card["tag"] = params["tag"] || card["tag"]
    card["citation_id"] = params["citation_id"] || card["citation_id"]
    card["card_text"] = params["card_text"] || card["card_text"]
    card["topic_id"] = params["topic_id"] || card["topic_id"]
    card["debate_id"] = params["debate_id"] || card["debate_id"]
    card["speech_id"] = params["speech_id"] || card["speech_id"]
    card["argument_type"] = params["argument_type"] || card["argument_type"]

    if card.save
      render json: card.as_json
    else
      render json: {errors: card.errors.full_message}
    end
  end

  def destroy
    card = Card.find_by(id: params['id'])
    card.destroy
    render json: {message: "complete!"}
  end
end
