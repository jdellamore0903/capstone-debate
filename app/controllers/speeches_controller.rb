class SpeechesController < ApplicationController
  def index
    speeches = Speech.all
    render json: speeches.as_json
  end

  def show
    speech = Speech.find_by(id: params[:id])
    render json: speech.as_json
  end

  def create
    speech = Speech.new({
      user_id: params[:user_id],
      affirmative?: params[:affirmative?],
      speech_title: params[:speech_title],
      debate_id: params[:debate_id]
      })

    if speech.save
      render json: speech.as_json
    else
      render json: {errors: speech.errors.full_message}
    end
  end

  def update
    speech = Speech.find_by(id: params[:id])
    speech[:user_id] = params[:user_id] || speech[:user_id]
    speech[:affirmative?] = params[:affirmative?] || speech[:affirmative?]
    speech[:speech_title] = params[:speech_title] || speech[:speech_title]
    speech[:debate_id] = params[:debate_id] || speech[:debate_id]

    if speech.save
      render json: speech.as_json
    else
      render json: {errors: speech.errors.full_message}
    end
  end

  def destroy
    speech = Speech.find_by(id: params[:id])
    speech.destroy
  end

  def find_all_debate_speeches
    speeches = Speech.where(debate_id: params[:debate_id])
    render json: speeches.as_json
  end

end
