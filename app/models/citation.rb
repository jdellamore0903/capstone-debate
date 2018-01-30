class Citation < ApplicationRecord
  has_many :cards
  has_many :citation_comments

  validates :author_first, presence: true
  validates :author_last, presence: true
  validates :article_title, presence: true
  validates :article_date, presence: true

  def as_json
    {
      id: id,
      author_first: author_first,
      author_last: author_last,
      url_link: url_link,
      up_vote: up_vote,
      down_vote: down_vote,
      citation_comments: citation_comments
    }
    
  end

  
end

