class Review < ApplicationRecord
  belongs_to :book
  validates :reviewer, presence: true
  validates :body, presence: true
end
