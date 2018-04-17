class User < ApplicationRecord
  # Relationships
  has_many :microposts
  # Validations
  validates :first_name, presence: true,
                         length: { maximum: 20 }
  validates :last_name, presence: true,
                        length: { maximum: 20 }     
  before_validation :cap_name             
  # Devise User Attributes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def cap_name 
    self.first_name = first_name.capitalize if attribute_present?("first_name")
    self.last_name = last_name.capitalize if attribute_present?("last_name")
  end

end
