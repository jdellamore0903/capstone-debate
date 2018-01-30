class Debate < ApplicationRecord
  belongs_to :topic
  has_many :speeches

  def as_json
    {
      id: id,
      aff_user_id: aff_user_id,
      neg_user_id: neg_user_id,
      affirmative_votes: affirmative_votes,
      negative_votes: negative_votes,
      topic_id: topic_id,
      open?: determine_open,
      speeches: speeches.as_json
    }
  end

  def determine_open
    if aff_user_id
      if neg_user_id
        return true
      else
        return false
      end
    else
      return false
    end
  end

end
