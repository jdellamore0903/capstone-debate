class Speech < ApplicationRecord
  belongs_to :debate
  has_many :structured_arguments
  has_many :free_forms

  def as_json
    {
      id: id,
      affirmative?: affirmative?,
      user_id: user_id,
      speech_title: speech_title,
      debate_id: debate_id,
      structured_arguments: structured_arguments.as_json,
      free_forms: free_forms
    }
  end
end
