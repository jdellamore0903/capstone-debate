class StructuredArgument < ApplicationRecord
  belongs_to :speech
  has_many :cards

  def as_json
    {
      id: id,
      argument_name: argument_name,
      user_id: user_id,
      speech_id: speech_id,
      cards: cards.as_json
    }
  end
end
