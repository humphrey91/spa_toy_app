class User < ApplicationRecord
  # Relationships
  has_many :microposts, dependent: :destroy
  # Validations
  validates :first_name, presence: true,
                         length: { maximum: 20 }
  validates :last_name, presence: true,
                        length: { maximum: 20 }     
  before_validation :cap_name             
  # Devise User Attributes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Scopes
  default_scope -> { order(created_at: :asc) }
  # Name Helper
  attr_accessor :name  
  after_initialize do |user|
    self.name = "#{first_name} #{last_name}"
  end
  # Pagination Setting
  self.per_page = 15
  
  # Search Function
  def self.search(search)    
    if search.split(" ").length > 1
      @search = search.split(" ")
    end
    where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR first_name ILIKE ? AND last_name ILIKE ?",
          "%#{search}%", "%#{search}%", "%#{search}%", "%#{@search[0]}%", "%#{@search[1]}%") 
  end

  private

  # Make sure names are saved capped
  def cap_name 
    self.first_name = first_name.capitalize if attribute_present?("first_name")
    self.last_name = last_name.capitalize if attribute_present?("last_name")
  end

end
