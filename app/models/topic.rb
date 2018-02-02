class Topic < ApplicationRecord
  has_many :debates
  def as_json
    {
      id: id,
      user_id: user_id,
      topic_title: topic_title,
      prior_aff_votes: prior_aff_votes,
      prior_neg_votes: prior_neg_votes,
      debates: debates.as_json,
      number_of_debates: debates.length
    }
  end
    
end
