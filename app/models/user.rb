class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  validates :username, presence: true, uniqueness: true, length: {in: 3..12}
  validate :validate_username_regex

  has_many :posts
  has_many :friendships
  has_many :followers, class_name: "Friendship", foreign_key: "friend_id"

  has_many :friends_added, through: :friendships, source: :friend
  has_many :friends_who_added, through: :friendships, source: :user

  has_attached_file :avatar,styles: {thumb:"100x100",medium:"300x300"},default_url:"/images/:style/programador.jpg"
  validates_attachment_content_type :avatar,content_type: /\Aimage\/.*\Z/

  has_attached_file :cover,styles: {thumb:"400x300",medium:"800x600"},default_url:"/images/:style/missing_cover.png"
  validates_attachment_content_type :cover,content_type: /\Aimage\/.*\Z/

  def unviewed_notifications_count
    Notification.for_user(self.id)
    
  end

  def friend_ids
    #Yo soy el user
    printf "ENTRO A FRIENDSID"
    Friendship.active.where(user:self).pluck(:friend_id)
    
  end

  def user_ids
    Friendship.active.where(friend:self).pluck(:user_id)
    
  end



  def self.from_omniauth(auth) #checa si ya existe, sino crea un nuevo usuario
  	where(provider: auth[:provider],uid: auth[:uid]).first_or_create do |user|
  		if auth[:info]
  			user.email = auth[:info][:email]
  			user.name = auth[:info][:name] 
  			
  		end

  		user.password = Devise.friendly_token[0,20]

  	end
  end

  def my_friend?(friend)
    Friendship.friends?(self,friend)
    
  end

  private
  def validate_username_regex
    unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9]*\z/
      errors.add(:username, "el username debe iniciar con una letra")
      errors.add(:username, "el username sòlo puede contener _,letras y nùmeros")
      
    end
    
  end


end
