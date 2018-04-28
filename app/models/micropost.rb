class Micropost < ApplicationRecord
  # Relationships
  belongs_to :user
  # Validations
  validates :content, length: { minimum: 1, maximum: 280 },
                      presence: true
  validates :user_id, presence: true   
  # Scopes
  default_scope -> { order(created_at: :desc) }

end
