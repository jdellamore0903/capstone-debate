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
      user_id: 1,
      affirmative?: true,
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
    debate = Debate.find_by(id: params[:debate_id])
    speeches = Speech.where(debate_id: params[:debate_id])
    p '__________________'
    p debate
    p speeches
    render json: speeches.as_json
  end

  def commit_speech
    p '-----------'
    p params
    p '-----------'

    p '-----------'
    p params["_json"][0]["debate_id"]
    p params["_json"][0]["speech"]
    p '-----------'

    speech = Speech.new({
      speech_title: params["_json"][0]["speech"],
      debate_id: params["_json"][0]["debate_id"],
      user_id: 1
      })
    speech.save
    speech_id = speech.as_json[:id]
    iteration = params["_json"].length - 1
    index = 1
    p '-----------'
    p params["_json"][index]["title"]
    p '----------'
    iteration.times do 
      structured_argument = StructuredArgument.new({
        argument_name: params["_json"][index]["title"],
        user_id: 1,
        speech_id: speech_id
        })
      structured_argument.save
      structured_argument_id = structured_argument.as_json[:id]

      
      iteration2 = params["_json"][index]["cards"].length
      index1 = 0
      iteration2.times do
        citation = Citation.new({
          author_first: params["_json"][index]["cards"][index1]["authorFirst"],
          author_last: params["_json"][index]["cards"][index1]["authorLast"],
          url_link: params["_json"][index]["cards"][index1]["URL"],
          up_vote: 0,
          down_vote: 0, 
          article_title: params["_json"][index]["cards"][index1]["articleTitle"],
          article_date: params["_json"][index]["cards"][index1]["articleDate"]
          })
        citation.save
        citation_id = citation.as_json[:id]

        card = Card.new({
          tag: params["_json"][index]["cards"][index1]["tag"],
          citation_id: citation_id, 
          card_text: params["_json"][index]["cards"][index1]["cardText"],
          user_id: 1,
          structured_argument_id: structured_argument_id 
          })
        card.save
        index1 += 1
      end
      index += 1
    end
    render json: {speech_id: speech_id}
  
  end

end
