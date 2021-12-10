class Snippet < ApplicationRecord
  scope :latest, -> { order(created: :desc).first(10) }
end
