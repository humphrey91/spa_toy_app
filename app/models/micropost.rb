class Micropost < ApplicationRecord
  # Relationships
  belongs_to :user
  # Validations
  validates :content, length: { minimum: 1, maximum: 140 },
                      presnece: true
end
