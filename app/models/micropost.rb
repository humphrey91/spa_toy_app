class Micropost < ApplicationRecord
  # Relationships
  belongs_to :user
  # Validations
  validates :content, length: { minimum: 1, maximum: 140 },
                      presence: true
  validates :user_id, presence: true   
  # Scopes
  default_scope -> { order(created_at: :desc) }
  self.per_page = 5
end
