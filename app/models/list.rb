class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # Name list is unique and not blank
  validates :name, uniqueness: true, presence: true
end
