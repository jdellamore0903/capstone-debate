class TopicsController < ApplicationController
  def index
    topics = Topic.all
    render json: topics.as_json
  end

  def show
    topic_id = params[:id]
    topic = Topic.find_by(id: topic_id)
    render json: topic.as_json
  end

  def create
    topic = Topic.new({
      topic_title: params[:topic_title],
      prior_aff_votes: 0,
      prior_neg_votes: 0
      })

    if topic.save
      render json: topic.as_json
    else
      render json: {errors: topic.errors.full_message}
    end
  end

  def update
    topic_id = params[:id]
    topic = Topic.find_by[id: topic_id]
    topic[:topic_title] = params[:topic_title] || topic[:topic_title]
    topic[:prior_aff_votes] = params[:prior_aff_votes] || topic[:prior_aff_votes]
    topic[:prior_neg_votes] = params[:prior_neg_votes] || topic[:prior_neg_votes]

    if topic.save
      render json: topic.as_json
    else
      render json: {errors: topic.errors.full_message}
    end
  end

  def destroy
    topic_id = params[:id]
    topic = Topic.find_by[id: topic_id]
    topic.destroy
  end

end
