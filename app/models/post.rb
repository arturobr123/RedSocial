class Post < ApplicationRecord
  include Notificable

  belongs_to :user #user_id
  scope :nuevos, ->{order("created_at desc")}
  after_create :send_to_action_cable

  def self.all_for_user(user)
	Post.where(user_id: user.id)
		.or(Post.where(user_id: user.friend_ids))
		.or(Post.where(user_id: user.user_ids))

	
  end

  def user_ids
    self.user.friend_ids + self.user.user_ids
    
  end

  private
    def send_to_action_cable
    	
      data = {message:to_html, action:"new_post"}

      #yo agrege
  	  self.user.friend_ids.each do |friend_id|
        printf "AMIGOSSSSSSSSSSSS"
  	  	ActionCable.server.broadcast "posts_#{friend_id}", data
    	end

      # a mi me agregaron
  	  self.user.user_ids.each do |friend_id|
        ActionCable.server.broadcast "posts_#{friend_id}", data
    	end
    	
    end

    def to_html
    	printf "ENTROoooooooooooooooooooooooooo0000"
    	ApplicationController.renderer.render(partial:"posts/post",locals: {post:self})
   	
    end
	

end

#CRUD: crear, leer, actualizar y eliminar
#1:N
#Post solo podia tener un usuario belong_to
#Usuario podia tener muchos post  has_many
=begin
	1 Mis propias publicaciones => user_id = 28
	2 Las de mis amigos =>
		*user_id => amistad.friend_id
		*user_id => user.friend_id
		*Amistad fue aceptada
=end

