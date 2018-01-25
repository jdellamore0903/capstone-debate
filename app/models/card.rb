class Card < ApplicationRecord
  belongs_to :citation

  def as_json
    {
      id: id,
      tag: tag,
      card_text: card_text,
      user_id: user_id,
      citation_id: citation_id,
      bibliography: bibliography,
      argument_id: argument_id
    }
  end

  def bibliography
    "#{citation["author_last"]}, #{citation["author_first"]}, #{citation["article_date"]}, '#{citation["article_title"]}',"
  end


end
