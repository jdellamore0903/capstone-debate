class CitationComment < ApplicationRecord
  belongs_to :citation

  validates :citation_id, presence: true
  validates :comment, presence: true
  validates :positive, presence: true

end
