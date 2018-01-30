class Card < ApplicationRecord
  belongs_to :citation
  belongs_to :structured_argument

  def as_json
    {
      id: id,
      tag: tag,
      card_text: card_text,
      user_id: user_id,
      citation_id: citation_id,
      bibliography: bibliography
    }
  end

  def bibliography
    "#{citation["author_last"]}, #{citation["author_first"]}, #{citation["article_date"]}, '#{citation["article_title"]}',"
  end


end
