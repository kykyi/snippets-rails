class Snippet < ApplicationRecord
  scope :latest, -> { order(created: :desc).first(10) }

  validates :content, :expires, presence: true
  validates :title, length: {minimum: 1, maximum: 100}
end
