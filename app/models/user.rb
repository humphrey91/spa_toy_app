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
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github twitter google_oauth2]
           
  # Scopes
  default_scope -> { order(created_at: :asc) }
  # Name Helper
  attr_accessor :name  
  after_initialize do |user|
    self.name = "#{first_name} #{last_name}"
  end
  # Pagination Setting
  self.per_page = 15

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|    
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"]
        user = User.set_main_data(data, user)
        user.provider = "github"
      elsif data = session["devise.gplus_data"]
        user = User.set_main_data(data, user)
        user.provider = "google_oauth2"
      end
    end
  end


  # Set User Data From Omniauth
  def self.set_main_data(data, user)
    user.email = data["info"]["email"] if user.email.blank?
    first_name = data["info"]["name"].split[0]
    last_name = data["info"]["name"].split[1]
    user.first_name = first_name if user.first_name.blank?
    user.last_name = last_name  if user.last_name.blank?
    user.image = data["info"]["image"]  if user.image.blank?
    user.uid = data["uid"]
    user
  end
  
  
  # Search Function
  def self.search(search)    
    if search.split(" ").length > 1
      @search = search.split(" ")
      where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR first_name ILIKE ? AND last_name ILIKE ?",
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{@search[0]}%", "%#{@search[1]}%") 
    else

      where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?",
          "%#{search}%", "%#{search}%", "%#{search}%") 
    end
  end

  private

  # Make sure names are saved capped
  def cap_name 
    self.first_name = first_name.capitalize if attribute_present?("first_name")
    self.last_name = last_name.capitalize if attribute_present?("last_name")
  end

end
