class Card < ApplicationRecord
  belongs_to :citation

  def as_json
    {
      id: id,
      tag: tag,
      card_text: card_text,
      argument_type: argument_type,
      user_id: user_id,
      citation_id: citation_id,
      bibliography: bibliography,
      debate_id: debate_id,
      topic_id: topic_id,
      speech_id: speech_id
    }
  end

  def bibliography
    "#{citation["author_last"]}, #{citation["author_first"]}, #{citation["article_date"]}, '#{citation["article_title"]}',"
  end


end
