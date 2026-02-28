class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # not shorter than 5 characters
  validates :comment, length: { minimum: 6 }

  # each movie can only be once in a list
  validates :movie, uniqueness: {
    scope: :list_id,
    message: "Already bookmarked in this list"
  }
end
