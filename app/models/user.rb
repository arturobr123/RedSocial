class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  validates :username, presence: true, uniqueness: true, length: {in: 3..12}
  validate :validate_username_regex

  has_many :posts

  def self.from_omniauth(auth) #checa si ya existe, sino crea un nuevo usuario
  	where(provider: auth[:provider],uid: auth[:uid]).first_or_create do |user|
  		if auth[:info]
  			user.email = auth[:info][:email]
  			user.name = auth[:info][:name] 
  			
  		end

  		user.password = Devise.friendly_token[0,20]

  	end
  end

  private
  def validate_username_regex
    unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9]*\z/
      errors.add(:username, "el username debe iniciar con una letra")
      errors.add(:username, "el username sòlo puede contener _,letras y nùmeros")
      
    end
    
  end


end
